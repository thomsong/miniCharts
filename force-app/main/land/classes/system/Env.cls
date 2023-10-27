public class Env {
    public static String get(String key) {
        return System.env(key);
    }
}