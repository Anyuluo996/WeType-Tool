.class public final Lwetypefix/MmkvGuard;
.super Ljava/lang/Object;
.source "MmkvGuard.java"


# static fields
.field private static a:Z

.field private static b:Z

.field private static c:I

.field private static ctx:Landroid/content/Context;

.field private static sw:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static log(Ljava/lang/String;)V
    .locals 2

    const-string v0, "WTFix"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static check(Landroid/view/View;)Z
    .locals 8

    sget-boolean v0, Lwetypefix/MmkvGuard;->b:Z

    if-nez v0, :cond_ready

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lwetypefix/MmkvGuard;->ctx:Landroid/content/Context;

    if-eqz v0, :cond_fail

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const-string v4, "e7.u"

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v3, "b"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    if-nez v3, :cond_ready_now

    sget-boolean v4, Lwetypefix/MmkvGuard;->a:Z

    if-nez v4, :cond_skip

    const/4 v4, 0x1

    sput-boolean v4, Lwetypefix/MmkvGuard;->a:Z

    const-string v3, "v2 b-null try-o"

    invoke-static {v3}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const-string v4, "com.tencent.wetype.plugin.hld.WxHldService"

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "K"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_k

    :catch_1
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    :goto_k
    const-string v3, "o"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Landroid/content/Context;

    aput-object v6, v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    if-eqz v4, :ctx_raw

    move-object v0, v4

    :ctx_raw
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/Context;

    if-nez v5, :cond_ready_now2

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_ready_now2
    const/4 v5, 0x1

    sput-boolean v5, Lwetypefix/MmkvGuard;->b:Z

    const-string v5, "ready-after-o"

    invoke-static {v5}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    const/4 v5, 0x1

    return v5
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    :cond_fail
    const/4 v0, 0x1

    return v0

    :cond_skip
    sget v4, Lwetypefix/MmkvGuard;->c:I

    add-int/lit8 v4, v4, 0x1

    sput v4, Lwetypefix/MmkvGuard;->c:I

    rem-int/lit8 v4, v4, 0x32

    if-nez v4, :cond_skip_ret

    const-string v4, "skip-still-null"

    invoke-static {v4}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    :cond_skip_ret
    const/4 v0, 0x0

    return v0

    :cond_ready_now
    const/4 v3, 0x1

    sput-boolean v3, Lwetypefix/MmkvGuard;->b:Z

    const-string v3, "ready-direct"

    invoke-static {v3}, Lwetypefix/MmkvGuard;->log(Ljava/lang/String;)V

    const/4 v3, 0x1

    return v3

    :cond_ready
    const/4 v0, 0x1

    return v0
.end method

.method public static applyFloatingSwitch(I)I
    .locals 4

    sget v0, Lwetypefix/MmkvGuard;->sw:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_have

    :try_start_0
    sget-object v0, Lwetypefix/MmkvGuard;->ctx:Landroid/content/Context;

    if-eqz v0, :cond_orig

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wetypefix_keep_floating_bar"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    sput v0, Lwetypefix/MmkvGuard;->sw:I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_have
    sget v0, Lwetypefix/MmkvGuard;->sw:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_orig

    const/4 v0, 0x0

    return v0

    :cond_orig
    return p0

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    sput v1, Lwetypefix/MmkvGuard;->sw:I

    goto/16 :cond_orig
.end method
