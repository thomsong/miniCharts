public with sharing class GaugeDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE() {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        
        String progressLabel = '<div class="lbl tar tcd pct"><span>' + pct + '<sub>%</sub></span></div>';
        String output = '';
        
        output += '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%;">'
                // + '      <div class="title">'
                // + '         <div class="lbl tal tcd"><span>Win Rate</span></div>'
                // +           progressLabel
                // + '      </div>'


                + '         <div class="gauge fg">'
                + '            <div class="fill"></div>'
                // + '            <div class="target" style="--target:' + target + '%;"></div>'
                + '         </div>'
                
                + '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.GaugeDesign{--ttl-h: 0px;--gauge-height: var(--h-px);--gauge-width: calc(var(--gauge-height) * 2);--bar-thck: 5px}.GaugeDesign:has(.title){--ttl-h: 14px}.GaugeDesign .body{--bgc: var(--c-bg-empty-fill);--fillc: #3296ed;container-type:inline-size;width:100%;height:var(--h-px)}.GaugeDesign .body .title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--bar-height) - var(--b-lbl-h));color:#595959;font-size:12px}.GaugeDesign .gauge{background-color:red;width:var(--gauge-width);height:var(--gauge-height)}.GaugeDesign .lbl{line-height:1;color:#484846}.GaugeDesign .lbl sup{font-size:.8em;vertical-align:text-top}.GaugeDesign .lbl sub{font-size:.7em;vertical-align:baseline}';}

    /* COMPRESSED RENDER */
    public String render() {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        String progressLabel = '<div class="lbl tar tcd pct"><span>' + pct + '<sub>%</sub></span></div>';
        String output = '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%;"><div class="gauge fg"><div class="fill"></div></div></div>';
        return output;
    }
}