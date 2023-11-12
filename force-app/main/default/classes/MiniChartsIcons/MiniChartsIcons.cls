public with sharing class MiniChartsIcons {
    public static Set<String[]> usedIcons = new Set<String[]> ();
    public static String getIcon(String name) {
        return MiniChartsIcons.getIcon('internal', name);
    }

    public static String getIcon(String namespace, String name) {
        String idx = 'i' + MiniChartsIcons.usedIcons.size();
        MiniChartsIcons.usedIcons.add(new String[]{idx, namespace, name});
        return idx;
    }

    public static String getIconSymbol(String idx, String namespace, String name) {
        if (namespace == 'internal') {
            return MiniChartsInternalIcons.getIconSymbol(idx, name);
        } else if (namespace == 'utility') {
            return MiniChartsUtilityIcons.getIconSymbol(idx, name);
        } else if (namespace == 'user') {
            // TODO - User uploaded
        }

        return '';
    }

    public static String getUsedIconSymbols() {
        if (MiniChartsIcons.usedIcons.size() == 0) {
            return '';
        }

        String symbols = '\n<defs>\n';
        for(String[] icon: MiniChartsIcons.usedIcons) {
            symbols += MiniChartsIcons.getIconSymbol(icon[0], icon[1], icon[2]); // + '\n';
        }

        return symbols + '\n</defs>';
    }
}