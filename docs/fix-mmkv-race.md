# 修复:悬浮键盘联动与皮肤浅深色跟随失效(MMKV 类初始化竞态)

> 基线:WeType Tool v2.1.5 (versionCode 710) × 微信输入法 4.0.1 (59201)
> 补丁产物:WeType-Tool-v2.1.5-p4-patched.apk(versionCode 714,自签)
> 上游仓库仅发布编译产物、无源码,本修复以 smali 补丁方式实施。
> 状态:主要功能已在 realme GT Neo5 (Android 16 / ColorOS 16.0.5.1310 / LSPosed 2.2.1) 实机验证通过。

## 现象(诊断包 wetype.log,2026-11-19 22:37)

- `bottom_bar / floating_mode_read_failed`:悬浮键盘状态读取失败,悬浮联动失效(`mode_ready=false`)
- `theme / material_night_read_failed`:输入法皮肤浅深色读取失败,回退系统浅深色
- 根因堆栈:`NoClassDefFoundError: e7.A`,由 `UnsatisfiedLinkError`(内含
  `NullPointerException: context.getDir(...) on a null object reference at s6.g.n(LoadLibrary.java:4)`)引发
- 因类污染的连带效应:按键下滑手势、常用语读取、键盘布局预览等依赖同一 MMKV 链路的功能全部失效

## 根因链

1. 模块在 `ImeCandidateView.onLayout` 的 `onPreDraw` 监听中反射读取宿主悬浮键盘状态
   (`float.h` 静态访问器)与材质浅深色(`skin.e.l()`)。
2. 该链路级联触发宿主 MMKV 类初始化:`float.h.<clinit>` → `WxImeUIUtil.<clinit>` →
   `skin.e.l()` → `UIUtils.r/t/S` → `ImeMMKV(O6.a)` → `e7.A(MultiProcessMMKV).<clinit>`。
3. `e7.A.<clinit>` 经宿主 `s6.g`(LoadLibrary 包装)加载 `libmmkv.so`,Context 取自
   `e7.u.b()`(MMApplicationContext):优先 `WxHldService.K.p0()`(getBaseContext),否则回退
   静态 `a`。此刻 `b()` 返回 null(服务生命周期竞态)→ `getDir("recovery_lib")` NPE →
   包装为 `UnsatisfiedLinkError`。
4. `<clinit>` 失败后 `e7.A` 进入 erroneous 状态,**进程内永久不可恢复**,此后所有 MMKV 访问
   抛 `NoClassDefFoundError`——模块各项读取持续失败,宿主自身 MMKV 使用也被连坐。
5. 诊断重启后 ~2 秒内即复现,每次输入法进程启动均如此(非偶发)。

## 补丁设计(最终版 v4)

新增 `wetypefix/MmkvGuard.smali`,在两条读取路径的共同入口(监听器 `:cond_0` 处)插入守卫:

```
invoke-static {p0}, Lwetypefix/MmkvGuard;->check(Landroid/view/View;)Z
move-result v1
if-eqz v1, :goto_0        # 未就绪 → 跳过本次读取(返回 true,走模块既有回退)
```

`MmkvGuard.check(View)` 逻辑(全部反射,经宿主 classloader 解析 `e7.u`):

1. 调用 `e7.u.b()`:非 null → MMKV 可安全触碰,缓存就绪标志并放行;
2. 为 null → 一次性调用 `e7.u.o(view.context.applicationContext)` 补上静态 Context
   (宿主自身初始化入口,幂等),**复查 `b()`**:仍为 null 则跳过本次读取(防污染),
   成功则放行;
3. 守卫自身抛异常时放行(保持模块原始行为,不因补丁引入新故障)。

效果:就绪前不触碰 MMKV 依赖链(消除类污染);宿主就绪后读取自动恢复,功能可用。

### 悬浮键盘底栏隐藏开关(新增功能)

在监听器悬浮状态读取结果处追加拦截:

```
invoke-virtual {v1}, <floating-reader>;-><read>()Z
move-result v1
invoke-static {v1}, Lwetypefix/MmkvGuard;->applyFloatingSwitch(I)I
move-result v1
```

开关存于 Android 全局设置(免 root,重开键盘生效):

```shell
adb shell settings put global wetypefix_keep_floating_bar 1   # 底栏常显(不自动隐藏)
adb shell settings put global wetypefix_keep_floating_bar 0   # 恢复默认(悬浮键盘自动隐藏)
```

## 调试历程中的重要教训

- **smali try/catch 布局**:try 块最后一条指令若非 return/throw/branch,会顺序落入
  `.catch` handler 的 `move-exception`,ART 校验直接 `VerifyError: Can flow through to
  move-exception`。由于注入点在 `onPreDraw`,该错误会让输入法进程每次启动即崩(键盘无法
  拉起)。修复:try_end 后加显式 `goto` 再落 handler。(p2 → p3)
- **模块版本号是 dex 内部硬编码**,诊断包头显示"2.1.5 (710)"不代表运行的不是补丁版;
  判断补丁是否加载应看进程 `/proc/<pid>/maps` 中的 APK 路径或注入类的可观测行为。
- LSPosed 的 `modules_config.db`(含 WAL)在模块重装后可能保留旧 APK 路径记录,模块实际
  加载路径以 PackageManager 为准。

## 文件

- `patches/v2.1.5/original/`:原版监听器 smali(内容锚点 `bottom_bar_floating_changed`)
- `patches/v2.1.5/patched/`:补丁后监听器 + `MmkvGuard.smali`
- `patches/v2.1.5/listener-guard.diff`:监听器注入 diff(2 处:守卫 + 悬浮开关)

## 构建复现

```shell
apktool d -f -o module-decoded WeType-Tool-v2.1.5.apk
# 1. 新增 smali/wetypefix/MmkvGuard.smali(见 patches/v2.1.5/patched/)
# 2. 按 patches/v2.1.5/listener-guard.diff 修改监听器 smali
# 3. 删除 AndroidManifest.xml 中 android:enableOnBackInvokedCallback
#    (apktool 3.0.3 框架不识别,可安全移除)
# 4. apktool.yml: versionCode 710→714, versionName 2.1.5→2.1.5-p4
apktool b module-decoded -o patched-unsigned.apk
zipalign -f -p 4 patched-unsigned.apk patched-aligned.apk
apksigner sign --ks <自签keystore> --out WeType-Tool-v2.1.5-p4-patched.apk patched-aligned.apk
```

## 安装注意

- 补丁版签名不同,需先卸载原模块再安装;后续补丁迭代可 `adb install -r` 同签名覆盖。
- 包名不变,LSPosed 启用状态与作用域保留;模块配置存于宿主 `com.tencent.wetype`
  的数据目录,重装模块不丢失。
- 上游发新版后需按同思路重打补丁(定位锚点:诊断包堆栈的 `onPreDraw` r8-map-id 类 +
  内容锚点 `bottom_bar_floating_changed`)。

## 遗留事项

- **内嵌自动填充呈现层**:系统侧链路已验证正常(autofill 服务 Keyguard 配置完成;
  autofill 会话状态含 `INLINE_SHOWN`,即 inline 请求已创建、响应已被输入法接受),
  但工具栏未见建议条,待实机截图确认是否被宿主工具栏内容覆盖/遮挡。前置条件
  (README):工具栏需添加"收起键盘"按钮;LSPosed 需勾选"系统框架"作用域并重启设备(已做)。
