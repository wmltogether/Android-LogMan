package com.moogle.permissionmanager;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.moogle.LogManager.LogManager;

import org.cocos2dx.cpp.AppActivity;


public class MainActivity extends Activity {

    final private String JumpActivity = GlobalInfos.Prefs.get("JumpActivity");

    final private String DEBUG_TAG = "PermissionManager";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Log.i(DEBUG_TAG, "Getting Permissions!");
        if (Build.VERSION.SDK_INT >= 23){
            this.GetPermissionDialog();
            StartActivity();
        }
        else if (Build.VERSION.SDK_INT <=22 && Build.VERSION.SDK_INT <= 19){
            Log.i(DEBUG_TAG, "This is an Android 4.4-5.1- Device! Checking AppOps old API");
            PermissionManager.GetPermissionLegacy(this);
            StartActivity();
        }
        else{
            Log.i(DEBUG_TAG, "This is an Android 4.x- Device! return to Activity");
            StartActivity();
        }


    }

    private void StartActivity(){
        try {
            Intent intent = new Intent();
            intent.setPackage(getPackageName());
            LogManager logManager = LogManager.GetInstance();
            logManager.initHandler(this);

            /* 指定intent要启动的类 */
            intent.setClass(this, Class.forName(JumpActivity));
            /* 启动一个新的Activity */
            Log.i(DEBUG_TAG, String.format("Starting %s!",JumpActivity));
            Toast.makeText(this, "Starting...", Toast.LENGTH_LONG).show();
            finish();
            startActivity(intent);

        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
    private  void GetPermissionDialog(){
        if (Build.VERSION.SDK_INT >= 23){
            Log.i(DEBUG_TAG, "Your Android Ver is 6.0+, getting Permission");
            PermissionManager.GetPermission(this);
        }
        
    }


    @Override
    @TargetApi(23)
    public void onRequestPermissionsResult(int requestCode,
                                           String permissions[], int[] grantResults) {
        switch (requestCode) {
            case USER_PERMISSIONS_CODE.REQUEST_CODE_ASK_PERMISSIONS: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    // permission was granted, yay! Do the
                    // contacts-related task you need to do.
                    Toast.makeText(this, "存储权限已获取", Toast.LENGTH_LONG).show();

                    Log.i(DEBUG_TAG, "user granted the permission!");
                    this.StartActivity();
                }
                else {

                    // permission denied, boo! Disable the
                    // functionality that depends on this permission.
                    Toast.makeText(this, "存储权限已拒绝，这会造成无法存档", Toast.LENGTH_LONG).show();

                    Log.i(DEBUG_TAG, "user denied the permission!");
                }
                return;
            }
            case USER_PERMISSIONS_CODE.REQUEST_HAS_PERMISSIONS: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    // permission was granted, yay! Do the
                    // contacts-related task you need to do.
                    Toast.makeText(this, "存储权限已获取", Toast.LENGTH_LONG).show();

                    Log.i(DEBUG_TAG, "user granted the permission!");
                    this.StartActivity();
                }
                else {

                    // permission denied, boo! Disable the
                    // functionality that depends on this permission.
                    Toast.makeText(this, "存储权限已拒绝，这会造成无法存档", Toast.LENGTH_LONG).show();

                    Log.i(DEBUG_TAG, "user denied the permission!");
                }
                return;
            }
            default:
                super.onRequestPermissionsResult(requestCode, permissions, grantResults);
                Log.i(DEBUG_TAG, "default onRequestPermissionsResult!");
                return;

            // other 'case' lines to check for other
            // permissions this app might request
        }
    }
}
