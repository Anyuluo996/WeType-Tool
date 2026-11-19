# 修复:悬浮键盘联动与皮肤浅深色跟随失效(MMKV 类初始化竞态)+ 内嵌自动填充 end 锚点缺失

> 基线:WeType Tool v2.1.5 (versionCode 710) × 微信输入法 4.0.1 (59201)
> 补丁产物:WeType-Tool-v2.1.5-p7-patched.apk(versionCode 717,自签;p4=714 悬浮/皮肤,p6=716 内嵌自动填充,p7=717 芯片防覆盖图标)
> 上游仓库仅发布编译产物、无源码,本修复以 smali 补丁方式实施。
> 状态:主要功能 + 内嵌自动填充已在 realme GT Neo5 (Android 16 / ColorOS 16.0.5.1310 / LSPosed 2.2.1) 实机验证通过。

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
- `patches/v2.1.5/patched/`:补丁后监听器 + `MmkvGuard.smali` + `EndAnchor.smali`
  + 补丁后内嵌自动填充处理器 smali
- `patches/v2.1.5/listener-guard.diff`:监听器注入 diff(2 处:守卫 + 悬浮开关)
- `patches/v2.1.5/handler-endanchor.diff`:内嵌自动填充处理器注入 diff(1 处:end 锚回退)
- `patches/v2.1.5/holder-clamp.diff`:芯片 holder 定位钳制 diff(4 处:字段 + 构造器初始化 + 可见图标右缘钳制)

## 构建复现

```shell
apktool d -f -o module-decoded WeType-Tool-v2.1.5.apk
# 1. 新增 smali/wetypefix/MmkvGuard.smali 与 smali/wetypefix/EndAnchor.smali
#    (见 patches/v2.1.5/patched/)
# 2. 按 patches/v2.1.5/listener-guard.diff 修改监听器 smali;
#    按 handler-endanchor.diff / holder-clamp.diff 修改另两处
# 3. 按 patches/v2.1.5/handler-endanchor.diff 修改内嵌自动填充处理器 smali
# 4. 删除 AndroidManifest.xml 中 android:enableOnBackInvokedCallback
#    (apktool 3.0.3 框架不识别,可安全移除)
# 5. apktool.yml: versionCode 710→717, versionName 2.1.5→2.1.5-p7
# 6. 每次构建前删除 module-decoded/build/(apktool 缓存 build/resources.zip
#    会导致仅改 smali 时 manifest 版本号不更新)
apktool b module-decoded -o patched-unsigned.apk
zipalign -f -p 4 patched-unsigned.apk patched-aligned.apk
apksigner sign --ks <自签keystore> --out WeType-Tool-v2.1.5-p6-patched.apk patched-aligned.apk
```

## 安装注意

- 补丁版签名不同,需先卸载原模块再安装;后续补丁迭代可 `adb install -r` 同签名覆盖。
- 包名不变,LSPosed 启用状态与作用域保留;模块配置存于宿主 `com.tencent.wetype`
  的数据目录,重装模块不丢失。
- 上游发新版后需按同思路重打补丁(定位锚点:诊断包堆栈的 `onPreDraw` r8-map-id 类 +
  内容锚点 `bottom_bar_floating_changed`)。

## 内嵌自动填充 end 锚点修复(p6)

### 根因(此前记录的 end_missing,定位后与"19 个子视图"的早期猜测不符)

- 挂载例程实际收集的是**候选栏容器**:递归遍历 decor 树,收集类名为
  `com.tencent.wetype.plugin.hld.candidate.ImeCandidateView` 且可见的 RelativeLayout,
  数量必须恰好 1(0→candidate_not_visible,>1→candidate_ambiguous)。
- 4 个锚点 ID(middle/end/logo/logo_image)由模块经 DexKit 在宿主插件 dex 中解析
  R$id 字段获得(toolbar_ids_ready 事件回显实际值,4.0.1 上 end=2131296691),解析本身成功。
- 失败点:候选栏容器内 `findViewById(end)` 返回 null——**宿主 4.0.1 的 ImeCandidateView
  布局里已不存在 id=end 的右侧锚视图**(宿主 base APK 与插件中均无该 id 对应视图)。
  middle(候选 RecyclerView)/logo/logo_image 均在,end 单独缺失,属宿主布局结构变更。

### 修复(wetypefix/EndAnchor,handler-endanchor.diff,单 hunk)

挂载例程在 end 查找失败分支注入回退:调用 `EndAnchor.ensure(toolbar, endId)`:

- 先按 endId 复查(幂等,防重复注入);仍无则 new 一个 0 宽 ×1 高的 View,
  `setId(endId)` 后以 `ALIGN_PARENT_RIGHT` 规则加进候选栏容器,返回之。
- 布局语义:end 仅作为芯片右边界锚(芯片区间 = max(middle.left, logo.right) …
  min(middle.right, end.left),垂直按 logo 图标中心对齐),0 宽右缘锚即"芯片延伸至候选区右缘"。
- 内部 try/catchall 兜底,任何异常返回 null → 走原有错误分支,不新增崩溃路径。

### 实机验证(sj,2026-11-20 02:28)

- `toolbar_attach_state reason=attached`(原 end_missing)→ `toolbar_attached
  "自动填充建议已替换工具栏中间区域"` → `toolbar_geometry left=186 width=1054`。
- 截图确认候选栏中部渲染出密码管理器(Keyguard)的内嵌建议芯片。
- 回归:正常打字候选词正常、无新增异常、键盘弹出正常。
- 版本 716 / 2.1.5-p6;构建前删除 module-decoded/build/(apktool 缓存教训)。

## 芯片覆盖左侧图标修复(p7)

用户实测(2026-11-20 02:42):某些状态下自动填充芯片渲染在候选栏最左,盖住微信 logo 图标;
且拖动芯片到图标附近后键盘面板曾收起为工具条(宿主手势,非必现,进程重启复位)。

正常态几何恒为 left=186(候选区左缘),芯片不会覆盖图标 — 覆盖发生时宿主候选区布局
塌到最左(middle.left ≈ 35),模块几何公式的图标保护只依赖 `logo` 锚
(chip.left = max(middle.left, logo.right)),而**可见图标其实是 logo_image**,
logo 锚值过小无法挡住。

修复(holder diff,4 处):定位方法计算 chip.left 时,把 **logo_image(可见图标)右缘**
也纳入 max 钳制 — 新增 `wetypefixExtraRect` 实例字段(构造器初始化)复用,
preDraw 每帧对 logo_image 做 offsetDescendantRectToMyCoords 后
`chip.left = max(middle.left, logo.right, logo_image.right)`。

- 正常态:186 > 图标右缘,几何不变,零回归。
- 塌陷态:芯片从图标右缘起渲染,最窄不覆盖图标;若间隙不足(width ≤ 0)沿用原有隐藏分支。
- 版本 717 / 2.1.5-p7;`patches/v2.1.5/holder-clamp.diff`。

附注:锁屏指纹验证无法自动化,塌陷态需用户日常使用中观察;若再次出现"滑动芯片后键盘
收起为工具条",该行为来自宿主候选栏手势(与补丁无关,force-stop 复位),日志可佐证。

## 遗留事项

- 调试期间将模块日志等级临时调至 TRACE(设置 → 日志等级),可保留。
- 附加产物:悬浮键盘底栏常显开关(settings put global wetypefix_keep_floating_bar 1/0),
  p4 起生效。注意 apktool 会缓存 build/resources.zip,仅改 smali 时 manifest 版本号不会更新,
  每次构建前应删除 module-decoded/build/。
