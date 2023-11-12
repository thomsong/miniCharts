public with sharing class MiniChartsFillPatterns {
    public static Set<String> usedPatterns = new Set<String> ();
    public static String getPattern(String name) {
        MiniChartsFillPatterns.usedPatterns.add(name);
        
        return '--ptrn-' + MiniChartsFillPatterns.usedPatterns.size();
        // return '--ptrn-' + name;
    }

    public static String getPatternVars() {
        if (MiniChartsFillPatterns.usedPatterns.size() == 0) {
            return '';
        }
        
        String style = ':root{';
        Integer idx = 0;
        for(String patternName: MiniChartsFillPatterns.usedPatterns) {
            idx++;
            style += '--ptrn-' + idx +  MiniChartsFillPatterns.patterns.get(patternName);
            // style += '--ptrn-' + patternName +  MiniChartsFillPatterns.patterns.get(patternName) + '\n';
        }
        return style + '}';
    }
    
    public static Map<String, String> patterns = new Map<String, String> {
        'battery-rounded' => ':url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2217%22%20height%3D%2216%22%20viewBox%3D%220%200%2017%2016%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%227.1%22%20fill%3D%22none%22%20width%3D%222%22%20height%3D%221.6%22%2F%3E%0A%3Cpath%20d%3D%22M8.9%2C3H5.1C4.5%2C3%2C4%2C3.5%2C4%2C4.1v7.8C4%2C12.5%2C4.5%2C13%2C5.1%2C13h3.8c0.6%2C0%2C1.1-0.5%2C1.1-1.1V4.1C10%2C3.5%2C9.5%2C3%2C8.9%2C3z%22%2F%3E%0A%3Cpath%20d%3D%22M0%2C1.2v13.7C0%2C15.5%2C0.5%2C16%2C1.2%2C16h11.7c0.6%2C0%2C1.2-0.5%2C1.2-1.2v-3.3h2.2c0.5%2C0%2C0.8-0.4%2C0.8-0.8V5.3c0-0.5-0.4-0.8-0.8-0.8%0A%09l-2.2%2C0V2.1V1.2C14%2C0.5%2C13.5%2C0%2C12.8%2C0H1.2C0.5%2C0%2C0%2C0.5%2C0%2C1.2z%20M12%2C2v12H2V2H12z%22%2F%3E%0A%3C%2Fsvg%3E%0A") 3 5 3 4 fill / 3px 5px 3px 4px round stretch;'
        // 'battery-rounded' => ':url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2217%22%20height%3D%2216%22%20viewBox%3D%220%200%2017%2016%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%227.1%22%20fill%3D%22none%22%20width%3D%222%22%20height%3D%221.6%22%2F%3E%0A%3Cpath%20fill%3D%22white%22%20d%3D%22M8.9%2C3H5.1C4.5%2C3%2C4%2C3.5%2C4%2C4.1v7.8C4%2C12.5%2C4.5%2C13%2C5.1%2C13h3.8c0.6%2C0%2C1.1-0.5%2C1.1-1.1V4.1C10%2C3.5%2C9.5%2C3%2C8.9%2C3z%22%2F%3E%0A%3Cpath%20fill%3D%22white%22%20d%3D%22M0%2C1.2v13.7C0%2C15.5%2C0.5%2C16%2C1.2%2C16h11.7c0.6%2C0%2C1.2-0.5%2C1.2-1.2v-3.3h2.2c0.5%2C0%2C0.8-0.4%2C0.8-0.8V5.3c0-0.5-0.4-0.8-0.8-0.8%0A%09l-2.2%2C0V2.1V1.2C14%2C0.5%2C13.5%2C0%2C12.8%2C0H1.2C0.5%2C0%2C0%2C0.5%2C0%2C1.2z%20M12%2C2v12H2V2H12z%22%2F%3E%0A%3C%2Fsvg%3E") 3 5 3 4 fill / 3px 5px 3px 4px round stretch;'
    };   
}