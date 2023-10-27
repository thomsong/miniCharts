public class Env {
    @IsTest
    public static void XXX() {
        System.debug('test.test');
        Assert.areNotEqual(true, false, 'asset msg');
    }

    @IsTest
    public static void XXX2() {
        System.debug('test.test2');
        Assert.areNotEqual(true, false, 'asset msg');
    }

    public static String get(String key) {
        return System.env(key);
    }
}