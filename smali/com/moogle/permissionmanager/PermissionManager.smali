.class public Lcom/moogle/permissionmanager/PermissionManager;
.super Ljava/lang/Object;
.source "PermissionManager.java"


# static fields
.field private static final DEBUG_TAG:Ljava/lang/String; = "PermissionManager"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static GetPermission(Landroid/app/Activity;)V
    .locals 7
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 23
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 24
    .local v0, "context":Landroid/content/Context;
    const-string v3, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {v0, v3}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v2

    .line 25
    .local v2, "hasWriteExternalStorage":I
    if-eqz v2, :cond_0

    .line 26
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v5, v3, v4

    const/16 v4, 0x7b

    invoke-virtual {p0, v3, v4}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 29
    const-string v3, "PermissionManager"

    const-string v4, "\u6ca1\u6709\u6743\u9650\uff0c\u7ed3\u675f"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .end local v0    # "context":Landroid/content/Context;
    .end local v2    # "hasWriteExternalStorage":I
    :goto_0
    return-void

    .line 32
    .restart local v0    # "context":Landroid/content/Context;
    .restart local v2    # "hasWriteExternalStorage":I
    :cond_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v5, v3, v4

    const/16 v4, 0xea

    invoke-virtual {p0, v3, v4}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 35
    const-string v3, "PermissionManager"

    const-string v4, "\u5df2\u6709\u6743\u9650\u3002"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 38
    .end local v0    # "context":Landroid/content/Context;
    .end local v2    # "hasWriteExternalStorage":I
    :catch_0
    move-exception v1

    .line 39
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 40
    const-string v3, "PermissionManager"

    const-string v4, "\u65e0\u6cd5\u83b7\u53d6\u5916\u90e8\u5b58\u50a8\u6743\u9650\uff0c\u8bf7\u624b\u52a8\u5f00\u542f!"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "\u65e0\u6cd5\u83b7\u53d6\u5916\u90e8\u5b58\u50a8\u6743\u9650\uff0c\u8bf7\u624b\u52a8\u5f00\u542f"

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public static GetPermissionLegacy(Landroid/app/Activity;)V
    .locals 7
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .line 50
    .local v2, "context":Landroid/content/Context;
    :try_start_0
    const-string v4, "appops"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .line 51
    .local v0, "appOpsManager":Landroid/app/AppOpsManager;
    const-string v4, "android:write_external_storage"

    .line 52
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v5

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 51
    invoke-virtual {v0, v4, v5, v6}, Landroid/app/AppOpsManager;->checkOpNoThrow(Ljava/lang/String;ILjava/lang/String;)I

    move-result v1

    .line 53
    .local v1, "checkResult":I
    if-nez v1, :cond_0

    .line 54
    const-string v4, "PermissionManager"

    const-string v5, "Legacy AppOps \u5df2\u6709WRITE_EXTERNAL_STORAGE\u6743\u9650"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .end local v0    # "appOpsManager":Landroid/app/AppOpsManager;
    .end local v1    # "checkResult":I
    :goto_0
    return-void

    .line 57
    .restart local v0    # "appOpsManager":Landroid/app/AppOpsManager;
    .restart local v1    # "checkResult":I
    :cond_0
    const/4 v4, 0x1

    if-ne v1, v4, :cond_1

    .line 58
    const-string v4, "PermissionManager"

    const-string v5, "Legacy AppOps \u6743\u9650WRITE_EXTERNAL_STORAGE\u88ab\u7981\u6b62"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 69
    .end local v0    # "appOpsManager":Landroid/app/AppOpsManager;
    .end local v1    # "checkResult":I
    :catch_0
    move-exception v3

    .line 70
    .local v3, "e":Ljava/lang/Exception;
    const-string v4, "PermissionManager"

    const-string v5, "Legacy AppOps \u65e0\u6cd5\u83b7\u53d6\u5916\u90e8\u5b58\u50a8\u6743\u9650\uff0c\u8bf7\u624b\u52a8\u5f00\u542f!"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 60
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v0    # "appOpsManager":Landroid/app/AppOpsManager;
    .restart local v1    # "checkResult":I
    :cond_1
    const/4 v4, 0x2

    if-ne v1, v4, :cond_2

    .line 61
    :try_start_1
    const-string v4, "PermissionManager"

    const-string v5, "Legacy AppOps \u6743\u9650WRITE_EXTERNAL_STORAGE\u9519\u8bef"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 64
    :cond_2
    const-string v4, "PermissionManager"

    const-string v5, "Legacy AppOps \u6743\u9650WRITE_EXTERNAL_STORAGE\u9700\u8981\u8be2\u95ee"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
