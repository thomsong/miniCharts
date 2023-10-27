public with sharing class MiniChartsLiveLogger {
    public enum Level { LOG, WARN, DEBUG, ERROR, INFO }

    public static Boolean initialized = false;
    public static Integer logIdx = 0;

    public static void init() {
        if (MiniChartsRenderController.DEBUG) {
            String xDebugHeader = ApexPages.currentPage().getHeaders().get('x-Debug');
            if (xDebugHeader != null && xDebugHeader.toLowerCase() == 'true') {
                ApexPages.currentPage().getHeaders().put('x-Debug', 'True');

                initialized = true;
            }
        }
    }
    
    public static void sendLog(List<Object> objs, Level lvl) {
        if (!initialized) {
            return;
        }
        
        String levelName = 'log';
        switch on lvl {
            when WARN {
                levelName = 'wan';
            }
            when DEBUG {
                levelName = 'debug';
            }
            when INFO {
                levelName = 'info';
            }
            when ERROR {
                levelName = 'error';
            }
        }

        ApexPages.currentPage().getHeaders().put('X-Debug-' + (logIdx++) + '-' + levelName, json.serialize(objs));
    }

    // 1 param
    public static void log(Object obj, Level lvl) {
        sendLog(new List<Object>{obj}, lvl);
    }
    public static void log(Object obj) {
        log(obj, Level.DEBUG);
    }

    // 2 params
    public static void log(Object obj1, Object obj2, Level lvl) {
        sendLog(new List<Object>{obj1, obj2}, lvl);
    }
    public static void log(Object obj1, Object obj2) {
        log(obj1, obj2, Level.DEBUG);
    }

    // 3 params
    public static void log(Object obj1, Object obj2, Object obj3, Level lvl) {
        sendLog(new List<Object>{obj1, obj2, obj3}, lvl);
    }
    public static void log(Object obj1, Object obj2, Object obj3) {
        log(obj1, obj2, obj3, Level.DEBUG);
    }
}