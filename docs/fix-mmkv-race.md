# 修复:悬浮键盘联动与皮肤浅深色跟随失效(MMKV 类初始化竞态)+ 内嵌自动填充 end 锚点缺失

> 基线:WeType Tool v2.1.5 (versionCode 710) × 微信输入法 4.0.1 (59201)
> 补丁产物:WeType-Tool-v2.1.5-p17-patched.apk(versionCode 727,自签;p4=714 悬浮/皮肤,p6=716 内嵌自动填充,p7=717 芯片左界钳制,p10=720 surface 裁剪,p11=721 稳态,p17=727 滚动时机裁剪;p8=718 VerifyError 废弃,p9=719 setClipBounds 无效,p12-p15=722-725 甩动收起回归废弃,p16=726 回退基线)
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
# 1. 新增 smali/wetypefix/{MmkvGuard,EndAnchor,StripClip,StripClipListener}.smali
#    与补丁后的内嵌自动填充处理器/条带类 smali(见 patches/v2.1.5/patched/)
# 2. 按 listener-guard.diff / handler-endanchor.diff / holder-clamp.diff / strip-clip.diff 逐处修改;
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

## 建议条溢出覆盖图标修复(p10,真正根因)

p7 后用户实测(03:27 截图)仍覆盖。日志显示芯片容器几何一直正确(left=186),但容器内
建议条内容是**可横向滚动**的(suggestion_scroll_edges:viewport 1046 / content 1352~3317):
用户滑动后内容左移出容器,而每条建议是独立的 **InlineContentView(surface 渲染)**,
surface 内容不受视图层级画布裁剪,滚出左界的部分直接绘制在候选栏 logo 上
(scroll=150 时首 chip 左缘 = 186-150=36,与截图吻合)。p7 的容器级钳制管不到 surface 内容。

修复(`wetypefix/StripClip` + `StripClipListener`,strip-clip.diff 单 hunk):条带构造器末尾
(循环出口公共路径)在滚动容器上注册 preDraw 监听;每帧对条带 LinearLayout 每张卡片
递归查找 InlineContentView,以滚动容器可视窗口换算卡片局部坐标窗口,把 surface 裁剪
在视口内;卡片完全滚出视口 → 空裁剪 → 不绘制;全程 try/catch 兜底。

**p8(718)废弃**:首版 StripClip 循环回边寄存器类型冲突(int ↔ 对象引用)→
`VerifyError: Verifier rejected class wetypefix.StripClip`,响应处理中断、内嵌填充
完全不显示。修复:对象寄存器循环前置 null 初始化。

**p9(719)无效,两点教训**:

1. **`InlineContentView.setClipBounds` 在宿主环境是无操作**。AOSP
   `SurfaceView.setClipBounds` 开头即 early-return:
   `if (mClipSurfaceToBounds || mSurfaceControl == null) return;`(另有
   `Flags.clipSurfaceviews()` 的 RT 驱动分支同样 return)。`mClipSurfaceToBounds`
   只被 `setEnableSurfaceClipping(true)`(hide)打开,且仅 InlineContentView 的
   3 参构造器会调它——IME 侧拿到的实例不走该路径时,`setClipBounds` 静默无效。
2. 坐标换算两处方向错误:sync 右缘写成 `viewport + cardLeft`(应为
   `scrollX + viewport - cardLeft - linearLeft`);walk 递归把子级窗口写成
   `L + childLeft`(应为 `L - childLeft`)。

**p10(720)生效版**:绕过 setClipBounds,在 walk 命中 InlineContentView 处直接
`new SurfaceControl.Transaction().setWindowCrop(icv.getSurfaceControl(), rect).apply()`
(公开 API,裁剪落在 surface 状态上,不依赖任何 flag);坐标按上式修正;attach/sync
经 `android.util.Log` 标签 **WeTypeToolStrip** 输出 `w=/sx=/n=/clip=` 状态日志
(logcat 直读,不受模块日志等级控制)。

实机验证(sj,2026-11-20 04:19,wo4.ts.anyul.cn 登录页 + Keyguard 内嵌建议):
`w=1046 sx=1532 n=5 clip=5`(满滚动),截图确认 logo 无遮挡、滚出芯片只剩视口内
残端;回滑后裁剪随 sx 重算恢复,无残留;VerifyError=0;键盘/点击填充正常。

