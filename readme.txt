用法说明：
复制文件夹到smali中

对smali做如下修改
AndroidManifest.xml里加入两个权限 

<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

添加自己的启动activity
<activity android:configChanges="keyboardHidden|orientation|screenSize" android:label="@string/app_name" android:launchMode="singleTask" android:name="com.moogle.permissionmanager.MainActivity" android:screenOrientation="portrait" android:theme="@android:style/Theme.NoTitleBar.Fullscreen">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
把原始的启动activity去掉intent-filter

接下来修改smali
com/moogle/permissionmanager/GlobalInfos$1.smali中

查找
    const-string v0, "JumpActivity"

    const-string v1, "org.cocos2dx.cpp.AppActivity"

把org.cocos2dx.cpp.AppActivity改成自己的启动AppActivity类名

保存并编译

崩溃记录会保存在
sdcard0的 pujiaError目录，文件名方式是"包名_崩溃时间.log"

