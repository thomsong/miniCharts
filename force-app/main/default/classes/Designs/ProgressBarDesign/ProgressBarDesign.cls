public with sharing class ProgressBarDesign implements MiniChartsDesign {
    private String RENDER_TEMPLATE() {
        Integer pct = Math.round(Math.random() * 100);

        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        
        String output = '';
        
        // output += '<div class="ttl fx jcc tc vatt w1 b6 h-sz1">'
        //         + '   <span>Chart Title</span>'
        //         + '</div>';

        // output += '<div class="ttl fx jcsb tc vatt w1 b6 h-sz1">'
        //         + '   <span>Progress Title</span>'
        //         + '   <span>Right Tag</span>'
        //         + '</div>';
        
        

        output += '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%;">'
                // + '   <div class="pb-container">'
                
                // + '      <div class="pb-lbl fxc jcc tc tar">'
                // + '         <span>-$00.0M</span>'
                // + '      </div>'
                + '      <div class="lbl tcd"><span><sup>$</sup>99.9<sub>M</sub></span></div>'
                + '      <div class="bar fg">'

                // + '         <div class="bar bar-blue w1">'
                // + '            <div class="fill tar tc">'
                // + '                 <span>$50.9K</span>'
                // + '            </div>'
                // + '         </div>'

                // + '         <div class="bar w1">'
                + '            <div class="fill"></div>'

                // + '            <div class="fill-lbl tar tc">'
                // + '               <span>$50.9K</span>'
                // + '               <span>$50.9K</span>'
                // + '            </div>'


                // + '         </div>'
                
                // + '         <div class="b-lbl fx jcsb tc vatb aife fslh75 wsnp h-sz1">'
                // + '            <span>Left</span>'
                // + '            <span>Right</span>'
                // + '         </div>'

                + '      </div>'
                + '      <div class="lbl tcd pct"><span>' + 100 + '<sub>%</sub></span></div>'
                + '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.ProgressBarDesign{--ttl-h: 0px;--b-lbl-h: 0px;--bar-height: 16px}.ProgressBarDesign:has(.ttl){--ttl-h: 12px}.ProgressBarDesign:has(.b-lbl){--b-lbl-h: 11px}.ProgressBarDesign .body{display:flex;flex-direction:row;justify-content:center;container-type:inline-size;align-items:center;width:100%}.ProgressBarDesign .ttl{height:calc(var(--ttl-h) + 1px);margin-bottom:-1px;font-size:10px;line-height:10px;letter-spacing:-0.02rem}.ProgressBarDesign .pb-lbl{min-width:40px;height:var(--bar-height);font-size:10px;letter-spacing:-0.7px}.ProgressBarDesign .pb-lbl.tar{margin-right:2px}.ProgressBarDesign .pb-lbl.tal{margin-left:2px}@container (max-width: 99.9px){.ProgressBarDesign .pb-lbl{display:none}}.ProgressBarDesign .b-lbl{height:var(--b-lbl-h)}.ProgressBarDesign .b-lbl span{height:.8rem;letter-spacing:min(0rem,max(-0.1rem,1cqw - .1rem))}.ProgressBarDesign .pb-container{display:flex;flex-direction:row}.ProgressBarDesign .bar{display:flex;flex-direction:column;width:100%;container-type:inline-size}.ProgressBarDesign .fill{position:relative;height:var(--bar-height);container-type:inline-size;-webkit-mask-box-image:var(--svg-pattern);background-image:linear-gradient(to right, var(--c-t3), var(--c-t1))}.ProgressBarDesign .fill::after{content:"";position:absolute;right:0;width:calc(100% - var(--pct));height:100%;background-color:var(--c-bg-empty-fill)}.ProgressBarDesign .lbl{width:100%;max-width:42px;text-align:left;letter-spacing:-0.25px;container-type:inline-size;margin:0 0 0 2px}.ProgressBarDesign .lbl:first-of-type{margin:0 2px 0 0}.ProgressBarDesign .lbl sup{font-size:.8em;vertical-align:text-top}.ProgressBarDesign .lbl sub{font-size:.7em;vertical-align:baseline}@container (max-width: 75px){.ProgressBarDesign .lbl:not(.pct){display:none}}.ProgressBarDesign .lbl.pct{max-width:32px}@container (max-width: 65px){.ProgressBarDesign .lbl.pct{display:none}}.ProgressBarDesign .fill-lbl{position:absolute;top:.5px;height:100%;left:2px;width:calc(var(--pct) - 7px);container-type:inline-size;display:flex;align-items:center;justify-content:flex-end}.ProgressBarDesign .fill-lbl span{position:absolute;width:calc(100% - 6px);color:#fff;-webkit-text-stroke:3px #fff;padding:0 3px 0 3px;font-size:10px;letter-spacing:-0.5px}.ProgressBarDesign .fill-lbl span:last-of-type{color:var(--c-txt);-webkit-text-stroke:0}.ProgressBarDesign .fill-lbl{left:unset;right:2px;width:calc(100% - var(--pct) - 2px);text-align:left}.ProgressBarDesign .fill-lbl span{display:inline;right:unset;left:0px}.ProgressBarDesign .fill-lbl{left:unset;right:2px;width:100%;text-align:right}.ProgressBarDesign .fill-lbl span{right:unset;left:0px}';}

    /* COMPRESSED RENDER */
    public String render() {
        Integer pct = Math.round(Math.random() * 100);
        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        String output = '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%;"><div class="lbl tcd"><span><sup>$</sup>99.9<sub>M</sub></span></div><div class="bar fg"><div class="fill"></div></div><div class="lbl tcd pct"><span>' + 100 + '<sub>%</sub></span></div></div>';
        return output;
    }
}