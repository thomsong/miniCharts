public class MiniChartsRenderController {
    public static Boolean DEBUG = false;
    
    private Id templateId = null;
    private Id recordId = null;
    private List<String> params = null;

    private MiniChartsDesign design = null;

    public MiniChartsRenderController() {
        MiniChartsRenderController.DEBUG = true;

        this.addResponseHeaders();
        this.parseParams();
        this.initChart();
    }

    private void initChart() {
        this.setChartDesign('Sparkline');
    }

    private void setChartDesign(String chartDesign) {
        Type chartDesignType = Type.forName('MiniCharts' + chartDesign + 'Design');
        if (chartDesignType == null) {
            this.setError('Invalid Design: ' + chartDesign);
            return;
        }

        this.design = (MiniChartsDesign)chartDesignType.newInstance();
    }

    public String getChartSVG() {
        if (design == null) {
            this.setError('MISSING DESIGN');
        }

        return design.render(this.params);
    }

    private void setError(String msg) {
        this.design = new MiniChartsErrorDesign(msg);   
    }

    private void addResponseHeaders() {
        ApexPages.currentPage().getHeaders().put('X-Powered-By', 'https://microcharts.app');
    }
    
    private void parseParams() {
        String q = System.currentPageReference().getParameters().get('q');
        if (q == null) {
            q = '';
        }

        this.params = q.split('֎', 100);

        // Get Template Id
        try {
            this.templateId = params.get(0);
        } catch (Exception e) {
            this.setError(e.getMessage());
            return;
        }

        // Get Record Id
        try {
            this.recordId = params.get(1);
        } catch (Exception e) {
            this.setError(e.getMessage());
            return;
        }

        System.debug('templateId: ' + this.templateId);
        System.debug('recordId: ' + this.recordId);

        // Get rest of params
        // Integer paramsSize = params.size();
        // System.debug(params);
    }
}