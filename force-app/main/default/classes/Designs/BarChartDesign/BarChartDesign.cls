public with sharing class BarChartDesign implements MiniChartsDesign {
    private String RENDER_TEMPLATE() {
        Integer pct = Math.round(Math.random() * 100);

        String output = '<div style="--pct: ' + pct + '%;">';
                
        
        // output += '<div class="ttl fx jcc tc vatt w1 b6 h-sz1">'
        //         + '   <span>Chart Title</span>'
        //         + '</div>';

        // output += '<div class="ttl fx jcsb tc vatt w1 b6 h-sz1">'
        //         + '   <span>Progress Title</span>'
        //         + '   <span>Right Tag</span>'
        //         + '</div>';
        
        output += '<div class="body-cnt fg w1">'
                + '   <div class="pb-container">'
                
                + '      <div class="pb-lbl fxc jcc tc tar">'
                + '         <span>-$00.0M</span>'
                + '      </div>'

                + '      <div class="bar-wrapper fg">'

                // + '         <div class="bar bar-blue w1">'
                // + '            <div class="fill tar tc">'
                // + '                 <span>$50.9K</span>'
                // + '            </div>'
                // + '         </div>'

                + '         <div class="CMP_BODY bar bar-pattern w1">'
                + '            <div class="fill-bg" />'
                + '            <div class="fill" />'
                // + '            <div class="fill-lbl tar tc">'
                // + '               <span>$50.9K</span>'
                // + '            </div>'
                + '         </div>'
                
                // + '         <div class="b-lbl fx jcsb tc vatb aife fslh75 wsnp h-sz1">'
                // + '            <span>Left</span>'
                // + '            <span>Right</span>'
                // + '         </div>'

                + '      </div>'

                + '      <div class="pb-lbl fxc jcc tc tal">'
                + '         <span>' + pct + '%</span>'
                + '      </div>'

                + '   </div>'
                + '</div></div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.BarChartDesign{--ttl-h: 0px;--b-lbl-h: 0px;--bar-height: 16px}.BarChartDesign:has(.ttl){--ttl-h: 12px}.BarChartDesign:has(.b-lbl){--b-lbl-h: 11px}.BarChartDesign.sz3{--bar-height: 30px}.BarChartDesign .ttl{height:calc(var(--ttl-h) + 1px);margin-bottom:-1px;font-size:10px;line-height:10px;letter-spacing:-0.02rem}.BarChartDesign .pb-lbl{min-width:40px;height:var(--bar-height);font-size:10px;letter-spacing:-0.7px}.BarChartDesign .pb-lbl.tar{margin-right:2px}.BarChartDesign .pb-lbl.tal{margin-left:2px}@container (max-width: 99.9px){.BarChartDesign .pb-lbl{display:none}}.BarChartDesign .b-lbl{height:var(--b-lbl-h)}.BarChartDesign .b-lbl span{height:.8rem;letter-spacing:min(0rem,max(-0.1rem,1cqw - .1rem))}.BarChartDesign .body-cnt{display:flex;flex-direction:column;justify-content:center}.BarChartDesign .pb-container{display:flex;flex-direction:row}.BarChartDesign .bar-wrapper{display:flex;flex-direction:column;width:100%;container-type:inline-size}.BarChartDesign .bar{position:relative;height:var(--bar-height)}.BarChartDesign .bar .fill{container-type:inline-size;height:100%}.BarChartDesign .bar .fill span{color:#fff;font-size:10px;letter-spacing:-0.5px;padding:0 2px}@container (max-width: 40px){.BarChartDesign .bar .fill span{font-size:8px}}@container (max-width: 30px){.BarChartDesign .bar .fill span{display:none}}.BarChartDesign .bar-blue{background:#c9c9c9}.BarChartDesign .bar-blue .fill{background:#0176d3;width:var(--pct)}.BarChartDesign .bar-pattern{position:relative;--pcount: 5;width:100%;container-type:inline-size;--bg-color: #ccc;background-image:linear-gradient(to right, var(--theme-3), var(--theme-1))}.BarChartDesign .bar-pattern .fill-bg{position:absolute;top:0;right:0;width:100%;height:100%;background-color:var(--bg-color);animation:.5s ease-out forwards a-fill-1}@keyframes a-fill-1{to{width:calc(100% - var(--pct))}}.BarChartDesign .bar-pattern .fill{position:absolute;background-color:#fff;mix-blend-mode:screen;border-image-source:var(--svg-battery-rounded);border-image-repeat:round stretch;border-image-slice:3 5 3 4 fill;border-image-width:3px 5px 3px 4px;width:100%;height:100%}.BarChartDesign .bar-pattern .fill-lbl{position:absolute;top:0;height:100%;width:var(--pct);container-type:inline-size;height:100%;display:flex;align-items:center;justify-content:flex-end}.BarChartDesign .bar-pattern .fill-lbl span{color:#fff;font-size:10px;letter-spacing:-0.5px;padding:0 2px}@container (max-width: 40px){.BarChartDesign .bar-pattern .fill-lbl span{font-size:8px}}@container (max-width: 30px){.BarChartDesign .bar-pattern .fill-lbl span{display:none}}';}

    /* COMPRESSED RENDER */
    public String render() {
        Integer pct = Math.round(Math.random() * 100);
        String output = '<div style="--pct: ' + pct + '%;"><div class="body-cnt fg w1"><div class="pb-container"><div class="pb-lbl fxc jcc tc tar"><span>-$00.0M</span></div><div class="bar-wrapper fg"><div class="CMP_BODY bar bar-pattern w1"><div class="fill-bg" /><div class="fill" /></div></div><div class="pb-lbl fxc jcc tc tal"><span>' + pct + '%</span></div></div></div></div>';
        return output;
    }
}