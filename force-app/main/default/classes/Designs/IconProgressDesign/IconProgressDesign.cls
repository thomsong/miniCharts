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
        String valueLabelHTML = '<p>' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</p>';
        // valueLabelHTML = '';

        ///////////////////////////////////////////////////////
        String titleHTML = '';
        if (true) {
            titleHTML = '<div class="title">'
            + '<p>Win Rate Last 12m</p>'
                + valueLabelHTML
            + '</div>';
        }
        // titleHTML = '';

        // String iconVarName = MiniChartsIcons.getIcon('internal', 'star');
        // String iconVarName = MiniChartsIcons.getIcon('utility', 'record');
        String iconVarName = MiniChartsIcons.getIcon('utility', 'stop');
        // String iconVarName = MiniChartsIcons.getIcon('utility', 'success');
        String styleVal = String.valueOf(Math.floor(value));
        String styleValP = String.valueOf((value - Math.floor(value)).setScale(1));

        String iconsClass = hFill ? 'icons hfill' : 'icons';
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        //--svg-pattern: var(' + patternName + ');
        String output = '';
        output += '<div class="b" style="--ic:' + iconCount + ';--spacing:' + iconSpacing.setScale(1) + ';--val:' + styleVal + ';--val-p:' + styleValP + ';">';
            output += titleHTML;
            output += '<div class="wrap fx aic">';
                output += '<div class="cnt fxc fg">';
                    output += '<div class="' + iconsClass + '" style="--mi:var(' + iconVarName + ')"></div>';
                output += '</div>';
                output += valueLabelHTML;
            output += '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */



















    public string getStyle() {return '--ttl-h:0px;--spacing:.2;&:has(.title){--ttl-h:13px}--cnt-height:calc(var(--h-px) - var(--ttl-h));--max-icoh:min(40px,var(--h-px));container-type:inline-size;.b{--bgc:var(--c-bg-empty-fill);--fillc:linear-gradient(to right,var(--c-t3) 0px,var(--c-t1) 100%);width:100%;.wrap > p{width:100%;max-width:42px;margin:0 0 0 3px;text-overflow:clip;&:not(.pct){@container (max-width:75px){display:none}}&.pct{max-width:30px;@container (max-width:65px){display:none}}}.title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--cnt-height));& p{&:first-of-type{padding-right:1ch}&:last-of-type{flex-shrink:0;text-align:right}}}}.cnt{container-type:inline-size;--hUW:calc(var(--ic) + ((var(--ic) - 1)*var(--spacing)));--icoh:max( 7px,min(var(--max-icoh),min(calc(100cqw/var(--hUW)),var(--cnt-height))) );overflow:hidden;position:relative;.icons{--gap:calc(var(--icoh)*var(--spacing));--icg:calc(var(--icoh) + var(--gap));--w:calc((var(--ic)*var(--icoh)) + ((var(--ic) - 1)*var(--gap)));--esm:calc( ((var(--val) + var(--val-p))*var(--icoh)) + (var(--val)*var(--gap)) );&.hfill{--esm:calc( var(--icoh) + (var(--val)*var(--icoh)) + (var(--val)*var(--gap)) )}--es:min(var(--w),var(--esm));--hes:calc(100% - var(--esm) + var(--icoh) + var(--gap));height:var(--icoh);width:calc((var(--icg)*var(--ic)) - var(--gap));--eg:linear-gradient(var(--bgc),var(--bgc));background:var(--eg),var(--eg),var(--fillc);background-size:0,calc(100% - var(--es)),100%;&.hfill{background-size:var(--hes) calc(100% - (var(--val-p)*100%)),calc(100% - var(--es)),100%}background-repeat:no-repeat;background-position:top right;-webkit-mask-image:var(--mi);mask-image:var(--mi);--ms:var(--icg) var(--icoh);-webkit-mask-size:var(--ms);mask-size:var(--ms);--mr:repeat no-repeat;-webkit-mask-repeat:var(--mr);mask-repeat:var(--mr)}}.b:has(.title){--ttl-h:13px;.wrap > p{display:none}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer iconCount = 100; // 50 is max?
        Decimal value = Math.random() * iconCount;
        Decimal stepSize = 0.5;//0.5;
        Decimal iconSpacing = 0.0;//.15; // 0.2 = Default
        Boolean hFill = false;
        value = Math.round(value / stepSize) * stepSize;
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<p>'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</p>';
        String titleHTML = '';
        if (true) {
            titleHTML = '<div class="title"><p>Win Rate Last 12m</p>'+valueLabelHTML+'</div>';
        }
        String iconVarName = MiniChartsIcons.getIcon('utility', 'stop');
        String styleVal = String.valueOf(Math.floor(value));
        String styleValP = String.valueOf((value - Math.floor(value)).setScale(1));
        String iconsClass = hFill ? 'icons hfill' : 'icons';
        String output = '';
        output += '<div class="b" style="--ic:'+iconCount+';--spacing:'+iconSpacing.setScale(1)+';--val:'+styleVal+';--val-p:'+styleValP+';">';
            output += titleHTML;
            output += '<div class="wrap fx aic">';
                output += '<div class="cnt fxc fg">';
                    output += '<div class="'+iconsClass+'" style="--mi:var('+iconVarName+')"></div>';
                output += '</div>';
                output += valueLabelHTML;
            output += '</div>';
        output += '</div>';
        return output;
    }
}