.class public final Lwetypefix/MmkvGuard;
.super Ljava/lang/Object;
.source "MmkvGuard.java"


# static fields
.field private static a:Z

.field private static volatile b:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static check(Landroid/view/View;)Z
    .locals 6

    sget-boolean v0, Lwetypefix/MmkvGuard;->b:Z

    if-nez v0, :cond_ready

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_fail

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const-string v2, "e7.u"

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    if-nez v2, :cond_ready_now

    sget-boolean v3, Lwetypefix/MmkvGuard;->a:Z

    if-nez v3, :cond_fail

    const/4 v3, 0x1

    sput-boolean v3, Lwetypefix/MmkvGuard;->a:Z

    const-string v3, "o"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v5, Landroid/content/Context;

    aput-object v5, v4, v2

    invoke-virtual {v1, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :ctx_raw

    move-object v0, v2

    :ctx_raw
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    return v0

    :cond_ready_now
    const/4 v0, 0x1

    sput-boolean v0, Lwetypefix/MmkvGuard;->b:Z

    const/4 v0, 0x1

    return v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :cond_fail
    const/4 v0, 0x1

    return v0

    :cond_ready
    const/4 v0, 0x1

    return v0
.end method
