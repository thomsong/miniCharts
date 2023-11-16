public with sharing class ProgressBarDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        // String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        
        ///////////////////////////////////////////////////////
        // String progressLabel = this.generateLabel(String.valueOf(pct) + '%', 'lbl tar tcd');
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<l class="tar">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</l>';

        ///////////////////////////////////////////////////////
        String titleHTML = '';
        if (true) {
            titleHTML = ''
                + '<t>'
                    + '<l>' + 'Win Rate' + '</l>'
                    + valueLabelHTML
                + '</t>';
        }
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        
        String output = '';
        output += '<b style="--d-percent-value:' + pct + '%">';
            output += titleHTML;
            output += '<d class="_bar-label-wrapper fx aic">';
                output += '<d class="_progress-bar fxc fg">';
                    output += '<d class="_fill"/>';
                    output += '<d class="_target" style="--d-target-value:' + target + '">';
                        output += '<l>Target</l>';
                        output += '<d/>';
                    output += '</d>';
                output += '</d>';
                output += valueLabelHTML;
            output += '</d>';
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--d-total-height:0px;--d-bottom-label-height:0px;&:has(t){--d-total-height:13px}&:has(._target){&:not(:has(t)){--d-bottom-label-height:17px;&.sz1{--d-bottom-label-height:5px;._target l{font-weight:400;background:var(--d-target-bg-color);font-size:7px;font-weight:400;outline:.75px solid #fff;padding:0px 2px 1px 2px;border-radius:2px}}}}&:has(._target){&:has(t){&.sz1{--d-bottom-label-height:0px;._target l{display:none}}&.sz2{--d-bottom-label-height:8px}&.sz3{--d-bottom-label-height:16px}}}--d-bar-height:calc(var(--h-px) - var(--d-total-height) - var(--d-bottom-label-height));--d-max-bar-height:var(--d-bar-height);& b{--bgc:var(--c-bg-empty-fill);--fillc:#3296ed;width:100%;height:var(--h-px);._bar-label-wrapper{height:var(--d-bar-height);& > l{width:100%;max-width:42px;margin:0 0 0 3px;text-overflow:clip;&:first-of-type{margin:0 3px 0 0}}}& t{height:calc(var(--h-px) - var(--d-bar-height) - var(--d-bottom-label-height));& l:first-of-type{padding-right:1ch}}}._progress-bar{position:relative;min-width:20px;max-height:var(--d-max-bar-height);._fill{position:relative;height:var(--d-bar-height);--d-bar-radius:0;&.round{--d-bar-radius:9px}&.ptrn{-webkit-mask-box-image:var(--svg-pattern);--d-bar-radius:0}border-radius:var(--d-bar-radius);background:var(--bgc);&::after{content:"";position:absolute;height:100%;left:0;width:var(--d-percent-value);border-radius:var(--d-bar-radius);background:var(--fillc)}}}._target{--d-target-neg-value:calc(100 - var(--d-target-value));--d-target-percent:calc(var(--d-target-value)*1%);--d-target-neg-percent:calc(100% - var(--d-target-percent));--d-target-bg-color:#757575;position:absolute;width:100%;height:min(calc(var(--d-max-bar-height) + 16px),calc(var(--d-bar-height) + var(--d-bottom-label-height)));display:flex;align-items:flex-end;&:before{content:"";flex-shrink:clamp(0.1,var(--d-target-neg-value),100);flex-basis:var(--d-target-percent);flex-grow:0}&:after{content:"";flex-shrink:clamp(0.1,var(--d-target-value),100);flex-basis:var(--d-target-neg-percent);flex-grow:0}& l{position:relative;flex:0 0 auto;background:var(--d-target-bg-color);color:#fff;font-size:10px;outline:1px solid #fff;padding:0 3px 1px 3px;border-radius:3px;z-index:1}& > d{position:absolute;top:0;bottom:0;width:0;left:calc(1%*var(--d-target-value));transform:translateX(-1px);background:#fff;border-right:2px dashed var(--d-target-bg-color);outline:1px solid #fff}}& b:has(t){--d-total-height:13px;._bar-label-wrapper{& > l{display:none}}._target::after{height:var(--d-bar-height)}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<l class="tar">'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</l>';
        String titleHTML = '';
        if (true) {
            titleHTML = '<t><l>Win Rate</l>'+valueLabelHTML+'</t>';
        }
        String output = '';
        output += '<b style="--d-percent-value:'+pct+'%">';
            output += titleHTML;
            output += '<d class="_bar-label-wrapper fx aic">';
                output += '<d class="_progress-bar fxc fg">';
                    output += '<d class="_fill"/>';
                    output += '<d class="_target" style="--d-target-value:'+target+'">';
                        output += '<l>Target</l>';
                        output += '<d/>';
                    output += '</d>';
                output += '</d>';
                output += valueLabelHTML;
            output += '</d>';
        output += '</b>';
        return output;
    }
}