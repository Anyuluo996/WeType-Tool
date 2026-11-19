# 修复:悬浮键盘联动与皮肤浅深色跟随失效(MMKV 类初始化竞态)

> 基线:WeType Tool v2.1.5 (versionCode 710) × 微信输入法 4.0.1 (59201)
> 补丁产物:WeType-Tool-v2.1.5-p1-patched.apk(versionCode 711,versionName 2.1.5-p1)
> 上游仓库仅发布编译产物、无源码,本修复以 smali 补丁方式实施。

## 现象(诊断包 wetype.log,2026-11-19 22:37)

- `bottom_bar / floating_mode_read_failed`:悬浮键盘状态读取失败,悬浮联动失效(`mode_ready=false`)
- `theme / material_night_read_failed`:输入法皮肤浅深色读取失败,回退系统浅深色
- 根因堆栈:`NoClassDefFoundError: e7.A`,由 `UnsatisfiedLinkError`(内含
  `NullPointerException: context.getDir(...) on a null object reference at s6.g.n(LoadLibrary.java:4)`)引发

## 根因链

1. 模块在 `ImeCandidateView.onLayout` 的 `onPreDraw` 监听中反射读取宿主悬浮键盘状态
   (`float.h` 静态访问器)与材质浅深色(`skin.e.l()`)。
2. 该链路级联触发宿主 MMKV 类初始化:`float.h.<clinit>` → `WxImeUIUtil.<clinit>` →
   `skin.e.l()` → `UIUtils.r/t/S` → `ImeMMKV(O6.a)` → `e7.A(MultiProcessMMKV).<clinit>`。
3. `e7.A.<clinit>` 经宿主 `s6.g`(LoadLibrary 包装)加载 `libmmkv.so`,Context 取自
   `e7.u.b()`(MMApplicationContext):优先 `WxHldService.K.p0()`(getBaseContext),否则回退
   静态 `a`。此刻 `b()` 返回 null(服务生命周期竞态/`getBaseContext()` 尚未就绪)→
   `getDir("recovery_lib")` NPE → 包装为 `UnsatisfiedLinkError`。
4. `<clinit>` 失败后 `e7.A` 进入 erroneous 状态,**进程内永久不可恢复**,此后所有 MMKV 访问
   抛 `NoClassDefFoundError`——两项读取持续失败,宿主自身 MMKV 使用也被连坐。
5. 诊断重启后 ~2 秒内即复现,说明每次输入法进程启动均如此(非偶发)。

## 补丁设计

新增 `wetypefix/MmkvGuard.smali`,在两条读取路径的共同入口(监听器 `:cond_0` 处)插入守卫:

```
invoke-static {p0}, Lwetypefix/MmkvGuard;->check(Landroid/view/View;)Z
move-result v1
if-eqz v1, :goto_0        # 未就绪 → 跳过本次读取(返回 true,走模块既有回退)
```

`MmkvGuard.check(View)` 逻辑(全部反射,经宿主 classloader 解析 `e7.u`):

1. 调用 `e7.u.b()`:非 null → MMKV 可安全触碰,缓存就绪标志并放行;
2. 为 null → 一次性调用 `e7.u.o(view.context.applicationContext)` 补上静态 Context
   (宿主自身初始化入口,幂等),随后放行;若仍失败则不读取;
3. 守卫自身抛异常时放行(保持模块原始行为,不因补丁引入新故障)。

效果:就绪前不触碰 MMKV 依赖链(消除类污染);宿主就绪后读取自动恢复,功能可用;
即使极端场景下始终不就绪,也只维持优雅降级,不再毒化宿主类。

## 文件

- `patches/v2.1.5/original/`:原版监听器 smali(锚点 `bottom_bar_floating_changed`)
- `patches/v2.1.5/patched/`:补丁后监听器 + 新增 `MmkvGuard.smali`
- `patches/v2.1.5/listener-guard.diff`:监听器唯一注入点 diff(6 行)

## 构建复现

```shell
apktool d -f -o module-decoded WeType-Tool-v2.1.5.apk
# 按 patches/v2.1.5 应用两处 smali 改动,并删除 AndroidManifest.xml 中
# android:enableOnBackInvokedCallback(apktool 3.0.3 框架不识别,可安全移除)
# apktool.yml: versionCode 710→711, versionName 2.1.5→2.1.5-p1
apktool b module-decoded -o patched-unsigned.apk
zipalign -f -p 4 patched-unsigned.apk patched-aligned.apk
apksigner sign --ks <自签keystore> --out WeType-Tool-v2.1.5-p1-patched.apk patched-aligned.apk
```

## 安装注意

- 补丁版签名不同,需先卸载原模块再安装;LSPosed 中包名不变,启用状态与作用域保留。
- 模块自身配置存于宿主 `com.tencent.wetype` 的 `shared_prefs`(`wetype_settings.xml`),
  重装模块不丢失配置。
- 上游发新版后需按同思路重打补丁(方法:以诊断包堆栈锚点定位监听器类,内容锚点
  `bottom_bar_floating_changed`)。
