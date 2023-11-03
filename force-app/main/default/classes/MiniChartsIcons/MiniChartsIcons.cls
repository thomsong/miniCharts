public with sharing class MiniChartsIcons {
    public static Set<String[]> usedIcons = new Set<String[]> ();
    public static String getIcon(String name) {
        return MiniChartsIcons.getIcon('internal', name);
    }

    public static String getIcon(String namespace, String name) {
        MiniChartsIcons.usedIcons.add(new String[]{namespace, name});
        return namespace + '-' + name;
    }

    public static String getIconSymbol(String namespace, String name) {
        if (namespace == 'internal') {
            return MiniChartsInternalIcons.getIconSymbol(name);
        } else if (namespace == 'utility') {
            return MiniChartsUtilityIcons.getIconSymbol(name);
        } else if (namespace == 'user') {
            // TODO - User uploaded
        }

        return '';
    }

    public static String getUsedIconSymbols() {
        String symbols = '\n<defs>';
        for(String[] icon: MiniChartsIcons.usedIcons) {
            symbols += MiniChartsIcons.getIconSymbol(icon[0], icon[1]); // + '\n';
        }
        
        return symbols + '</defs>\n';
    }
}