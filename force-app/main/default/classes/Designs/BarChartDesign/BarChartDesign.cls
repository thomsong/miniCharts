public with sharing class BarChartDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE() {
        return '<div class="body"/>';
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '';}

    /* COMPRESSED RENDER */
    public String render() {
        return '<div class="body"/>';
    }
}