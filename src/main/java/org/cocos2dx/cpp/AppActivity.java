package org.cocos2dx.cpp;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Toast;

/**
 * Created by moogle on 2017/1/13.
 */

public class AppActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        Toast.makeText(this.getApplicationContext(), "启动Activity成功",Toast.LENGTH_SHORT);
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
