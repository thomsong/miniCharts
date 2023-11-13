public with sharing class MiniChartsIcons {
    public static Set<String> usedIcons = new Set<String>();
    public static String getIcon(String name) {
        return MiniChartsIcons.getIcon('internal', name);
    }

    public static String getIcon(String namespace, String name) {
        MiniChartsIcons.usedIcons.add(namespace + '.' + name);
        return 'i' + MiniChartsIcons.usedIcons.size();
    }

    public static String getIconSymbol(Integer idx, String namespace, String name) {
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
        Integer idx = 0;
        for(String icon: MiniChartsIcons.usedIcons) {
            List<String> parts = icon.split('.');

            idx++;
            symbols += MiniChartsIcons.getIconSymbol(idx, (String)parts.get(0), (String)parts.get(1)); // + '\n';
        }

        return symbols + '\n</defs>';
    }
}