**p10(720)遗留缺陷**:芯片**完全滚出视口**再滚回后,其 surface 的位置与裁剪会被
框架冻结——日志已报 `sx=0` 而画面仍停留在 sx≈560 的残片;后续 setWindowCrop 与
位置同步都压不过该冻结态,用户截图表现为"文字带底色条覆盖在 logo 上"。

**p11(721)最终版**:walk 中对完全滚出(可视区间为空,r ≤ l)的芯片不再依赖空裁剪:

- `SurfaceControl.Transaction.setAlpha(sc, 0f)` 直接隐身该 surface(独立于位置/裁剪
  任何冻结路径);
- 同时 `setClipBounds(null)` 清掉视图侧陈旧裁剪 + `invalidate()`;
- 回到视口时 `setAlpha(1f)` 与窗口裁剪在同一事务应用,invalidate 驱动 ICV 走一次
  onDraw 的位置重同步,surface 恢复正确位置。

实机验证(sj,2026-11-20 04:33,5 颗芯片):满滚动 sx=1532 → 回滑 sx=0,芯片
"newapi anyul" 完整回到起点、精确从视口左缘开始,无残片;中间态 sx=255 尾部裁剪
精确贴边界;logo 全程无遮挡;VerifyError=0。状态日志:logcat 标签
**WeTypeToolStrip**(`w=/sx=/n=/clip=`,状态变化时输出)。

**p12(722)甩动闪现修复**:甩动时 HSV 滚动变化在绘制周期外触发
OnScrollChanged,SurfaceView 据此立即同步 surface 位置,而裁剪原本要等下一次
onPreDraw——一至两帧的空窗里"新位置 + 旧裁剪"会让芯片残端短暂闪到 logo 上。
修复:StripClipListener 同时实现 `ViewTreeObserver.OnScrollChangedListener`,
attach 时同挂 preDraw + scrollChanged 两个监听,滚动变化的那一刻即重算裁剪
(与位置同步同一调用栈、同一 vsync 合成,消除竞态窗口);onPreDraw 保留,
继续覆盖挂载/布局变化。

附注: sj 的默认输入法多次被切到搜狗(com.sohu.inputmethod.sogouoem)——**每次
`am force-stop com.tencent.wetype` 后 ColorOS 都会回退预装搜狗**,force-stop 后必须紧跟
`ime set com.tencent.wetype/.plugin.hld.WxHldService`;排查前先
`settings get secure default_input_method` 确认。

## 甩动收起回归定位(p12-p16 试错)与安全形态(p17)

p10/p11 后用户实测:快甩候选条时有一帧"新位置+旧裁剪"的文字残影闪过 logo。
p12 尝试用**根 ViewTreeObserver 的 OnScrollChangedListener** 在滚动时刻即时重算裁剪——
结果引入回归:**快甩候选条会使整个面板退出**(mInputShown=false,确定性复现;慢拖正常)。
p13/p14(dispatchTouchEvent 申请父级禁拦截)、p15(回调空操作仅保留注册)均未消除,
且 p15 收起瞬间零滚动事件——触发源与"根 VTO 滚动监听器注册"和宿主手势引擎的交互有关,
具体机制未逆向到(收起均伴随进程存活、无异常)。p16 = 精确还原 p11(撤监听器与全部
dispatch 覆写),实机确认不再退出。

**p17 安全形态**:不动根 VTO、不动 dispatch,在条带 HSV 类**自身**的 `onScrollChanged`
覆写里追加 `StripClip.sync`(HSV 本就覆写此方法同步滚动边界;现只额外响应条带自己的
滚动)——实测快甩不退出,滚动时刻裁剪即时生效,面板/填充/裁剪全量正常。

**测试陷阱**:卸载重装模块后需**重启**系统框架 hook 才生效(同签名升级安装 `install -r`
不需要);Keyguard 锁定态候选条仅 1 颗芯片、不可滚动,快甩场景无法复现——A/B 前必须解锁;
ColorOS 拒绝版本降级(`install -d` 无效),回退只能卸载重装+重启。

## 遗留事项

- 调试期间将模块日志等级临时调至 TRACE(设置 → 日志等级),可保留。
- 附加产物:悬浮键盘底栏常显开关(settings put global wetypefix_keep_floating_bar 1/0),
  p4 起生效。注意 apktool 会缓存 build/resources.zip,仅改 smali 时 manifest 版本号不会更新,
  每次构建前应删除 module-decoded/build/。
