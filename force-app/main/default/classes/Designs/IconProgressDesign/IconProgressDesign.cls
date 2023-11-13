public with sharing class IconProgressDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer iconCount = 50; // 50 is max
        Decimal value = Math.round(Math.random() * iconCount * iconCount) / iconCount;
        Decimal stepSize = 0.25;//0.5;
        Decimal iconSpacing = 0.0; // 0.2 = Default

        value = Math.round(value / stepSize) * stepSize;
        ///////////////////////////////////////////////////////
        
        ///////////////////////////////////////////////////////
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<div class="value lbl tar tcd">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</div>';
        // valueLabelHTML = '';

        ///////////////////////////////////////////////////////
        String titleHTML = '';
        if (true) {
            titleHTML = '<div class="title">'
            + '<div class="lbl tal tcd"><span>Win Rate Last 12m</span></div>'
                + valueLabelHTML
            + '</div>';
        }
        // titleHTML = '';

        // String iconName = MiniChartsIcons.getIcon('internal', 'star');
        String styleVal = String.valueOf(Math.floor(value));
        String styleValP = String.valueOf((value - Math.floor(value)).setScale(1));

        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        //--svg-pattern: var(' + patternName + ');
        String output = '';
        output += '<div class="b" style="--ic:' + iconCount + ';--spacing:' + iconSpacing.setScale(1) + ';--val:' + styleVal + ';--val-p:' + styleValP + ';">';
            output += titleHTML;
            output += '<div class="bwrap fx aic">';
                output += '<div class="bar fg">';
                    output += '<div class="icons"></div>';
                output += '</div>';
                output += valueLabelHTML;
            output += '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--ttl-h:0px;--spacing:.2;&:has(.title){--ttl-h:13px}--bar-height:calc(var(--h-px) - var(--ttl-h));--max-icoh:var(--h-px);container-type:inline-size;.b{width:100px;container-type:normal;--bgc:var(--c-bg-empty-fill);--fillc:#3296ed;width:100%;.bwrap{& > .lbl{width:100%;max-width:42px;margin:0 0 0 3px;text-overflow:clip;&:not(.pct){@container (max-width:75px){display:none}}&.pct{max-width:30px;@container (max-width:65px){display:none}}}}.title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--bar-height));.lbl:not(:last-of-type){padding-right:1ch}}}.bar{container-type:inline-size;--hUW:calc(var(--ic) + ((var(--ic) - 1)*var(--spacing)));--icoh:max( 7px,min(var(--max-icoh),min(calc(100cqw/var(--hUW)),var(--bar-height))) );overflow:hidden;position:relative;display:flex;flex-direction:column;.icons{--gap:calc(var(--icoh)*var(--spacing));--icg:calc(var(--icoh) + var(--gap));--w:calc((var(--ic)*var(--icoh)) + ((var(--ic) - 1)*var(--gap)));--emptySize:min( var(--w),calc( ((var(--val) + var(--val-p))*var(--icoh)) + (var(--val)*var(--gap)) ) );height:var(--icoh);min-width:calc(var(--icg)*var(--ic) - var(--gap));background:linear-gradient( to right,transparent var(--emptySize),var(--bgc) var(--emptySize) ),var(--fillc);--mi:url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHZpZXdCb3g9JzAgMCA1MiA1MicgcHJlc2VydmVBc3BlY3RSYXRpbz0ieE1pbllNaW4iPjxwYXRoIGQ9Ik0yNy40LDMuMWw0LjYsMTVjMC4yLDAuNiwwLjgsMC45LDEuNCwwLjloMTVjMS41LDAsMi4xLDIsMC45LDIuOWwtMTIuMiw5Yy0wLjUsMC40LTAuNywxLjEtMC41LDEuN0w0Mi40LDQ4IGMwLjQsMS40LTEuMSwyLjYtMi4zLDEuN0wyNywzOS45Yy0wLjUtMC40LTEuMi0wLjQtMS44LDBMMTIsNDkuN2MtMS4yLDAuOS0yLjgtMC4zLTIuMy0xLjdsNS42LTE1LjRjMC4yLTAuNiwwLTEuMy0wLjUtMS43bC0xMi4yLTkgQzEuNCwyMSwyLjEsMTksMy41LDE5aDE1YzAuNywwLDEuMi0wLjIsMS40LTAuOUwyNC42LDNDMjUsMS42LDI3LDEuNywyNy40LDMuMXoiLz48L3N2Zz4=");-webkit-mask-image:var(--mi);mask-image:var(--mi);--ms:var(--icg) var(--icoh);-webkit-mask-size:var(--ms);mask-size:var(--ms);--mr:repeat no-repeat;-webkit-mask-repeat:var(--mr);mask-repeat:var(--mr)}}.value{flex-shrink:0}.b:has(.title){--ttl-h:13px;.bwrap{& > .lbl{display:none}}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer iconCount = 50; // 50 is max
        Decimal value = Math.round(Math.random() * iconCount * iconCount) / iconCount;
        Decimal stepSize = 0.25;//0.5;
        Decimal iconSpacing = 0.0; // 0.2 = Default
        value = Math.round(value / stepSize) * stepSize;
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<div class="value lbl tar tcd">'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</div>';
        String titleHTML = '';
        if (true) {
            titleHTML = '<div class="title"><div class="lbl tal tcd"><span>Win Rate Last 12m</span></div>'+valueLabelHTML+'</div>';
        }
        String styleVal = String.valueOf(Math.floor(value));
        String styleValP = String.valueOf((value - Math.floor(value)).setScale(1));
        String output = '';
        output += '<div class="b" style="--ic:'+iconCount+';--spacing:'+iconSpacing.setScale(1)+';--val:'+styleVal+';--val-p:'+styleValP+';">';
            output += titleHTML;
            output += '<div class="bwrap fx aic">';
                output += '<div class="bar fg">';
                    output += '<div class="icons"></div>';
                output += '</div>';
                output += valueLabelHTML;
            output += '</div>';
        output += '</div>';
        return output;
    }
}