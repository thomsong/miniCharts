public with sharing class MiniChartsCache {
    public static String getCacheKey(String type, String key) {
        String cacheKey = type + '::' + key;
        String cacheKeyHash = EncodingUtil.convertToHex(Crypto.generateDigest('MD5', Blob.valueOf(cacheKey)));
        
        String cacheNamespace = MiniChartsRenderController.namespace == '' ? 'local' : MiniChartsRenderController.namespace;
        String cachePartition = 'miniCharts';

        return cacheNamespace + '.' + cachePartition + '.' + cacheKeyHash;
    }

    public static Object get(String type, String key) {
        String cacheKey = getCacheKey(type, key);
        System.debug('cacheKey: ' + cacheKey);
        return Cache.Org.get(cacheKey);
    }

    public static void put(String type, String key, Object value, Integer ttlSecs) {
        String cacheKey = getCacheKey(type, key);
        Cache.Org.put(cacheKey,value, ttlSecs);
    }
}