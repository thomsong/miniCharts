public class LocalChartHarness {
    public static void renderSVG() {
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        String svg = renderer.renderSVG();

        svg = svg.replace('GaugeDesign', '_c1');
        System.debug(svg);
        System.debug('<!-- ' + svg.length() + ' -->');
    }
}