public with sharing class MiniChartsSVGHelper {
    public static String composeChartSVG(Integer width, Integer height, String style, String body) {
        final String DEFAULT_STYLE = 'text {stroke:none; fill:rgb(24, 24, 24); font-size:12px; font-family:-apple-system, "system-ui", "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" }';

        String preserveAspectRatio = 'xMinYMin slice';

        String SVG = '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="' + preserveAspectRatio + '" width="' + width + '" height="' + height + '" viewBox="0 0 ' + width + ' ' + height + '">';

        SVG += '<style>' + DEFAULT_STYLE + '</style>';
        SVG += '<style>' + style + '</style>';

        if (MiniChartsRenderController.DEBUG) {
            // Add Debug Style
            SVG += '<style>.bg-fill-rect {fill:rgba(255,0,0,0.1) !important;}</style>';
        }
        
        // Background to fill size
        SVG += '<rect width="' + width + '" height="' + height + '" class="bg-fill-rect" style="fill: transparent; stroke: transparent" />';
        SVG += body;
        SVG += '</svg>';

        return SVG;
    }

    public MiniChartsSVGHelper() {}
}