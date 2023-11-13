public with sharing class IconProgressDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        // String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        
        ///////////////////////////////////////////////////////
        // String progressLabel = this.generateLabel(String.valueOf(pct) + '%', 'lbl tar tcd');
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<div class="lbl tal tcd">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</div>';

        ///////////////////////////////////////////////////////
        String titleHTML = '';
        
        if (true) {
            titleHTML = '<div class="title">'
            + '<div class="lbl tal tcd"><span>Win Rate</span></div>'
                + valueLabelHTML
            + '</div>';
        }
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        //--svg-pattern: var(' + patternName + ');
        String output = '';
        output += '<div class="body" style="--pct:' + pct + '%">';
            output += titleHTML;
            output += '<div class="bwrap fx aic">';
                output += '<div class="bar fg">';
                    output += '<div class="fill"></div>';
                    output += '<div class="target" style="--target:' + target + '">';
                        output += '<span class="lbl tc">Target</span><span class="line"></span>';
                    output += '</div>';
                output += '</div>';
                output += valueLabelHTML;
            output += '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--ttl-h:0px;--b-lbl-h:0px;&:has(.title){--ttl-h:13px}&:has(.target){&:not(:has(.title)){--b-lbl-h:17px;//17 &.sz1{--b-lbl-h:5px;//17 .target .lbl{font-weight:400;background:var(--target-bg-color);font-size:7px;font-weight:400;outline:.75px solid#fff;padding:0px 2px 1px 2px;border-radius:2px}}}}&:has(.target){&:has(.title){&.sz1{--b-lbl-h:0px;.target .lbl{display:none}}&.sz2{--b-lbl-h:8px}&.sz3{--b-lbl-h:16px}}}--bar-height:calc(var(--h-px) - var(--ttl-h) - var(--b-lbl-h));--max-bar-height:var(--bar-height);.body{/* PASSED IN VARS */ --bgc:var(--c-bg-empty-fill);//#f1f1f0;--fillc:#3296ed;width:100%;height:var(--h-px);.bwrap{height:var(--bar-height);& > .lbl{width:100%;max-width:42px;margin:0 0 0 3px;text-overflow:clip;&:first-of-type{margin:0 3px 0 0}&:not(.pct){@container (max-width:75px){display:none}}&.pct{max-width:30px;@container (max-width:65px){display:none}}}}.title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--bar-height) - var(--b-lbl-h));.lbl:not(:last-of-type){padding-right:1ch}}}.bar{position:relative;display:flex;flex-direction:column;min-width:20px;max-height:var(--max-bar-height);.fill{position:relative;height:var(--bar-height);overflow:hidden;--rad:0;&.round{--rad:9px}&.ptrn{-webkit-mask-box-image:var(--svg-pattern);--rad:0}border-radius:var(--rad);background:var(--bgc);&::after{content:"";position:absolute;height:100%;left:0;width:var(--pct);border-radius:var(--rad);background:var(--fillc)}}}.target{--negative-value:calc(100 - var(--target));--percent:calc(var(--target)*1%);--negative-percent:calc(100% - var(--percent));--target-bg-color:#757575;//#2e844a;position:absolute;top:0;left:0;width:100%;height:min( calc(var(--max-bar-height) + 16px),calc(var(--bar-height) + var(--b-lbl-h)) );display:flex;align-items:flex-end;&:before{flex-grow:0;flex-shrink:clamp(0.1,var(--negative-value),100);flex-basis:var(--percent);content:""}&:after{flex-grow:0;flex-shrink:clamp(0.1,var(--target),100);flex-basis:var(--negative-percent);content:""}.lbl{flex:0 0 auto;text-align:center;position:relative;display:block;background:var(--target-bg-color);color:#fff;width:max-content;font-size:10px;font-weight:400;outline:1.5px solid#fff;padding:0 3px 1px 3px;border-radius:3px;z-index:2}.line{position:absolute;top:0;bottom:0px;left:calc(1%*var(--target));transform:translateX(-1px);width:0px;background:#fff;border-right:2px dashed var(--target-bg-color);outline:1px solid#fff;z-index:1}}.body:has(.title){--ttl-h:13px;.bwrap{& > .lbl{display:none}}.target::after{height:var(--bar-height)}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = '<div class="lbl tal tcd">'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</div>';
        String titleHTML = '';
        if (true) {
            titleHTML = '<div class="title"><div class="lbl tal tcd"><span>Win Rate</span></div>'+valueLabelHTML+'</div>';
        }
        String output = '';
        output += '<div class="body" style="--pct:'+pct+'%">';
            output += titleHTML;
            output += '<div class="bwrap fx aic">';
                output += '<div class="bar fg">';
                    output += '<div class="fill"></div>';
                    output += '<div class="target" style="--target:'+target+'">';
                        output += '<span class="lbl tc">Target</span><span class="line"></span>';
                    output += '</div>';
                output += '</div>';
                output += valueLabelHTML;
            output += '</div>';
        output += '</div>';
        return output;
    }
}