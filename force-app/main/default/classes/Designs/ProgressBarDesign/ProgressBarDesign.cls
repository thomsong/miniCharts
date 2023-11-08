public with sharing class ProgressBarDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        
        String progressLabel = '<div class="lbl tar tcd pct"><span>' + pct + '<sub>%</sub></span></div>';
        String output = '';
        
        output += '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%">'
                + '      <div class="title">'
                + '         <div class="lbl tal tcd"><span>Win Rate</span></div>'
                +           progressLabel
                + '      </div>'

                + '      <div class="bwrap">'
                + '         <div class="bar fg">'
                + '            <div class="fill"></div>'
                + '            <div class="target" style="--target:' + target + '"><span class="lbl tc">Target</span><span class="line"></span></div>'
                + '         </div>'
                +           progressLabel
                // + '      <div class="lbl tar tcd"><span><sup>$</sup>19.9<sub>M</sub></span></div>'
                + '      </div>'
                + '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return ':root{--bgi-stripe: repeating-linear-gradient( 45deg, transparent, transparent 7px, #00000010 7px, #00000010 16px )}.ProgressBarDesign{--ttl-h: 0px;--b-lbl-h: 0px;--bar-height: calc(var(--h-px) - var(--ttl-h) - var(--b-lbl-h));--max-bar-height: var(--bar-height)}.ProgressBarDesign:has(.title){--ttl-h: 13px}.ProgressBarDesign:has(.target):not(:has(.title)){--b-lbl-h: 17px}.ProgressBarDesign:has(.target):not(:has(.title)).sz1{--b-lbl-h: 5px}.ProgressBarDesign:has(.target):has(.title).sz1{--b-lbl-h: 0px}.ProgressBarDesign:has(.target):has(.title).sz1 .target .lbl{display:none}.ProgressBarDesign:has(.target):has(.title).sz2{--b-lbl-h: 8px}.ProgressBarDesign:has(.target):has(.title).sz3{--b-lbl-h: 16px}.ProgressBarDesign .body{--bgc: var(--c-bg-empty-fill);--fillc: #3296ed;container-type:inline-size;width:100%;height:var(--h-px)}.ProgressBarDesign .body .bwrap{height:var(--bar-height);display:flex;align-items:center}.ProgressBarDesign .body .bwrap>.lbl{width:100%;max-width:42px;font-size:13px;letter-spacing:-0.4px;margin:0 0 0 3px;text-overflow:clip}.ProgressBarDesign .body .bwrap>.lbl:first-of-type{margin:0 3px 0 0}@container (max-width: 75px){.ProgressBarDesign .body .bwrap>.lbl:not(.pct){display:none}}.ProgressBarDesign .body .bwrap>.lbl.pct{max-width:30px}@container (max-width: 65px){.ProgressBarDesign .body .bwrap>.lbl.pct{display:none}}.ProgressBarDesign .body .title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--bar-height) - var(--b-lbl-h));color:#595959}.ProgressBarDesign .bar{position:relative;display:flex;flex-direction:column;width:100%;container-type:inline-size;max-height:var(--max-bar-height)}.ProgressBarDesign .bar .fill{position:relative;height:var(--bar-height);container-type:inline-size;overflow:hidden;--rad: 0;border-radius:var(--rad);background:var(--bgc)}.ProgressBarDesign .bar .fill.round{--rad: 9px}.ProgressBarDesign .bar .fill.ptrn{-webkit-mask-box-image:var(--svg-pattern);--rad: 0}.ProgressBarDesign .bar .fill::after{content:"";position:absolute;height:100%;left:0;width:var(--pct);border-radius:var(--rad);background:var(--fillc)}.ProgressBarDesign .target{--negative-value: calc(100 - var(--target));--percent: calc(var(--target) * 1%);--negative-percent: calc(100% - var(--percent));--target-bg-color: #757575;position:absolute;top:0;left:0;width:100%;height:min(var(--max-bar-height) + 16px,var(--bar-height) + var(--b-lbl-h));display:flex;align-items:flex-end}.ProgressBarDesign .target:before{flex-grow:0;flex-shrink:clamp(.1,var(--negative-value),100);flex-basis:var(--percent);content:""}.ProgressBarDesign .target:after{flex-grow:0;flex-shrink:clamp(.1,var(--target),100);flex-basis:var(--negative-percent);content:""}.ProgressBarDesign .target .lbl{flex:0 0 auto;text-align:center;position:relative;display:block;background:var(--target-bg-color);color:#fff;width:max-content;max-width:50cqw;font-size:10px;font-weight:600;outline:1.5px solid #fff;padding:1.5px 3px 1px 3px;border-radius:3px;z-index:2}.ProgressBarDesign .target .line{position:absolute;top:0;bottom:0px;left:calc(1%*var(--target));transform:translateX(-1px);width:0px;background:#fff;border-right:2px dashed var(--target-bg-color);outline:1px solid #fff;z-index:1}.ProgressBarDesign.sz1 .body:has(.title){--ttl-h: 13px}.ProgressBarDesign.sz1 .body:has(.title) .bwrap>.lbl{display:none}.ProgressBarDesign.sz1 .body:has(.title) .target::after{height:var(--bar-height)}.ProgressBarDesign.sz2 .body .title .lbl:last-child,.ProgressBarDesign.sz3 .body .title .lbl:last-child{display:none}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        String progressLabel = '<div class="lbl tar tcd pct"><span>' + pct + '<sub>%</sub></span></div>';
        String output = '';
        output += '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%">'
+'<div class="title">'
+'<div class="lbl tal tcd"><span>Win Rate</span></div>'
                +           progressLabel
+'</div>'
+'<div class="bwrap">'
+'<div class="bar fg">'
+'<div class="fill"></div>'
+'<div class="target" style="--target:' + target + '"><span class="lbl tc">Target</span><span class="line"></span></div>'
+'</div>'
                +           progressLabel
+'</div>'
+'</div>';
        return output;
    }
}