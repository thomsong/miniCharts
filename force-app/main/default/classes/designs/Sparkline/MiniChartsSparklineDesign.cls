public class MiniChartsSparklineDesign extends MiniChartsDesign {
    public override virtual String render(List<String> params) {
        String CSS_STYLE = '.medium{fill:blue;font-size:12px}';
        String body = '<text x="0" y="15" class="medium">&#127464;&#127462; Canada</text>';

        return MiniChartsSVGHelper.composeChartSVG(200, 50, CSS_STYLE, body);
    }

    public MiniChartsSparklineDesign() { }
}
