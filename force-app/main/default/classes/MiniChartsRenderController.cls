public class MiniChartsRenderController {
    private String errMessage = null;

    private Id templateId = null;
    private Id recordId = null;

    public String getChartSVG() {
        if (this.errMessage != null) {
            return this.renderError(this.errMessage);
        }
       
        String output = '🇺🇸 United States';
        Integer width = 200;
        Integer height = 20;
        return '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMinYMin slice" width="' + width + '" height="' + height + '" viewBox="0 0 ' + width + ' ' + height + '" stroke-width="1.5" stroke="blue" fill="rgba(0, 0, 255, .2)"><style>.small {stroke:none; fill:rgb(24, 24, 24); font-size:14px; font-family:-apple-system, "system-ui", "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" }</style><rect width="' + width + '" height="' + height + '" style="fill: transparent; stroke: transparent" class="sparkline--interaction-layer"></rect><text x="0" y="16" class="small">&#127464;&#127462; Canada</text></svg>';
    }

    private String renderError(String msg) {
        Integer width = 200;
        Integer height = 20;
        return '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" preserveAspectRatio="xMinYMin slice" width="' + width + '" height="' + height + '" viewBox="0 0 ' + width + ' ' + height + '" stroke-width="1.5" stroke="blue" fill="rgba(0, 0, 255, .2)"><style>.small {stroke:none; fill:rgb(24, 24, 24); font-size:14px; font-family:-apple-system, "system-ui", "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" }</style><rect width="' + width + '" height="' + height + '" style="fill: transparent; stroke: transparent" class="sparkline--interaction-layer"></rect><text x="0" y="16" class="small">' + 'ERR: ' + msg + '</text></svg>';
    }

    private void addResponseHeaders() {
        ApexPages.currentPage().getHeaders().put('X-Powered-By', 'https://microcharts.app');
    }
    
    private void parseParams() {
        String q = System.currentPageReference().getParameters().get('q');
        if (q == null) {
            q = '';
        }

        List<String> params = q.split('֎', 100);

        // Get Template Id
        try {
            this.templateId = params.get(0);
        } catch (Exception e) {
            errMessage = e.getMessage();
            return;
        }

        // Get Record Id
        try {
            this.recordId = params.get(1);
        } catch (Exception e) {
            errMessage = e.getMessage();
            return;
        }

        System.debug('templateId: ' + this.templateId);
        System.debug('recordId: ' + this.recordId);

        // Get rest of params
        // Integer paramsSize = params.size();
        // System.debug(params);
    }

    public MiniChartsRenderController() {
        this.addResponseHeaders();
        this.parseParams();
    }
}