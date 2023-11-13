public with sharing class MiniChartsIcons {
    public static Map<String, Integer> usedIcons = new Map<String, Integer>();
    public static String getIcon(String name) {
        return MiniChartsIcons.getIcon('internal', name);
    }

    public static String getIcon(String namespace, String name) {
        String key = namespace + '_' + name;
        Integer iconIdx = MiniChartsIcons.usedIcons.get(key);

        if (iconIdx == null) {
            iconIdx = MiniChartsIcons.usedIcons.size() + 1;
            MiniChartsIcons.usedIcons.put(key, iconIdx);
        }

        return 'i' + iconIdx;
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
        
        for(String icon: MiniChartsIcons.usedIcons.keySet()) {
            String[] parts = icon.split('_');
            Integer idx = MiniChartsIcons.usedIcons.get(icon);
            symbols += MiniChartsIcons.getIconSymbol(idx, parts[0], parts[1]) + '\n';
        }

        return symbols + '</defs>';
    }
}