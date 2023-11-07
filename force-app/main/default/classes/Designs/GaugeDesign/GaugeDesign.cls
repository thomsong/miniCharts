public with sharing class GaugeDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE() {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        
        
        String output = '';
        
        output += '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%;">'
                // + '      <div class="title">'
                // + '         <div class="lbl tal tcd"><span>Win Rate</span></div>'
                // +           progressLabel
                // + '      </div>'


                + '<div class="gauge">';
        

                Integer radius = 20;
                Integer strokeWidth = 6;

                if (radius == 40) {
                    strokeWidth = 8;
                } else if (radius == 60) {
                    strokeWidth = 10;
                }
                
                output += '<svg viewBox="0 0 ' + (radius*2) + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg" style="--stroke:' + strokeWidth + ';">'
                
                + renderArc(radius, strokeWidth, 0.0, 1.0 , 'gray')
                + renderArc(radius, strokeWidth, 0.0, 0.4, 'blue')
                + renderLine(radius, strokeWidth, 0.0, 'blue')
                
                + '</svg>';

        output += '</div>'
                
                + '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    private String renderLine(Integer radius, Integer stroke, Decimal pct, String color) {       
        Decimal svgRadius = radius - (stroke / 2.0);
        
        // System.debug('endPct: ' + endPct);
        Decimal startX = Decimal.valueOf(radius);
        Decimal startY = Decimal.valueOf(radius);

        Decimal PI = 3.1415;
        Decimal endAngle =  PI - (pct * PI);
        Decimal endX = (Math.cos(endAngle) * svgRadius) + radius;
        Decimal endY = (Math.sin(endAngle) * svgRadius * -1) + radius;

        // System.debug('endAngle: ' + endX);
        // System.debug('endAngle: ' +endY);

        String svg = '<line x1="' + startX.setScale(1) + '" y1="' + startY.setScale(1) + '" x2="' + endX.setScale(1) + '" y2="' + endX.setScale(1) + '" />';

        return svg;
    }

    private String renderArc(Integer radius, Integer stroke, Decimal startPct, Decimal endPct, String color) {       
        Decimal svgRadius = radius - (stroke / 2.0);
        
        // System.debug('endPct: ' + endPct);
        Decimal PI = 3.1415;
        Decimal startAngle = PI - (startPct * PI);
        Decimal startX = (Math.cos(startAngle) * svgRadius) + radius;
        Decimal startY = (Math.sin(startAngle) * svgRadius * -1) + radius;


        Decimal endAngle =  PI - (endPct * PI);
        Decimal endX = (Math.cos(endAngle) * svgRadius) + radius;
        Decimal endY = (Math.sin(endAngle) * svgRadius * -1) + radius;

        // System.debug('endAngle: ' + endX);
        // System.debug('endAngle: ' +endY);

        String svg = '<path style="stroke:' + color + '" d="'
        + 'M ' + startX.setScale(1) + ' ' + startY.setScale(1) + ' '
        + 'A ' + svgRadius.setScale(0) + ' ' + svgRadius.setScale(0) + ' 0 0 1 ' // I think these can stay fixed
        + endX.setScale(1) + ' ' + endY.setScale(1) + '" />';

        return svg;
    }

    public string getStyle() {return '.GaugeDesign{--ttl-h: 0px;--gauge-height: var(--h-px);--gauge-width: calc(var(--gauge-height) * 2);--bar-thck: 5px}.GaugeDesign:has(.title){--ttl-h: 14px}.GaugeDesign .body{--bgc: var(--c-bg-empty-fill);--fillc: #3296ed;container-type:inline-size;width:100%;height:var(--h-px)}.GaugeDesign .body .title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--bar-height) - var(--b-lbl-h));color:#595959;font-size:12px}.GaugeDesign .gauge{background-color:#eee;width:var(--gauge-width);height:var(--gauge-height)}.GaugeDesign .gauge>svg{height:var(--gauge-height)}.GaugeDesign .gauge>svg path,.GaugeDesign .gauge>svg line{fill:none;stroke-width:var(--stroke)}.GaugeDesign .lbl{line-height:1;color:#484846}.GaugeDesign .lbl sup{font-size:.8em;vertical-align:text-top}.GaugeDesign .lbl sub{font-size:.7em;vertical-align:baseline}';}

    /* COMPRESSED RENDER */
    public String render() {
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        String patternName = MiniChartsFillPatterns.getPattern('battery-rounded');
        String output = '<div class="body" style="--svg-pattern: var(' + patternName + ');--pct:' + pct + '%;"><div class="gauge">';
                Integer radius = 20;
                Integer strokeWidth = 6;
                if (radius == 40) {
                    strokeWidth = 8;
                } else if (radius == 60) {
                    strokeWidth = 10;
                }
                output += '<svg viewBox="0 0 ' + (radius*2) + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg" style="--stroke:' + strokeWidth + ';">'
                + renderArc(radius, strokeWidth, 0.0, 1.0 , 'gray')
                + renderArc(radius, strokeWidth, 0.0, 0.4, 'blue')
                + renderLine(radius, strokeWidth, 0.0, 'blue')
+'</svg></div></div>';
        return output;
    }
}