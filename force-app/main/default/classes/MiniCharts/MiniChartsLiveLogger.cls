public  class MiniChartsLiveLogger {
    public MiniChartsLiveLogger() {}

    public static void log(Object msg) {
        if (MiniChartsRenderController.DEBUG == false) {
            return;
        }
        
        System.debug(msg);

        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();

        req.setEndpoint('https://minicharts.app/log/');
        req.setMethod('POST');
        req.setBody(json.serialize(msg));
        
        try {
            res = http.send(req);
        } catch(System.CalloutException e) {
            System.debug('Callout error: '+ e);
            System.debug(res.toString());
        }
    }

    public static void log(String debugMsg, Object msg) {
        MiniChartsLiveLogger.log(debugMsg);
        MiniChartsLiveLogger.log(msg);
    }
}