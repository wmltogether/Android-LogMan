.class final Lcom/moogle/permissionmanager/GlobalInfos$1;
.super Ljava/util/HashMap;
.source "GlobalInfos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/moogle/permissionmanager/GlobalInfos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 14
    const-string v0, "JumpActivity"

    const-string v1, "org.cocos2dx.cpp.AppActivity"

    invoke-virtual {p0, v0, v1}, Lcom/moogle/permissionmanager/GlobalInfos$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    return-void
.end method
