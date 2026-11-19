.class public final Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;
.super Landroid/widget/FrameLayout;
.source "r8-map-id-3caadcb02a6453eb392690aaf10e7d2a49e09fe2c17c51a4fe25eac390a54806"


# instance fields
.field public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

.field public ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲇᲁ:I

.field public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲇᲈ:Landroid/view/View;

.field public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲈᲇ:Landroid/view/View;

.field public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲇᲀᲈ:Ljava/util/List;

.field public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲇᲈᲀ:Lᛱᛲᛳᛴᛵᛶᛷᤝᲀᛸᲇᲁᲈᤞ;

.field public ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲀᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;

.field public ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲇᲀ:I

.field public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲁᲈ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;

.field public ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲈᲁ:Z

.field public ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲁᲀᲈ:I


# direct methods
.method public constructor <init>(Landroid/inputmethodservice/InputMethodService;)V
    .locals 9

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    const-string v1, "q7JdEZd5nqN9e7C8"

    .line 8
    .line 9
    const-string v2, "xor"

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Landroid/widget/LinearLayout;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 27
    .line 28
    .line 29
    const/16 v3, 0x10

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

    .line 35
    .line 36
    new-instance v4, Landroid/view/View;

    .line 37
    .line 38
    invoke-direct {v4, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iput-object v4, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲇᲈ:Landroid/view/View;

    .line 42
    .line 43
    new-instance v5, Landroid/view/View;

    .line 44
    .line 45
    invoke-direct {v5, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    iput-object v5, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲈᲇ:Landroid/view/View;

    .line 49
    .line 50
    filled-new-array {v4, v5}, [Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-static {v6}, Lᛱᛲᛳᛴᛵᛶᛷᲇᲀᤝᲁᲈᛸᤞ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᲀᲇᲁᲈᤞ([Ljava/lang/Object;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    iput-object v6, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲇᲀᲈ:Ljava/util/List;

    .line 59
    .line 60
    new-instance v6, Lᛱᛲᛳᛴᛵᛶᛷᤝᲀᛸᲇᲁᲈᤞ;

    .line 61
    .line 62
    const/16 v7, 0xf

    .line 63
    .line 64
    new-array v7, v7, [B

    .line 65
    .line 66
    fill-array-data v7, :array_1

    .line 67
    .line 68
    .line 69
    const-string v8, "7C1VqkJx3MQVzjiC"

    .line 70
    .line 71
    invoke-static {v7, v8, v2}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-direct {v6, v2}, Lᛱᛲᛳᛴᛵᛶᛷᤝᲀᛸᲇᲁᲈᤞ;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iput-object v6, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲇᲈᲀ:Lᛱᛲᛳᛴᛵᛶᛷᤝᲀᛸᲇᲁᲈᤞ;

    .line 79
    .line 80
    const/4 v2, -0x1

    .line 81
    iput v2, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲇᲀ:I

    .line 82
    .line 83
    new-instance v6, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;

    .line 84
    .line 85
    invoke-direct {v6, p1, p0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;-><init>(Landroid/content/Context;Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;)V

    .line 86
    .line 87
    .line 88
    iput-object v6, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲁᲈ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;

    .line 89
    .line 90
    const/16 p1, 0x8

    .line 91
    .line 92
    iput p1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲁᲀᲈ:I

    .line 93
    .line 94
    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 95
    .line 96
    .line 97
    const/high16 p1, 0x60000

    .line 98
    .line 99
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v6, v1}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 103
    .line 104
    .line 105
    const/4 p1, 0x2

    .line 106
    invoke-virtual {v6, p1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6, v1}, Landroid/widget/HorizontalScrollView;->setFillViewport(Z)V

    .line 110
    .line 111
    .line 112
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 113
    .line 114
    const/4 v7, -0x2

    .line 115
    invoke-direct {p1, v7, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v6, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 122
    .line 123
    invoke-direct {p1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 124
    .line 125
    .line 126
    const/4 v0, 0x1

    .line 127
    invoke-virtual {p0, v0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ(I)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ(I)I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    iput v2, p1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 138
    .line 139
    invoke-virtual {p0, v6, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    .line 141
    .line 142
    const/4 p1, 0x3

    .line 143
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    new-instance v2, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 148
    .line 149
    invoke-direct {v2, v4, p1}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    const/4 p1, 0x5

    .line 153
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    new-instance v4, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 158
    .line 159
    invoke-direct {v4, v5, p1}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    filled-new-array {v2, v4}, [Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-static {p1}, Lᛱᛲᛳᛴᛵᛶᛷᲇᲀᤝᲁᲈᛸᤞ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᲀᲇᲁᲈᤞ([Ljava/lang/Object;)Ljava/util/List;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    if-eqz v2, :cond_0

    .line 179
    .line 180
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    check-cast v2, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 185
    .line 186
    iget-object v4, v2, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Ljava/lang/Object;

    .line 187
    .line 188
    check-cast v4, Landroid/view/View;

    .line 189
    .line 190
    iget-object v2, v2, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲇᲁ:Ljava/lang/Object;

    .line 191
    .line 192
    check-cast v2, Ljava/lang/Number;

    .line 193
    .line 194
    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    const/4 v5, 0x4

    .line 199
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 200
    .line 201
    .line 202
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 203
    .line 204
    invoke-virtual {p0, v0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ(I)I

    .line 205
    .line 206
    .line 207
    move-result v6

    .line 208
    or-int/2addr v2, v3

    .line 209
    invoke-direct {v5, v6, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p0, v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 213
    .line 214
    .line 215
    goto :goto_0

    .line 216
    :cond_0



    # p8: clip inline suggestion surfaces to the strip viewport
    iget-object v0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲁᲈ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;

    iget-object v1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

    invoke-static {v0, v1}, Lwetypefix/StripClip;->attach(Landroid/view/View;Landroid/view/ViewGroup;)V
    return-void

    .line 217
    :array_0
    .array-data 1
        0x12t
        0x58t
        0x24t
        0x10t
        0x20t
        0x22t
        0x10t
    .end array-data

    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    :array_1
    .array-data 1
        0x5et
        0x2dt
        0x5dt
        0x3ft
        0x1ft
        0xet
        0x15t
        0x19t
        0x46t
        0x39t
        0x3et
        0x30t
        0x13t
        0x6t
        0x5t
    .end array-data
.end method


# virtual methods
.method public final getContentHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲇᲁ:I

    .line 2
    .line 3
    return p0
.end method

.method public final setSpacing(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x18

    .line 3
    .line 4
    invoke-static {p1, v0, v1}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲀᤝᲈᲁᲇᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲈᲁᲀ(III)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲁᲀᲈ:I

    .line 9
    .line 10
    invoke-virtual {p0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲇᲈ(Landroid/view/View;Landroid/widget/FrameLayout;)V
    .locals 5

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    const-string v1, "iRWl1lT7hROCdFxO"

    .line 8
    .line 9
    const-string v2, "xor"

    .line 10
    .line 11
    invoke-static {v0, v1, v2}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x7

    .line 18
    new-array v0, v0, [B

    .line 19
    .line 20
    fill-array-data v0, :array_1

    .line 21
    .line 22
    .line 23
    const-string v1, "Cx7vQGjhaimFrpNP"

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 38
    .line 39
    if-lez v1, :cond_2

    .line 40
    .line 41
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 42
    .line 43
    if-lez v1, :cond_2

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    instance-of v2, v1, Landroid/view/ViewGroup;

    .line 50
    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    check-cast v1, Landroid/view/ViewGroup;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const/4 v1, 0x0

    .line 57
    :goto_0
    if-eqz v1, :cond_1

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 63
    .line 64
    iget v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 65
    .line 66
    iget v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 67
    .line 68
    const/16 v4, 0x11

    .line 69
    .line 70
    invoke-direct {v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p2, p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    .line 75
    .line 76
    iget p1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲇᲁ:I

    .line 77
    .line 78
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 79
    .line 80
    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iput p1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲇᲁ:I

    .line 85
    .line 86
    const/4 p1, 0x0

    .line 87
    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ()V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    const/16 p0, 0x21

    .line 95
    .line 96
    new-array p0, p0, [B

    .line 97
    .line 98
    fill-array-data p0, :array_2

    .line 99
    .line 100
    .line 101
    const-string p1, "iN8MlyzqymXXQcwe"

    .line 102
    .line 103
    invoke-static {p0, p1, v2}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-static {p0}, Lᛱᛲᛳᛴᛵᛶᛷᲇᛸᲁᲈᤝᲀᤞ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲇᲈ(Ljava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_3
    const/16 p0, 0x18

    .line 112
    .line 113
    new-array p0, p0, [B

    .line 114
    .line 115
    fill-array-data p0, :array_3

    .line 116
    .line 117
    .line 118
    const-string p1, "FAD9x8ueBLMul0yg"

    .line 119
    .line 120
    invoke-static {p0, p1, v2}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Lᛱᛲᛳᛴᛵᛶᛷᲇᛸᲁᲈᤝᲀᤞ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲇᲈ(Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    nop

    .line 129
    :array_0
    .array-data 1
        0x1at
        0x3et
        0x38t
        0x18t
    .end array-data

    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    :array_1
    .array-data 1
        0x20t
        0x17t
        0x59t
        0x2t
        0x34t
        0x29t
        0x1et
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    :array_2
    .array-data 1
        -0x7ft
        -0xft
        -0x5ct
        -0x56t
        -0x3ct
        -0xet
        -0x61t
        -0x36t
        -0x3dt
        -0x7bt
        -0xat
        -0xat
        -0x49t
        -0x1t
        -0x23t
        -0x73t
        -0x2at
        -0x26t
        -0x23t
        -0x2at
        -0xet
        -0x61t
        -0x1at
        -0x8t
        -0x61t
        -0x8t
        -0x30t
        -0x43t
        -0x1ft
        -0x27t
        -0x6et
        -0x36t
        -0x2ft
    .end array-data

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    nop

    .line 165
    :array_3
    .array-data 1
        0x14t
        0x24t
        0x35t
        0x4ct
        0x11t
        0x4at
        0x10t
        0x1t
        0x62t
        0x3at
        0x2ct
        0x19t
        0x19t
        0x55t
        0x59t
        0x10t
        0x27t
        0x32t
        0x64t
        0x57t
        0xdt
        0x54t
        0x19t
        0x4bt
    .end array-data
.end method

.method public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ(I)I
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 11
    .line 12
    mul-float/2addr p1, p0

    .line 13
    invoke-static {p1}, Lᛱᛲᛳᛴᛵᛶᛷᲀᲈᤝᤞᲁᛸᲇ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲈᲀᲁ(F)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-gez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    :cond_0
    return p0
.end method

.method public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲇᲁᲈ(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲈᲁ:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲇᲁ:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲀᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲇᲀ:I

    .line 11
    .line 12
    iget-object v1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲁᲈ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;

    .line 18
    .line 19
    invoke-virtual {v1, v0, v0}, Landroid/view/View;->scrollTo(II)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    const p1, 0x33ffffff

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/high16 p1, 0x33000000

    .line 29
    .line 30
    :goto_0
    iget-object v0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲇᲈ:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲈᲇ:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲇᲈᲁ()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲇᲈᲁ()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    move v5, v4

    .line 12
    :goto_0
    if-ge v4, v2, :cond_1

    .line 13
    .line 14
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v7

    .line 22
    if-nez v7, :cond_0

    .line 23
    .line 24
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget-object v2, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲁᲈ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᛸᲁ;

    .line 36
    .line 37
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-le v5, v4, :cond_2

    .line 42
    .line 43
    move v5, v4

    .line 44
    :cond_2
    iget-object v4, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲇᲀᲈ:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-eqz v6, :cond_4

    .line 55
    .line 56
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    check-cast v6, Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    iget v8, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 67
    .line 68
    if-eq v8, v5, :cond_3

    .line 69
    .line 70
    iput v5, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 71
    .line 72
    invoke-virtual {v6, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    sget-object v4, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲁᛸᤝᲀᲇ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲇᲈ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲁᛸᤝᲀᲇ;

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getScrollX()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    .line 92
    .line 93
    const/4 v4, 0x1

    .line 94
    if-gtz v8, :cond_5

    .line 95
    .line 96
    new-instance v6, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;

    .line 97
    .line 98
    invoke-direct {v6, v3, v3}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;-><init>(ZZ)V

    .line 99
    .line 100
    .line 101
    goto :goto_4

    .line 102
    :cond_5
    sub-int/2addr v7, v8

    .line 103
    if-gez v7, :cond_6

    .line 104
    .line 105
    move v7, v3

    .line 106
    :cond_6
    new-instance v8, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;

    .line 107
    .line 108
    if-lez v7, :cond_7

    .line 109
    .line 110
    if-lez v6, :cond_7

    .line 111
    .line 112
    move v9, v4

    .line 113
    goto :goto_2

    .line 114
    :cond_7
    move v9, v3

    .line 115
    :goto_2
    if-lez v7, :cond_8

    .line 116
    .line 117
    if-ge v6, v7, :cond_8

    .line 118
    .line 119
    move v6, v4

    .line 120
    goto :goto_3

    .line 121
    :cond_8
    move v6, v3

    .line 122
    :goto_3
    invoke-direct {v8, v9, v6}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;-><init>(ZZ)V

    .line 123
    .line 124
    .line 125
    move-object v6, v8

    .line 126
    :goto_4
    const/4 v7, 0x4

    .line 127
    iget-boolean v8, v6, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲇᲈ:Z

    .line 128
    .line 129
    if-eqz v8, :cond_9

    .line 130
    .line 131
    move v9, v3

    .line 132
    goto :goto_5

    .line 133
    :cond_9
    move v9, v7

    .line 134
    :goto_5
    iget-object v10, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲇᲈ:Landroid/view/View;

    .line 135
    .line 136
    invoke-virtual {v10, v9}, Landroid/view/View;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    iget-boolean v9, v6, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ:Z

    .line 140
    .line 141
    if-eqz v9, :cond_a

    .line 142
    .line 143
    goto :goto_6

    .line 144
    :cond_a
    move v3, v7

    .line 145
    :goto_6
    iget-object v10, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲀᲈᲇ:Landroid/view/View;

    .line 146
    .line 147
    invoke-virtual {v10, v3}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    if-lez v3, :cond_c

    .line 155
    .line 156
    invoke-virtual {v1}, Landroid/view/View;->isLayoutRequested()Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_c

    .line 161
    .line 162
    iget-object v3, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲀᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;

    .line 163
    .line 164
    invoke-virtual {v6, v3}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    if-eqz v3, :cond_b

    .line 169
    .line 170
    iget v3, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲇᲀ:I

    .line 171
    .line 172
    if-eq v5, v3, :cond_c

    .line 173
    .line 174
    :cond_b
    iput-object v6, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲀᲇ:Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᲇᲁᤝᛸ;

    .line 175
    .line 176
    iput v5, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲈᲇᲀ:I

    .line 177
    .line 178
    const/16 v3, 0x17

    .line 179
    .line 180
    new-array v3, v3, [B

    .line 181
    .line 182
    fill-array-data v3, :array_0

    .line 183
    .line 184
    .line 185
    const-string v6, "BOid2tnkx9k5EAi7"

    .line 186
    .line 187
    const-string v10, "xor"

    .line 188
    .line 189
    invoke-static {v3, v6, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    const/16 v6, 0x1e

    .line 194
    .line 195
    new-array v6, v6, [B

    .line 196
    .line 197
    fill-array-data v6, :array_1

    .line 198
    .line 199
    .line 200
    const-string v11, "Z8Cyoo6IJSoruoFn"

    .line 201
    .line 202
    invoke-static {v6, v11, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    new-array v7, v7, [B

    .line 207
    .line 208
    fill-array-data v7, :array_2

    .line 209
    .line 210
    .line 211
    const-string v11, "35Io7vZeo30knuWv"

    .line 212
    .line 213
    invoke-static {v7, v11, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v7

    .line 217
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    new-instance v11, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 222
    .line 223
    invoke-direct {v11, v7, v8}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 224
    .line 225
    .line 226
    const/4 v7, 0x5

    .line 227
    new-array v8, v7, [B

    .line 228
    .line 229
    fill-array-data v8, :array_3

    .line 230
    .line 231
    .line 232
    const-string v12, "f4O96eIyBxgWqYAn"

    .line 233
    .line 234
    invoke-static {v8, v12, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    new-instance v12, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 243
    .line 244
    invoke-direct {v12, v8, v9}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    const/16 v8, 0xe

    .line 248
    .line 249
    new-array v9, v8, [B

    .line 250
    .line 251
    fill-array-data v9, :array_4

    .line 252
    .line 253
    .line 254
    const-string v13, "Sltz97LwVemg8lzC"

    .line 255
    .line 256
    invoke-static {v9, v13, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v9

    .line 260
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 261
    .line 262
    .line 263
    move-result v13

    .line 264
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 265
    .line 266
    .line 267
    move-result-object v13

    .line 268
    new-instance v14, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 269
    .line 270
    invoke-direct {v14, v9, v13}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 271
    .line 272
    .line 273
    const/16 v9, 0xd

    .line 274
    .line 275
    new-array v13, v9, [B

    .line 276
    .line 277
    fill-array-data v13, :array_5

    .line 278
    .line 279
    .line 280
    const-string v15, "5kK1MPd9ORcUxhPw"

    .line 281
    .line 282
    invoke-static {v13, v15, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v13

    .line 286
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    move-object v15, v14

    .line 295
    new-instance v14, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 296
    .line 297
    invoke-direct {v14, v13, v1}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    new-array v1, v9, [B

    .line 301
    .line 302
    fill-array-data v1, :array_6

    .line 303
    .line 304
    .line 305
    const-string v9, "JTqBF2g8o4XpaCnX"

    .line 306
    .line 307
    invoke-static {v1, v9, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-virtual {v0, v4}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ(I)I

    .line 312
    .line 313
    .line 314
    move-result v4

    .line 315
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    move-object v13, v15

    .line 320
    new-instance v15, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 321
    .line 322
    invoke-direct {v15, v1, v4}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    new-array v1, v8, [B

    .line 326
    .line 327
    fill-array-data v1, :array_7

    .line 328
    .line 329
    .line 330
    const-string v4, "wLXJGha0YnL8Bx7g"

    .line 331
    .line 332
    invoke-static {v1, v4, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v1

    .line 336
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 337
    .line 338
    .line 339
    move-result-object v4

    .line 340
    new-instance v5, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 341
    .line 342
    invoke-direct {v5, v1, v4}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 343
    .line 344
    .line 345
    const/16 v1, 0xf

    .line 346
    .line 347
    new-array v1, v1, [B

    .line 348
    .line 349
    fill-array-data v1, :array_8

    .line 350
    .line 351
    .line 352
    const-string v4, "rQBfOWFPvdxTn07t"

    .line 353
    .line 354
    invoke-static {v1, v4, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 359
    .line 360
    .line 361
    move-result v2

    .line 362
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    new-instance v4, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 367
    .line 368
    invoke-direct {v4, v1, v2}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 369
    .line 370
    .line 371
    new-array v1, v7, [B

    .line 372
    .line 373
    fill-array-data v1, :array_9

    .line 374
    .line 375
    .line 376
    const-string v2, "I8xZv3Ex3BplOw7X"

    .line 377
    .line 378
    invoke-static {v1, v2, v10}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    iget-boolean v2, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲀᲈᲁ:Z

    .line 383
    .line 384
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    new-instance v7, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 389
    .line 390
    invoke-direct {v7, v1, v2}, Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 391
    .line 392
    .line 393
    move-object/from16 v17, v4

    .line 394
    .line 395
    move-object/from16 v16, v5

    .line 396
    .line 397
    move-object/from16 v18, v7

    .line 398
    .line 399
    filled-new-array/range {v11 .. v18}, [Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    invoke-static {v1}, Lᛱᛲᛳᛴᛵᛶᛷᲀᲈᛸᲇᤞᤝᲁ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᲀᲈᤞᲁᲇ([Lᛱᛲᛳᛴᛵᛶᛷᲁᤞᛸᲀᲇᲈᤝ;)Ljava/util/Map;

    .line 404
    .line 405
    .line 406
    move-result-object v1

    .line 407
    iget-object v0, v0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲁᲇᲈᲀ:Lᛱᛲᛳᛴᛵᛶᛷᤝᲀᛸᲇᲁᲈᤞ;

    .line 408
    .line 409
    invoke-virtual {v0, v3, v6, v1}, Lᛱᛲᛳᛴᛵᛶᛷᤝᲀᛸᲇᲁᲈᤞ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲇᲈ(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 410
    .line 411
    .line 412
    :cond_c
    return-void

    .line 413
    :array_0
    .array-data 1
        0x31t
        0x3at
        0xet
        0x3t
        0x57t
        0x7t
        0x1at
        0x2t
        0x17t
        0x57t
        0x34t
        0x46t
        0x26t
        0x33t
        0x6t
        0x5bt
        0x2et
        0x10t
        0xct
        0x0t
        0x55t
        0x11t
        0x1dt
    .end array-data

    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    :array_1
    .array-data 1
        -0x41t
        -0x7dt
        -0x7t
        -0x6ft
        -0x3ft
        -0x3ft
        -0x30t
        -0x17t
        -0x3bt
        -0x4bt
        -0x2ct
        -0x18t
        -0x70t
        -0x1bt
        -0x12t
        -0x7at
        -0x1ct
        -0x7ft
        -0x5ct
        -0x14t
        -0x1dt
        -0x76t
        -0x7ft
        -0x5t
        -0x54t
        -0x38t
        -0x25t
        -0x6ct
        -0x1dt
        -0x21t
    .end array-data

    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    nop

    .line 449
    :array_2
    .array-data 1
        0x5ft
        0x50t
        0x2ft
        0x1bt
    .end array-data

    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    :array_3
    .array-data 1
        0x14t
        0x5dt
        0x28t
        0x51t
        0x42t
    .end array-data

    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    nop

    .line 463
    :array_4
    .array-data 1
        0x25t
        0x5t
        0x11t
        0xdt
        0x49t
        0x58t
        0x3et
        0x3t
        0x9t
        0x12t
        0x4t
        0x3t
        0x4ct
        0x4t
    .end array-data

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    nop

    .line 475
    :array_5
    .array-data 1
        0x56t
        0x4t
        0x25t
        0x45t
        0x28t
        0x3et
        0x10t
        0x66t
        0x38t
        0x3bt
        0x7t
        0x21t
        0x10t
    .end array-data

    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    nop

    .line 487
    :array_6
    .array-data 1
        0x2et
        0x3dt
        0x7t
        0x2bt
        0x22t
        0x57t
        0x15t
        0x67t
        0x18t
        0x5dt
        0x3ct
        0x4t
        0x9t
    .end array-data

    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    nop

    .line 499
    :array_7
    .array-data 1
        0x13t
        0x25t
        0x2et
        0x23t
        0x23t
        0xdt
        0x13t
        0x6ft
        0x31t
        0xbt
        0x25t
        0x5ft
        0x2at
        0xct
    .end array-data

    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    nop

    .line 511
    :array_8
    .array-data 1
        0x4t
        0x38t
        0x27t
        0x11t
        0x3ft
        0x38t
        0x34t
        0x24t
        0x29t
        0xct
        0x1dt
        0x3dt
        0x9t
        0x58t
        0x43t
    .end array-data

    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    :array_9
    .array-data 1
        0x27t
        0x51t
        0x1ft
        0x32t
        0x2t
    .end array-data
.end method

.method public final ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ()V
    .locals 10

    .line 1
    iget-object v0, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲈᲁᲇ:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    sub-int/2addr v1, v2

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    :goto_0
    const/4 v5, -0x1

    .line 12
    if-ge v5, v1, :cond_3

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v5

    .line 18
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const/16 v7, 0x4d

    .line 23
    .line 24
    new-array v7, v7, [B

    .line 25
    .line 26
    fill-array-data v7, :array_0

    .line 27
    .line 28
    .line 29
    const-string v8, "Bjc5ghUXQMFlhKOd"

    .line 30
    .line 31
    const-string v9, "xor"

    .line 32
    .line 33
    invoke-static {v7, v8, v9}, Lcom/vapro/vae/stringfog/StringFogRuntime;->decrypt([BLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    check-cast v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 40
    .line 41
    if-eqz v4, :cond_0

    .line 42
    .line 43
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 44
    .line 45
    .line 46
    move-result v7

    .line 47
    if-nez v7, :cond_0

    .line 48
    .line 49
    iget v7, p0, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲇᲁᲀᲈ:I

    .line 50
    .line 51
    invoke-virtual {p0, v7}, Lᛱᛲᛳᛴᛵᛶᛷᤞᲈᲀᤝᲇᲁᛸ;->ᛱᛲᛳᛴᛵᛶᛷᛸᤝᤞᲀᲁᲈᲇ(I)I

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    move v7, v3

    .line 57
    :goto_1
    invoke-virtual {v6}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    .line 58
    .line 59
    .line 60
    move-result v8

    .line 61
    if-eq v8, v7, :cond_1

    .line 62
    .line 63
    invoke-virtual {v6, v7}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-nez v5, :cond_2

    .line 74
    .line 75
    move v4, v2

    .line 76
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_3
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 1
        0x2ct
        0x1ft
        0xft
        0x59t
        0x47t
        0xbt
        0x34t
        0x36t
        0x3ft
        0x22t
        0x32t
        0x4ct
        0xat
        0x2et
        0x6ft
        0x7t
        0x23t
        0x19t
        0x17t
        0x15t
        0x13t
        0x7t
        0x75t
        0x36t
        0x3et
        0x23t
        0x6bt
        0x2t
        0x1dt
        0x27t
        0x23t
        0x44t
        0x36t
        0x13t
        0x13t
        0x50t
        0x47t
        0x9t
        0x3bt
        0x3ct
        0x23t
        0x22t
        0x2ft
        0x8t
        0x46t
        0x3ct
        0x26t
        0x0t
        0x25t
        0xft
        0x17t
        0x1bt
        0x2bt
        0x1t
        0x3bt
        0x3dt
        0x30t
        0x3ft
        0xat
        0xdt
        0x11t
        0x24t
        0x3at
        0x10t
        0x6ct
        0x26t
        0x2t
        0x4ct
        0x8t
        0x1dt
        0x21t
        0x8t
        0x30t
        0x3ft
        0x27t
        0x1t
        0x1bt
    .end array-data
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_down

    const/4 v1, 0x1

    if-eq v0, v1, :cond_up

    const/4 v1, 0x3

    if-eq v0, v1, :cond_up

    goto :goto_super

    :cond_down
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/View;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_super

    :cond_up
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->requestDisallowInterceptTouchEvent(Z)V

    :goto_super
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
