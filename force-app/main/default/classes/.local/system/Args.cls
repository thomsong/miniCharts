public class Args {
    public static String get(String key) {
        List<String> args = System.args('ARGS').split('-');

        for(String arg: args) {
            List<String> argParts = arg.split('=');
            
            if (argParts.size() == 2) {
                if ((String)argParts.get(0) == key) {
                    return (String)argParts.get(1);
                }
            }
        }
        
        return '';
    }
}