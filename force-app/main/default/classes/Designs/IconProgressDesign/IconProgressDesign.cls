public with sharing class IconProgressDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer iconCount = 100; // 50 is max?
        Decimal value = Math.random() * iconCount;
        Decimal stepSize = 0.5;//0.5;
        Decimal iconSpacing = 0.0;//.15; // 0.2 = Default
        Boolean hFill = false;

        value = Math.round(value / stepSize) * stepSize;
        ///////////////////////////////////////////////////////
        
        ///////////////////////////////////////////////////////
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<l>' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</l>';
        // String valueLabelHTML = '<l>' + MiniChartsHelper.generateLabelText(String.valueOf(amt) + '%') + '</l>';
        // valueLabelHTML = '';

        ///////////////////////////////////////////////////////
        String titleHTML = '';
        if (true) {
            titleHTML = '<t>'
            + '<l>Win Rate Last 12m</l>'
                + valueLabelHTML
            + '</t>';
        }
        // titleHTML = '';

        String iconVarName = MiniChartsIcons.getIcon('internal', 'star');
        // String iconVarName = MiniChartsIcons.getIcon('utility', 'record');
        // String iconVarName = MiniChartsIcons.getIcon('utility', 'stop');
        // String iconVarName = MiniChartsIcons.getIcon('utility', 'success');
        String styleVal = String.valueOf(Math.floor(value));
        String styleValP = String.valueOf((value - Math.floor(value)).setScale(1));

        String iconsClass = hFill ? '_icons _horizontal-fill' : '_icons';
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        //--svg-pattern: var(' + patternName + ');
        String output = '';
        output += '<b style="--d-icon-count:' + iconCount + ';--d-icon-spacing:' + iconSpacing.setScale(1) + ';--d-value:' + styleVal + ';--d-value-remainder:' + styleValP + '">';
            output += titleHTML;
            output += '<d class="_icon-label-wrapper fx aic">';
                output += '<d class="_container fxc fg">';
                    output += '<d class="' + iconsClass + '" style="--d-mask-image:var(' + iconVarName + ')"/>';
                output += '</d>';
                output += valueLabelHTML;
            output += '</d>';
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    /* ************************************************************ */
    /* ************************************************************ */
    /* ************************************************************ */

    public String getStyle() {return '--d-title-height:0px;--d-icon-spacing:.2;&:has(t){--d-title-height:13px}--d-container-height:calc(var(--h-px) - var(--d-title-height));--d-max-icon-height:min(40px,var(--h-px));container-type:inline-size;& b{--bgc:var(--c-bg-empty-fill);--d-fill-color:linear-gradient(to right,var(--c-t3) 0px,var(--c-t1) 100%);width:100%;._icon-label-wrapper > l{width:100%;max-width:42px;margin:0 0 0 3px;text-overflow:clip;&:not(pct){@container (max-width:75px){display:none}}&pct{max-width:30px;@container (max-width:65px){display:none}}}& t{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--d-container-height));& l{&:first-of-type{padding-right:1ch}&:last-of-type{flex-shrink:0;text-align:right}}}}._container{container-type:inline-size;--d-height-in-width-units:calc(var(--d-icon-count) + ((var(--d-icon-count) - 1)*var(--d-icon-spacing)));--d-icon-height:max(7px,min(var(--d-max-icon-height),min(calc(100cqw/var(--d-height-in-width-units)),var(--d-container-height))));overflow:hidden;position:relative;._icons{--gap:calc(var(--d-icon-height)*var(--d-icon-spacing));--d-icon-height-with-gap:calc(var(--d-icon-height) + var(--gap));--d-icon-width:calc((var(--d-icon-count)*var(--d-icon-height)) + ((var(--d-icon-count) - 1)*var(--gap)));--d-empty-space:calc(((var(--d-value) + var(--d-value-remainder))*var(--d-icon-height)) + (var(--d-value)*var(--gap)));&._horizontal-fill{--d-empty-space:calc(var(--d-icon-height) + (var(--d-value)*var(--d-icon-height)) + (var(--d-value)*var(--gap)))}--d-empty-space-min:min(var(--d-icon-width),var(--d-empty-space));--d-empty-space-height:calc(100% - var(--d-empty-space) + var(--d-icon-height) + var(--gap));height:var(--d-icon-height);width:calc((var(--d-icon-height-with-gap)*var(--d-icon-count)) - var(--gap));--d-empty-fill-gradient:linear-gradient(var(--bgc),var(--bgc));background:var(--d-empty-fill-gradient),var(--d-empty-fill-gradient),var(--d-fill-color);background-size:0,calc(100% - var(--d-empty-space-min)),100%;&.hfill{background-size:var(--d-empty-space-height) calc(100% - (var(--d-value-remainder)*100%)),calc(100% - var(--d-empty-space-min)),100%}background-repeat:no-repeat;background-position:top right;-webkit-mask-image:var(--d-mask-image);-webkit-mask-size:var(--d-icon-height-with-gap) var(--d-icon-height);-webkit-mask-repeat:repeat no-repeat}}& b:has(t){--d-title-height:13px;._icon-label-wrapper > l{display:none}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer iconCount = 100; // 50 is max?
        Decimal value = Math.random() * iconCount;
        Decimal stepSize = 0.5;//0.5;
        Decimal iconSpacing = 0.0;//.15; // 0.2 = Default
        Boolean hFill = false;
        value = Math.round(value / stepSize) * stepSize;
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<l>'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</l>';
        String titleHTML = '';
        if (true) {
            titleHTML = '<t><l>Win Rate Last 12m</l>'+valueLabelHTML+'</t>';
        }
        String iconVarName = MiniChartsIcons.getIcon('internal', 'star');
        String styleVal = String.valueOf(Math.floor(value));
        String styleValP = String.valueOf((value - Math.floor(value)).setScale(1));
        String iconsClass = hFill ? '_icons _horizontal-fill' : '_icons';
        String output = '';
        output += '<b style="--d-icon-count:'+iconCount+';--d-icon-spacing:'+iconSpacing.setScale(1)+';--d-value:'+styleVal+';--d-value-remainder:'+styleValP+'">';
            output += titleHTML;
            output += '<d class="_icon-label-wrapper fx aic">';
                output += '<d class="_container fxc fg">';
                    output += '<d class="'+iconsClass+'" style="--d-mask-image:var('+iconVarName+')"/>';
                output += '</d>';
                output += valueLabelHTML;
            output += '</d>';
        output += '</b>';
        return output;
    }
}