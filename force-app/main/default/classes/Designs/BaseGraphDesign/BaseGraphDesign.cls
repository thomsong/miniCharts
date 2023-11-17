public with sharing class BaseGraphDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props, String graphHTML) {
        Integer pct = Math.round(Math.random() * 100);

        ///////////////////////////////////////////////////////
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String titleHTML = '';
        if (true) {
            titleHTML = ''
                + '<t>'
                    + '<l>' + 'Win Rate' + '</l>'
                    + '<l class="tar fs0">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</l>'
                + '</t>';
        }
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<b style="--d-percent-value:' + pct + '%">';
            // output += titleHTML;
            output += '<d class="graph fg">';
                output += graphHTML;
            output += '</d>';
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    
    public static String getStyle() {return '--d-title-height:0px;&:has(t){--d-title-height:13px}--d-graph-height:calc(var(--h-px) - var(--d-title-height));& b{width:100%;height:var(--h-px);& t{height:var(--d-title-height);& l:first-of-type{padding-right:1ch}}}.graph{position:relative;height:var(--d-graph-height);container-type:size}';}

    /* COMPRESSED STATIC RENDER */
    public static String render(Map<String, Object> props, String graphHTML) {
        Integer pct = Math.round(Math.random() * 100);
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String titleHTML = '';
        if (true) {
            titleHTML = '<t><l>Win Rate</l><l class="tar fs0">'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</l></t>';
        }
        String output = '';
        output += '<b style="--d-percent-value:'+pct+'%">';
            output += '<d class="graph fg">';
                output += graphHTML;
            output += '</d>';
        output += '</b>';
        return output;
    }
}