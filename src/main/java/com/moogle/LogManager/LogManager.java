package com.moogle.LogManager;

/**
 * Created by moogle on 2017/4/5.
 */

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.lang.*;

public class LogManager implements Thread.UncaughtExceptionHandler
{
    public static final String handlerTag = "LogHandler";
    public static final String savePath = "pujiaError";

    private  static LogManager instanse = new LogManager();

    private Context mContext;
    private Map<String, String> infos = new HashMap<String, String>();

    private DateFormat loggerFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
    private String loggerName;
    private String packageName;
    private Thread.UncaughtExceptionHandler mDefaultHandler;

    private LogManager(){

    }
    public static LogManager GetInstance(){
        return instanse;
    }

    public  void initHandler (Context _context){
        mContext = _context;
        mDefaultHandler = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(this);
        loggerName = "LoggerName";
        packageName = _context.getPackageName();

    }
    @Override
    public void uncaughtException(Thread thread, Throwable throwable)
    {
        if (handleException(throwable) && mDefaultHandler != null){
            mDefaultHandler.uncaughtException(thread,throwable);
        }
        else{
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                Log.e(handlerTag, "error : ", e);
            }
            // 退出程序
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(0);
        }

    }
    private boolean handleException(Throwable ex)
    {
        if (ex == null){return  false;}
        new Thread() {
            @Override
            public void run() {
                Looper.prepare();
                Toast.makeText(mContext, "很抱歉,程序出现异常,正在收集日志，即将退出", Toast.LENGTH_LONG)
                        .show();
                Looper.loop();
            }
        }.start();
        this.CollectDeviceInfo(mContext);
        // 保存日志文件
        this.SaveCrashLog(ex);
        return true;

    }
    public void CollectDeviceInfo(Context _context)
    {
        try
        {
            PackageManager pm = _context.getPackageManager();
            PackageInfo pinfo = pm.getPackageInfo(_context.getPackageName(),
                                PackageManager.GET_ACTIVITIES);
            boolean googleInstalled = new Boolean (CheckPlayServiceInstalled(_context));
            if (pinfo != null){
                String versionName = pinfo.versionName == null ? "Null": pinfo.versionName;
                String versionCode = pinfo.versionCode + "";
                infos.put("versionName", versionName);
                infos.put("versionCode", versionCode);
                infos.put("pid",String.format("%d",android.os.Process.myPid()));
                infos.put("googlePlayInstalled",Boolean.toString(googleInstalled));

            }
        }
        catch (PackageManager.NameNotFoundException ex)
        {
            Log.e(handlerTag, "Collect Device Info Error",ex);
        }

        java.lang.reflect.Field[] fields = Build.class.getDeclaredFields();
        for (java.lang.reflect.Field field : fields) {
            try {
                field.setAccessible(true);
                infos.put(field.getName(), field.get(null).toString());
                Log.d(handlerTag, field.getName() + " : " + field.get(null));
            } catch (Exception e) {
                Log.e(handlerTag, "an error occured when collect crash info", e);
            }
        }

    }
    private boolean CheckPlayServiceInstalled(Context _context){
        boolean result = false;
        //判断play服务

        String gmsClassName = "com.google.android.gms.common.api.GoogleApiClient";
        try {
            Class.forName(gmsClassName);
            result = true;
        }
        catch (ClassNotFoundException e){
            return false;
        }



        return result;

    }
    private void SaveCrashLog(Throwable ex){
        //获取设备信息
        StringBuilder stringBuilder = new StringBuilder();
        for (Map.Entry<String, String> entry : infos.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            stringBuilder.append("[" + key + "] = " + value + "\r\n");
        }
        //获取错误信息
        Writer writer = new StringWriter();
        PrintWriter printWriter = new PrintWriter(writer);
        ex.printStackTrace(printWriter);
        Throwable cause = ex.getCause();
        while (cause != null) {
            cause.printStackTrace(printWriter);
            cause = cause.getCause();
        }
        printWriter.close();
        String result = writer.toString();

        stringBuilder.append(result);

        try{
            Log.d(handlerTag,"Saving log...");
            long timestamp = System.currentTimeMillis();
            String time = loggerFormatter.format(new Date());
            String fileName = packageName + "-" + time + "-" + timestamp
                    + ".log";

            String path = Environment.getExternalStorageDirectory().getAbsolutePath() +
                            "/" + savePath + "/";
            File dir = new File(path);
            if (!dir.exists()){
                dir.mkdirs();
            }
            FileOutputStream fos = new FileOutputStream(path + fileName);
            fos.write(stringBuilder.toString().getBytes());
            fos.close();
            Log.d(handlerTag,String.format("Log save to %s", path + fileName));


        }
        catch (Exception e){
            Log.e(handlerTag, "log file saving error, no permission? ",e);
        }



    }

}
