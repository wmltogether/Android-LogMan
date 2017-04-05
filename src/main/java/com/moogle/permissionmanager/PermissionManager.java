package com.moogle.permissionmanager;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.AppOpsManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Binder;
import android.util.Log;
import android.widget.Toast;
import android.app.Activity;
/**
 * Created by moogle on 2017/1/13.
 */


public class PermissionManager{

    final private static String DEBUG_TAG = "PermissionManager";
    @TargetApi(23)
    public static void GetPermission(Activity activity){
        try {
            Context context = activity.getBaseContext();
            int hasWriteExternalStorage = context.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE);//权限检查
            if (hasWriteExternalStorage != PackageManager.PERMISSION_GRANTED) {
                activity.requestPermissions(new String[]{
                        Manifest.permission.READ_EXTERNAL_STORAGE,
                        Manifest.permission.WRITE_EXTERNAL_STORAGE},USER_PERMISSIONS_CODE.REQUEST_CODE_ASK_PERMISSIONS);
                Log.i(DEBUG_TAG, "没有权限，结束");
                return;//没有权限，结束
            }else {
                activity.requestPermissions(new String[]{
                        Manifest.permission.READ_EXTERNAL_STORAGE,
                        Manifest.permission.WRITE_EXTERNAL_STORAGE},USER_PERMISSIONS_CODE.REQUEST_HAS_PERMISSIONS);
                Log.i(DEBUG_TAG, "已有权限。");
                //做自己的操作
            }
        } catch (Exception e) {
            e.printStackTrace();
            Log.i(DEBUG_TAG, "无法获取外部存储权限，请手动开启!");
            Toast.makeText(activity.getApplicationContext(), "无法获取外部存储权限，请手动开启", Toast.LENGTH_LONG).show();
        }

    }
    @TargetApi(19)
    public static void GetPermissionLegacy(Activity activity){
        Context context = activity.getBaseContext();
        try
        {
            AppOpsManager appOpsManager = (AppOpsManager) context.getSystemService(Context.APP_OPS_SERVICE);
            int checkResult = appOpsManager.checkOpNoThrow(
                AppOpsManager.OPSTR_WRITE_EXTERNAL_STORAGE, Binder.getCallingUid(), context.getPackageName());
            if(checkResult == AppOpsManager.MODE_ALLOWED){
                Log.e(DEBUG_TAG,"Legacy AppOps 已有WRITE_EXTERNAL_STORAGE权限");

            }
            else if(checkResult == AppOpsManager.MODE_IGNORED){
                Log.e(DEBUG_TAG,"Legacy AppOps 权限WRITE_EXTERNAL_STORAGE被禁止");
            }
            else if(checkResult == AppOpsManager.MODE_ERRORED){
                Log.e(DEBUG_TAG,"Legacy AppOps 权限WRITE_EXTERNAL_STORAGE错误");
            }
            else{
                Log.e(DEBUG_TAG,"Legacy AppOps 权限WRITE_EXTERNAL_STORAGE需要询问");
            }


        }
        catch (Exception e) {
            Log.i(DEBUG_TAG, "Legacy AppOps 无法获取外部存储权限，请手动开启!");}


        }



}
