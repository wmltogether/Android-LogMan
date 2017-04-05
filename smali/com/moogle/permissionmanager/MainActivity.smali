.class public Lcom/moogle/permissionmanager/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field private final DEBUG_TAG:Ljava/lang/String;

.field private final JumpActivity:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 19
    sget-object v0, Lcom/moogle/permissionmanager/GlobalInfos;->Prefs:Ljava/util/Map;

    const-string v1, "JumpActivity"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/moogle/permissionmanager/MainActivity;->JumpActivity:Ljava/lang/String;

    .line 21
    const-string v0, "PermissionManager"

    iput-object v0, p0, Lcom/moogle/permissionmanager/MainActivity;->DEBUG_TAG:Ljava/lang/String;

    return-void
.end method

.method private GetPermissionDialog()V
    .locals 2

    .prologue
    .line 66
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 67
    const-string v0, "PermissionManager"

    const-string v1, "Your Android Ver is 6.0+, getting Permission"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    invoke-static {p0}, Lcom/moogle/permissionmanager/PermissionManager;->GetPermission(Landroid/app/Activity;)V

    .line 71
    :cond_0
    return-void
.end method

.method private StartActivity()V
    .locals 8

    .prologue
    .line 46
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 47
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/moogle/permissionmanager/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    invoke-static {}, Lcom/moogle/LogManager/LogManager;->GetInstance()Lcom/moogle/LogManager/LogManager;

    move-result-object v2

    .line 49
    .local v2, "logManager":Lcom/moogle/LogManager/LogManager;
    invoke-virtual {v2, p0}, Lcom/moogle/LogManager/LogManager;->initHandler(Landroid/content/Context;)V

    .line 52
    iget-object v3, p0, Lcom/moogle/permissionmanager/MainActivity;->JumpActivity:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 54
    const-string v3, "PermissionManager"

    const-string v4, "Starting %s!"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/moogle/permissionmanager/MainActivity;->JumpActivity:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    const-string v3, "Starting..."

    const/4 v4, 0x1

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 56
    invoke-virtual {p0}, Lcom/moogle/permissionmanager/MainActivity;->finish()V

    .line 57
    invoke-virtual {p0, v1}, Lcom/moogle/permissionmanager/MainActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "logManager":Lcom/moogle/LogManager/LogManager;
    :goto_0
    return-void

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const-string v0, "PermissionManager"

    const-string v1, "Getting Permissions!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 28
    invoke-direct {p0}, Lcom/moogle/permissionmanager/MainActivity;->GetPermissionDialog()V

    .line 29
    invoke-direct {p0}, Lcom/moogle/permissionmanager/MainActivity;->StartActivity()V

    .line 42
    :goto_0
    return-void

    .line 31
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    if-gt v0, v1, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-gt v0, v1, :cond_1

    .line 32
    const-string v0, "PermissionManager"

    const-string v1, "This is an Android 4.4-5.1- Device! Checking AppOps old API"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    invoke-static {p0}, Lcom/moogle/permissionmanager/PermissionManager;->GetPermissionLegacy(Landroid/app/Activity;)V

    .line 34
    invoke-direct {p0}, Lcom/moogle/permissionmanager/MainActivity;->StartActivity()V

    goto :goto_0

    .line 37
    :cond_1
    const-string v0, "PermissionManager"

    const-string v1, "This is an Android 4.x- Device! return to Activity"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    invoke-direct {p0}, Lcom/moogle/permissionmanager/MainActivity;->StartActivity()V

    goto :goto_0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 78
    sparse-switch p1, :sswitch_data_0

    .line 124
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 125
    const-string v0, "PermissionManager"

    const-string v1, "default onRequestPermissionsResult!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    :goto_0
    return-void

    .line 81
    :sswitch_0
    array-length v0, p3

    if-lez v0, :cond_0

    aget v0, p3, v2

    if-nez v0, :cond_0

    .line 86
    const-string v0, "\u5b58\u50a8\u6743\u9650\u5df2\u83b7\u53d6"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 88
    const-string v0, "PermissionManager"

    const-string v1, "user granted the permission!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-direct {p0}, Lcom/moogle/permissionmanager/MainActivity;->StartActivity()V

    goto :goto_0

    .line 95
    :cond_0
    const-string v0, "\u5b58\u50a8\u6743\u9650\u5df2\u62d2\u7edd\uff0c\u8fd9\u4f1a\u9020\u6210\u65e0\u6cd5\u5b58\u6863"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 97
    const-string v0, "PermissionManager"

    const-string v1, "user denied the permission!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 103
    :sswitch_1
    array-length v0, p3

    if-lez v0, :cond_1

    aget v0, p3, v2

    if-nez v0, :cond_1

    .line 108
    const-string v0, "\u5b58\u50a8\u6743\u9650\u5df2\u83b7\u53d6"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 110
    const-string v0, "PermissionManager"

    const-string v1, "user granted the permission!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-direct {p0}, Lcom/moogle/permissionmanager/MainActivity;->StartActivity()V

    goto :goto_0

    .line 117
    :cond_1
    const-string v0, "\u5b58\u50a8\u6743\u9650\u5df2\u62d2\u7edd\uff0c\u8fd9\u4f1a\u9020\u6210\u65e0\u6cd5\u5b58\u6863"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 119
    const-string v0, "PermissionManager"

    const-string v1, "user denied the permission!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 78
    :sswitch_data_0
    .sparse-switch
        0x7b -> :sswitch_0
        0xea -> :sswitch_1
    .end sparse-switch
.end method
