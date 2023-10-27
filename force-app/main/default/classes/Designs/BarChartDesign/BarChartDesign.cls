public with sharing class BarChartDesign implements MiniChartsDesign {
    private String RENDER_TEMPLATE() {
        Integer pct = 30;

        String output = ''
                + '<style>.BarChartDesign{'
                + '   --pct: ' + pct + '%;'
                + '}</style>';
        
        output += '<div class="ttl fx jcc tc vatt w1 b6 h-sz1">'
                + '   <span>Chart Title</span>'
                + '</div>';

        // titleHTML = '<div class="ttl fx jcsb tc vatt w1 b6 h-sz1">'
        //           + '   <span>Progress Title</span>'
        //           + '   <span>Right Tag</span>'
        //           + '</div>';
        
        return output
                + '<div class="body-cnt fg w1">'
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

                + '         <div class="bar bar-pattern w1">'

                + '            <div class="fill-bg">'
                + '               <span></span>'
                + '            </div>'

                + '            <div class="fill">'
                + '               <span></span>'
                + '            </div>'

                // + '            <div class="fill-lbl tar tc">'
                // + '               <span>$50.9K</span>'
                // + '            </div>'

                + '         </div>'
                
                + '         <div class="b-lbl fx jcsb tc vatb aife fslh75 wsnp h-sz1">'
                + '            <span>Left</span>'
                + '            <span>Right</span>'
                + '         </div>'

                + '      </div>'

                + '      <div class="pb-lbl fxc jcc tc tal">'
                + '         <span>' + pct + '%</span>'
                + '      </div>'

                + '   </div>'
                + '</div>';

    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.BarChartDesign{--ttl-h: 0px;--b-lbl-h: 0px;--bar-height: 16px;--pb-pattern-x-space: url("data:image/svg+xml,%3Csvg%20viewBox%3D%270%200%20100%20100%27%20preserveAspectRatio%3D%27none%27%20xmlns%3D%27http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%27%3E%0A%3Crect%20fill%3D%27black%27%20x%3D%275%27%20y%3D%270%27%20width%3D%2790%27%20height%3D%27100%27%20%2F%3E%0A%3C%2Fsvg%3E");--pb-pattern-full: url("data:image/svg+xml,%3Csvg%20viewBox%3D%270%200%20100%20100%27%20preserveAspectRatio%3D%27none%27%20xmlns%3D%27http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%27%3E%0A%3Crect%20fill%3D%27black%27%20x%3D%270%27%20y%3D%270%27%20width%3D%27100%27%20height%3D%27100%27%20%2F%3E%0A%3C%2Fsvg%3E");--pb-pattern-heart-none: url("data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20512%20512%22%20preserveAspectRatio%3D%27none%27%3E%3Cpath%20fill%3D%27black%27%20d%3D%22M39.8%20263.8L64%20288%20256%20480%20448%20288l24.2-24.2c25.5-25.5%2039.8-60%2039.8-96C512%2092.8%20451.2%2032%20376.2%2032c-36%200-70.5%2014.3-96%2039.8L256%2096%20231.8%2071.8c-25.5-25.5-60-39.8-96-39.8C60.8%2032%200%2092.8%200%20167.8c0%2036%2014.3%2070.5%2039.8%2096z%22%2F%3E%3C%2Fsvg%3E");--pb-pattern-heart-meet: url("data:image/svg+xml,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%20-10%20512%20512%22%20preserveAspectRatio%3D%27xMidYMid%20meet%27%3E%3Cpath%20fill%3D%27black%27%20d%3D%22M39.8%20263.8L64%20288%20256%20480%20448%20288l24.2-24.2c25.5-25.5%2039.8-60%2039.8-96C512%2092.8%20451.2%2032%20376.2%2032c-36%200-70.5%2014.3-96%2039.8L256%2096%20231.8%2071.8c-25.5-25.5-60-39.8-96-39.8C60.8%2032%200%2092.8%200%20167.8c0%2036%2014.3%2070.5%2039.8%2096z%22%2F%3E%3C%2Fsvg%3E");--pb-battery_l: url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20x%3D%220px%22%20y%3D%220px%22%20viewBox%3D%220%200%2080%20320%22%20class%3D%22mask%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%2265%22%20width%3D%2260%22%20height%3D%22190%22%2F%3E%0A%3Crect%20width%3D%2280%22%20height%3D%2248%22%2F%3E%0A%3Crect%20y%3D%22272%22%20width%3D%2280%22%20height%3D%2248%22%2F%3E%0A%3C%2Fsvg%3E");--pb-battery_m: url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20x%3D%220px%22%20y%3D%220px%22%20viewBox%3D%220%200%2080%20320%22%20class%3D%22mask%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%2265%22%20width%3D%2260%22%20height%3D%22190%22%2F%3E%0A%3Crect%20width%3D%2280%22%20height%3D%2248%22%2F%3E%0A%3Crect%20y%3D%22272%22%20width%3D%2280%22%20height%3D%2248%22%2F%3E%0A%3C%2Fsvg%3E");--pb-battery_r: url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20x%3D%220px%22%20y%3D%220px%22%20viewBox%3D%220%200%2080%20320%22%20class%3D%22mask%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%2265%22%20width%3D%2260%22%20height%3D%22190%22%2F%3E%0A%3Crect%20width%3D%2280%22%20height%3D%2248%22%2F%3E%0A%3Crect%20y%3D%22272%22%20width%3D%2280%22%20height%3D%2248%22%2F%3E%0A%3C%2Fsvg%3E");--pb-battery: url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2216%22%20height%3D%2216%22%20viewBox%3D%220%200%2016%2016%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%227.1%22%20fill%3D%22none%22%20width%3D%222%22%20height%3D%221.6%22%2F%3E%0A%3Cpath%20d%3D%22M14%2C4.5V0h-1.9H1H0v16h1h11.2H14v-4.5h2V4.5H14z%20M12%2C14H2V2h10V14z%22%2F%3E%0A%3Crect%20x%3D%224%22%20y%3D%223%22%20width%3D%226%22%20height%3D%2210%22%2F%3E%0A%3C%2Fsvg%3E%0A");--pb-battery-rounded: url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2217%22%20height%3D%2216%22%20viewBox%3D%220%200%2017%2016%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%227.1%22%20fill%3D%22none%22%20width%3D%222%22%20height%3D%221.6%22%2F%3E%0A%3Cpath%20d%3D%22M8.9%2C3H5.1C4.5%2C3%2C4%2C3.5%2C4%2C4.1v7.8C4%2C12.5%2C4.5%2C13%2C5.1%2C13h3.8c0.6%2C0%2C1.1-0.5%2C1.1-1.1V4.1C10%2C3.5%2C9.5%2C3%2C8.9%2C3z%22%2F%3E%0A%3Cpath%20d%3D%22M0%2C1.2v13.7C0%2C15.5%2C0.5%2C16%2C1.2%2C16h11.7c0.6%2C0%2C1.2-0.5%2C1.2-1.2v-3.3h2.2c0.5%2C0%2C0.8-0.4%2C0.8-0.8V5.3c0-0.5-0.4-0.8-0.8-0.8%0A%09l-2.2%2C0V2.1V1.2C14%2C0.5%2C13.5%2C0%2C12.8%2C0H1.2C0.5%2C0%2C0%2C0.5%2C0%2C1.2z%20M12%2C2v12H2V2H12z%22%2F%3E%0A%3C%2Fsvg%3E%0A")}.BarChartDesign:has(.ttl){--ttl-h: 12px}.BarChartDesign:has(.b-lbl){--b-lbl-h: 11px}.BarChartDesign.sz3{--bar-height: 30px}.BarChartDesign .ttl{height:calc(var(--ttl-h) + 1px);margin-bottom:-1px;font-size:10px;line-height:10px;letter-spacing:-0.02rem}.BarChartDesign .pb-lbl{min-width:40px;height:var(--bar-height);font-size:10px;letter-spacing:-0.7px}.BarChartDesign .pb-lbl.tar{margin-right:2px}.BarChartDesign .pb-lbl.tal{margin-left:2px}@container (max-width: 99.9px){.BarChartDesign .pb-lbl{display:none}}.BarChartDesign .b-lbl{height:var(--b-lbl-h)}.BarChartDesign .b-lbl span{height:.8rem;letter-spacing:min(0rem,max(-0.1rem,1cqw - .1rem))}.BarChartDesign .body-cnt{display:flex;flex-direction:column;justify-content:center}.BarChartDesign .pb-container{display:flex;flex-direction:row}.BarChartDesign .bar-wrapper{display:flex;flex-direction:column;width:100%;container-type:inline-size}.BarChartDesign .bar{position:relative;height:var(--bar-height)}.BarChartDesign .bar .fill{container-type:inline-size;height:100%}.BarChartDesign .bar .fill span{color:#fff;font-size:10px;letter-spacing:-0.5px;padding:0 2px}@container (max-width: 40px){.BarChartDesign .bar .fill span{font-size:8px}}@container (max-width: 30px){.BarChartDesign .bar .fill span{display:none}}.BarChartDesign .bar-blue{background:#c9c9c9}.BarChartDesign .bar-blue .fill{background:#0176d3;width:var(--pct)}.BarChartDesign .bar-pattern{position:relative;--pcount: 5;width:100%;container-type:inline-size;--bg-color: #ccc;background-image:linear-gradient(to right, #6247b3, #44a2f5)}.BarChartDesign .bar-pattern .fill-bg{position:absolute;top:0;right:0;width:100%;height:100%;background-color:var(--bg-color);animation:.5s ease-out forwards a-fill-1}@keyframes a-fill-1{to{width:calc(100% - var(--pct))}}.BarChartDesign .bar-pattern .fill{position:absolute;background-color:#fff;mix-blend-mode:screen;border-image-source:var(--pb-battery-rounded);border-image-repeat:round stretch;border-image-slice:3 5 3 4 fill;border-image-width:3px 5px 3px 4px;width:100%;height:100%}.BarChartDesign .bar-pattern .fill-lbl{position:absolute;top:0;height:100%;width:var(--pct);container-type:inline-size;height:100%;display:flex;align-items:center;justify-content:flex-end}.BarChartDesign .bar-pattern .fill-lbl span{color:#fff;font-size:10px;letter-spacing:-0.5px;padding:0 2px}@container (max-width: 40px){.BarChartDesign .bar-pattern .fill-lbl span{font-size:8px}}@container (max-width: 30px){.BarChartDesign .bar-pattern .fill-lbl span{display:none}}';}

    /* COMPRESSED RENDER */
    public String render() {
        Integer pct = 30;
        String output = '<style>.BarChartDesign{--pct: ' + pct + '%;}</style><div class="ttl fx jcc tc vatt w1 b6 h-sz1"><span>Chart Title</span></div>';
        return output + '<div class="body-cnt fg w1"><div class="pb-container"><div class="pb-lbl fxc jcc tc tar"><span>-$00.0M</span></div><div class="bar-wrapper fg"><div class="bar bar-pattern w1"><div class="fill-bg"><span></span></div><div class="fill"><span></span></div></div><div class="b-lbl fx jcsb tc vatb aife fslh75 wsnp h-sz1"><span>Left</span><span>Right</span></div></div><div class="pb-lbl fxc jcc tc tal"><span>' + pct + '%</span></div></div></div>';
    }
}