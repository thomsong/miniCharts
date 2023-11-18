public with sharing class BaseGraphDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props, String graphHTML) {
        Integer pct = Math.round(Math.random() * 100);

        ///////////////////////////////////////////////////////
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String titleHTML = '';
        if (true) {
            titleHTML = ''
                + '<t s="sm">'
                    + '<l>' + 'Win Rate' + '</l>'
                    + '<l class="tar">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</l>'
                + '</t>';
        }
        
        ///////////////////////////////////////////////////////
        String xLabelsHTML = '';
        if (true) {
            xLabelsHTML = ''
                + '<d class="_x-labels fxr jcsb">'
                    +'<l>Jan 22</l>'
                    + '<l class="tar">Dec 22</l>'
                + '</d>';
        }

        ///////////////////////////////////////////////////////
        String yLabelsHTML = '';
        if (true) {
            yLabelsHTML = ''
                + '<d class="_y-labels fxc jcsb">'
                    + '<l><cur u="M">100</cur></l>'
                    + '<l><cur>0</cur></l>'
                    + '<l><cur n="1" u="M">100</cur></l>'
                + '</d>';
        }

        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<b style="--d-percent-value:' + pct + '%">';
            output += titleHTML;
            output += '<d class="fg fxr">';
                output += yLabelsHTML;
                output += '<d class="_graph-container fg">';
                    output += '<d class="graph">';
                        output += graphHTML;
                    output += '</d>';
                    // output += '<d class="_y-baseline-marker"/>';
                output += '</d>';
            output += '</d>';
            output += xLabelsHTML;
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    
    public static String getStyle() {return '--b2:0px;--b1:0px;--b0:0px;&:has(t){--b2:13px;}&:has(t[s="sm"]){--b2:11px;}&:has(.bz1){--b1:11px;}&:has(.bz0){--b0:32px;}--b3:calc(var(--h-px) - var(--b2) - var(--b1));container-type:inline-size;& b{width:100%;height:var(--h-px);& t{height:var(--b2);& l:first-of-type{padding-right:1ch;}}}.bz2{position:relative;height:var(--b3);container-type:size;}.bz1{font-size:8px;height:var(--b1);margin-left:var(--b0);}.bz0{& l{width:var(--b0);padding-right:2px;text-align:right;}font-size:8px;height:var(--b3);}&.sz1{--b0:0px !important;.bz0{display:none;}&:has(t){--b1:0px !important;.bz1{display:none;}}}&.sz2 .bz0 l:first-child:nth-last-child(3) + l{display:none;}}@container (max-width:70px){& b{--b0:0px !important;}.bz0{display:none;}}';}

    /* COMPRESSED STATIC RENDER */
    public static String render(Map<String, Object> props, String graphHTML) {
        Integer pct = Math.round(Math.random() * 100);
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String titleHTML = '';
        if (true) {
            titleHTML = '<t s="sm"><l>Win Rate</l><l class="tar">'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</l></t>';
        }
        String xLabelsHTML = '';
        if (true) {
            xLabelsHTML = '<d class="bz1 fxr jcsb"><l>Jan 22</l><l class="tar">Dec 22</l></d>';
        }
        String yLabelsHTML = '';
        if (true) {
            yLabelsHTML = '<d class="bz0 fxc jcsb"><l><cur u="M">100</cur></l><l><cur>0</cur></l><l><cur n="1" u="M">100</cur></l></d>';
        }
        return '<b style="--d-percent-value:'+pct+'%">'+titleHTML+'<d class="fg fxr">'+yLabelsHTML+'<d class="bz2 fg"><d class="graph">'+graphHTML+'</d></d></d>'+xLabelsHTML+'</b>';
    }
}