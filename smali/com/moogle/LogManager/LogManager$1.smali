.class Lcom/moogle/LogManager/LogManager$1;
.super Ljava/lang/Thread;
.source "LogManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/moogle/LogManager/LogManager;->handleException(Ljava/lang/Throwable;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/moogle/LogManager/LogManager;


# direct methods
.method constructor <init>(Lcom/moogle/LogManager/LogManager;)V
    .locals 0
    .param p1, "this$0"    # Lcom/moogle/LogManager/LogManager;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/moogle/LogManager/LogManager$1;->this$0:Lcom/moogle/LogManager/LogManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 83
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 84
    iget-object v0, p0, Lcom/moogle/LogManager/LogManager$1;->this$0:Lcom/moogle/LogManager/LogManager;

    # getter for: Lcom/moogle/LogManager/LogManager;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/moogle/LogManager/LogManager;->access$000(Lcom/moogle/LogManager/LogManager;)Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u5f88\u62b1\u6b49,\u7a0b\u5e8f\u51fa\u73b0\u5f02\u5e38,\u6b63\u5728\u6536\u96c6\u65e5\u5fd7\uff0c\u5373\u5c06\u9000\u51fa"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 85
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 86
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 87
    return-void
.end method
