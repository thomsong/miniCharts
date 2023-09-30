public class MiniChartsErrorDesign extends MiniChartsDesign {
    private String errMessage = '';

    public override virtual String render(List<String> params) {
        String style = '.error {fill:red; font-size:10px; }';
        String body = '<text x="0" y="16" class="error">' + this.errMessage + '</text>';

        return MiniChartsSVGHelper.composeChartSVG(200, 20, style, body);
    }

    public MiniChartsErrorDesign(String msg) {
        this.errMessage = msg;
    }
}