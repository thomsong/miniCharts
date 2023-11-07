public class LocalChartHarness {
    public static void renderSVG() {
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        String svg = renderer.renderSVG();
        System.debug(svg);
        System.debug('<!-- ' + svg.length() + ' -->');
    }
}