public with sharing class TextDesign implements MiniChartsDesign {
    private String RENDER_TEMPLATE() {
        return '<div class="body" style="">'
        + 'Test Label'
        + '</div>';
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '';}

    /* COMPRESSED RENDER */
    public String render() {
        return '<div class="body" style="">Test Label</div>';
    }
}