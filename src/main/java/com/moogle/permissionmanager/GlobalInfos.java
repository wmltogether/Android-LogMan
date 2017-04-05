package com.moogle.permissionmanager;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by moogle on 2017/4/5.
 */

public class GlobalInfos {

    public static Map<String, String> Prefs = new HashMap<String, String>(){
        {
            put("JumpActivity","org.cocos2dx.cpp.AppActivity");
        }
    };
}
