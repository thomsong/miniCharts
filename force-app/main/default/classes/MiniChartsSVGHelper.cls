public with sharing class MiniChartsSVGHelper {
    public static String composeChartSVG( Integer[] canvasSize, String body) {
        return MiniChartsSVGHelper.composeChartSVG(canvasSize[0], canvasSize[1], null, body);
    }

    public static String getColorVarsSVG() {
        Map<String,String> colors = new Map<String,String>();

        colors.put('--chart-black', '#181818');
        colors.put('--chart-gray', '#706e6b');
        colors.put('--chart-purple', '#9d53f2');
        colors.put('--chart-green', '#04844b');
        colors.put('--chart-red', '#aa2422');
        colors.put('--chart-yellow', '#fcc003');
        colors.put('--chart-orange', '#f38303');
        colors.put('--chart-blue', '#3296ed');
        colors.put('--chart-dark-blue', '#0176D3');

        colors.put('--icon-disabled', '#dad6d0');

        colors.put('--text-black', '#181818');
        colors.put('--text-gray', '#706e6b');
        colors.put('--text-purple', '#9d53f2');
        colors.put('--text-green', '#2e844a');
        colors.put('--text-red', '#ba0517');
        colors.put('--text-yellow', '#fcc003');
        colors.put('--text-orange', '#f38303');
        colors.put('--text-blue', '#0176D3');

        colors.put('--highlight-red', '#ffdcdb');
        colors.put('--highlight-green', '#ddf3d3');
        colors.put('--highlight-yellow', '#fff6b9');
        colors.put('--highlight-orange', '#ffe1c1');
        colors.put('--highlight-blue', '#d4e7ff');
        colors.put('--highlight-purple', '#ecdcff');
        colors.put('--highlight-gray', '#eeeded');

        colors.put('--badge-red', '#c23934');
        colors.put('--badge-green', '#05844b');
        
        List<String> svgVars = new List<String>();
        for (String colorName : colors.keySet()) {
            svgVars.add(colorName + ': ' + colors.get(colorName));
        }
        
        return 'svg {\n' + String.join(svgVars, ';\n') + '}\n';
    }

    public static String composeChartSVG(Integer width, Integer height, String style, String body) {
        String DEFAULT_STYLE = '';
        DEFAULT_STYLE += getColorVarsSVG() + '\n';
        DEFAULT_STYLE += '<style>\nline { stroke:rgb(24, 24, 24); stroke-width: 0.5; } text {stroke:none; fill:rgb(24, 24, 24); font-size:12px; text-rendering: optimizeLegibility; dominant-baseline: hanging; font-family:-apple-system, "system-ui", "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" }\n</style>\n';

        String preserveAspectRatio = 'xMinYMin slice'; // Cut off right side
        // String preserveAspectRatio = 'xMinYMid meet'; // Scale x and y to fit
        // String preserveAspectRatio = 'none'; // Scale x to fit

        // String SVG = '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="' + width + '" height="' + height + '">';
        String SVG = '<!--  miniCharts v0.1 Generated Chart - https://miniCharts.app  -->\n\n';
        
        // SVG += '<svg xmlns="http://www.w3.org/2000/svg"  width="' + '100%' + '" height="' + height + '" viewBox="0 0 ' + width + ' ' + height + '">\n';
        // SVG += '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="' + preserveAspectRatio + '" width="' + width + '" height="' + height + '" viewBox="0 0 ' + width + ' ' + height + '">\n';
        SVG += '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="' + preserveAspectRatio + '" width="400" height="' + height + '" viewBox="0 0 ' + width + ' ' + height + '">\n';

        if (style != null && style != '') {
            SVG += DEFAULT_STYLE + '<style>\n' + style + '\n</style>\n';
        } else {
            SVG += DEFAULT_STYLE;
        }

        // if (MiniChartsRenderController.DEBUG) {
            // Add Debug Style
            SVG += '<style>rect.bg-canvas-fill {fill:rgba(255,0,0,0.1) !important;}</style>\n';
            SVG += '<style>rect.debug {fill:rgba(255,0,0,0.3) !important;}</style>\n';

            // Background to fill size
            SVG += '<rect width="' + width + '" height="' + height + '" class="bg-canvas-fill" />\n';
        // }
        
        return SVG  + body + '\n</svg>';
    }

    public MiniChartsSVGHelper() {}
}