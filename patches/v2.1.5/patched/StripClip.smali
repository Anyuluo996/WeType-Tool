.class public Lwetypefix/StripClip;
.super Ljava/lang/Object;
.source "StripClip.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 3

    :try_start_0
    new-instance v0, Lwetypefix/StripClipListener;

    invoke-direct {v0, p0, p1}, Lwetypefix/StripClipListener;-><init>(Landroid/view/View;Landroid/view/ViewGroup;)V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method public static sync(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 8

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_end

    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_loop
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_end

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int v5, v1, v5

    add-int v6, v1, v0

    sub-int v6, v6, v5

    invoke-static {v3, v5, v6}, Lwetypefix/StripClip;->walk(Landroid/view/View;II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_loop

    :cond_end
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    return-void
.end method

.method private static walk(Landroid/view/View;III)V
    .locals 8

    instance-of v0, p0, Landroid/widget/inline/InlineContentView;

    if-eqz v0, :cond_children

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_children

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    if-lez v2, :cond_children

    const/4 v3, 0x0

    invoke-static {p2, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    move-result v5

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v4, v3, v5, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    check-cast p0, Landroid/widget/inline/InlineContentView;

    invoke-virtual {p0, v6}, Landroid/widget/inline/InlineContentView;->setClipBounds(Landroid/graphics/Rect;)V

    :cond_children
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_ret

    check-cast p0, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_loop
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_ret

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int/2addr v3, p1

    invoke-static {v1, v3, p2, p3}, Lwetypefix/StripClip;->walk(Landroid/view/View;III)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_loop

    :cond_ret
    return-void
.end method
