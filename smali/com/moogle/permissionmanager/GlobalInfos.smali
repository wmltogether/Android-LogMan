.class public Lcom/moogle/permissionmanager/GlobalInfos;
.super Ljava/lang/Object;
.source "GlobalInfos.java"


# static fields
.field public static Prefs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 12
    new-instance v0, Lcom/moogle/permissionmanager/GlobalInfos$1;

    invoke-direct {v0}, Lcom/moogle/permissionmanager/GlobalInfos$1;-><init>()V

    sput-object v0, Lcom/moogle/permissionmanager/GlobalInfos;->Prefs:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
