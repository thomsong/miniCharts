public with sharing class MiniChartsInternalIcons {
    public static String getIconSymbol(Integer idx, String name) {
        return ' <symbol id="i' + idx + '" viewBox="0 0 52 52">' + MiniChartsInternalIcons.icons.get(name) + '</symbol>';
    }

    // public static String getIconSVG(Integer idx, String name) {
        // return ' <symbol id="i' + idx + '" viewBox="0 0 52 52">' + MiniChartsInternalIcons.icons.get(name) + '</symbol>';
    // }

    public static Map<String, String> icons = new Map<String, String> {
        'star' => '<path d="M27.4,3.1l4.6,15c0.2,0.6,0.8,0.9,1.4,0.9h15c1.5,0,2.1,2,0.9,2.9l-12.2,9c-0.5,0.4-0.7,1.1-0.5,1.7L42.4,48 c0.4,1.4-1.1,2.6-2.3,1.7L27,39.9c-0.5-0.4-1.2-0.4-1.8,0L12,49.7c-1.2,0.9-2.8-0.3-2.3-1.7l5.6-15.4c0.2-0.6,0-1.3-0.5-1.7l-12.2-9 C1.4,21,2.1,19,3.5,19h15c0.7,0,1.2-0.2,1.4-0.9L24.6,3C25,1.6,27,1.7,27.4,3.1z"/>'
    };   
}