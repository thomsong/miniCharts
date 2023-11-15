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

    public string getStyle() {return '--2:0px;--6:.2;&:has(t){--2:13px}--16:calc(var(--h-px) - var(--2));--3:min(40px,var(--h-px));container-type:inline-size;& b{--bgc:var(--c-bg-empty-fill);--11:linear-gradient(to right,var(--c-t3) 0px,var(--c-t1) 100%);width:100%;.x1 > l{width:100%;max-width:42px;margin:0 0 0 3px;text-overflow:clip;&:not(pct){@container (max-width:75px){display:none}}&pct{max-width:30px;@container (max-width:65px){display:none}}}& t{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--16));& l{&:first-of-type{padding-right:1ch}&:last-of-type{flex-shrink:0;text-align:right}}}}.x3{container-type:inline-size;--10:calc(var(--9) + ((var(--9) - 1)*var(--6)));--8:max(7px,min(var(--3),min(calc(100cqw/var(--10)),var(--16))));overflow:hidden;position:relative;.x0{--gap:calc(var(--8)*var(--6));--7:calc(var(--8) + var(--gap));--5:calc((var(--9)*var(--8)) + ((var(--9) - 1)*var(--gap)));--14:calc(((var(--1) + var(--0))*var(--8)) + (var(--1)*var(--gap)));&.x2{--14:calc(var(--8) + (var(--1)*var(--8)) + (var(--1)*var(--gap)))}--12:min(var(--5),var(--14));--13:calc(100% - var(--14) + var(--8) + var(--gap));height:var(--8);width:calc((var(--7)*var(--9)) - var(--gap));--15:linear-gradient(var(--bgc),var(--bgc));background:var(--15),var(--15),var(--11);background-size:0,calc(100% - var(--12)),100%;&.hfill{background-size:var(--13) calc(100% - (var(--0)*100%)),calc(100% - var(--12)),100%}background-repeat:no-repeat;background-position:top right;-webkit-mask-image:var(--4);-webkit-mask-size:var(--7) var(--8);-webkit-mask-repeat:repeat no-repeat}}& b:has(t){--2:13px;.x1 > l{display:none}}';}

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
        String iconsClass = hFill ? 'x0 x2' : 'x0';
        return '<b style="--9:'+iconCount+';--6:'+iconSpacing.setScale(1)+';--1:'+styleVal+';--0:'+styleValP+'">' + titleHTML + '<d class="x1 fx aic"><d class="x3 fxc fg"><d class="'+iconsClass+'" style="--4:var('+iconVarName+')"/></d>' + valueLabelHTML + '</d></b>';
    }
}