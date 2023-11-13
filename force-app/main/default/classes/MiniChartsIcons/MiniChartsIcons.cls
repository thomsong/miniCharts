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

        return '--_i' + iconIdx;
    }

    // public static String getIconSymbol(String namespace, String name) {
    //     if (namespace == 'internal') {
    //         return MiniChartsInternalIcons.icons.get(name);//MiniChartsInternalIcons.getIconSymbol(idx, name);
    //     } else if (namespace == 'utility') {
    //         return MiniChartsUtilityIcons.icons.get(name);//.getIconSymbol(idx, name);
    //     } else if (namespace == 'user') {
    //         // TODO - User uploaded
    //     }

    //     return '';
    // }

    public static String getUsedIconSymbols() {
        if (MiniChartsIcons.usedIcons.size() == 0) {
            return '';
        }

        String symbols = '\n:root{\n';
        
        for(String icon: MiniChartsIcons.usedIcons.keySet()) {
            String[] parts = icon.split('_');
            Integer idx = MiniChartsIcons.usedIcons.get(icon);
            String iconSvgCode = '';

            if (parts[0] == 'internal') {
                iconSvgCode +=  MiniChartsInternalIcons.icons.get(parts[1]);//MiniChartsInternalIcons.getIconSymbol(idx, name);
            } else if (parts[0] == 'utility') {
                iconSvgCode +=  MiniChartsUtilityIcons.icons.get(parts[1]);//.getIconSymbol(idx, name);
            } else if (parts[0] == 'user') {
                // TODO - User uploaded
            }


            symbols += '--_i' + idx + ':url("data:image/svg+xml;base64,'
                + EncodingUtil.Base64Encode(
                    Blob.valueOf(
                        '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52" preserveAspectRatio="xMinYMin">'
                            + iconSvgCode
                        + '</svg>'
                    )
                )
                + '");\n';
        }

        return symbols + '}';
    }
}