.class public Lwetypefix/StripClipListener;
.super Ljava/lang/Object;
.source "StripClipListener.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# instance fields
.field private final a:Landroid/view/View;

.field private final b:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwetypefix/StripClipListener;->a:Landroid/view/View;

    iput-object p2, p0, Lwetypefix/StripClipListener;->b:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .locals 2

    iget-object v0, p0, Lwetypefix/StripClipListener;->a:Landroid/view/View;

    iget-object v1, p0, Lwetypefix/StripClipListener;->b:Landroid/view/ViewGroup;

    invoke-static {v0, v1}, Lwetypefix/StripClip;->sync(Landroid/view/View;Landroid/view/ViewGroup;)V

    const/4 v0, 0x1

    return v0
.end method

.method public final onScrollChanged(IIII)V
    .locals 2

    iget-object v0, p0, Lwetypefix/StripClipListener;->a:Landroid/view/View;

    iget-object v1, p0, Lwetypefix/StripClipListener;->b:Landroid/view/ViewGroup;

    invoke-static {v0, v1}, Lwetypefix/StripClip;->sync(Landroid/view/View;Landroid/view/ViewGroup;)V

    return-void
.end method
