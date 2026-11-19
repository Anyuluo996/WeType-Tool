.class public final Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;
.super Landroid/widget/HorizontalScrollView;
.source "r8-map-id-3caadcb02a6453eb392690aaf10e7d2a49e09fe2c17c51a4fe25eac390a54806"


# instance fields
.field public final synthetic ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/HorizontalScrollView;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;

    .line 5
    .line 6
    invoke-virtual {p0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲇᲈᲁ()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final onScrollChanged(IIII)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onScrollChanged(IIII)V

    move-object v0, p0

    iget-object v1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;

    iget-object v2, v1, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

    invoke-static {v0, v2}, Lwetypefix/StripClip;->sync(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;

    .line 5
    .line 6
    invoke-virtual {p0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲇᲈᲁ()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
