public with sharing class GaugeDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        // Integer cmpId = MiniChartsRenderer.getCmpIdx();

        Integer rowHeight = (Integer)props.get('height');

        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        Integer radius = rowHeight;
        Integer diameter = radius * 2;
        
        Integer strokeWidth = 6;
        Integer gap = 1;

        if (radius == 40) {
            strokeWidth = 10;
            gap = 2;
        } else if (radius == 60) {
            strokeWidth = 12;
            gap = 2;
        }
        Decimal svgRadius = radius - (strokeWidth / 2.0);
        Integer halfStrokeWidth = strokeWidth/2;

        // String fill = 'blue';//'conic-gradient(from 270deg, black 0% 12.5%, red 12.5% 25%, yellow 25% 37.5%, green 37.5% 50%);';
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        
        String output = '';
        output += '<div class="b w1 hpx" style="--pct:' + pct + '">';
                // + '      <div class="title aifs fx jcsb">'
                // + '         <div class="lbl tal tcd"><span>Win Rate</span></div>'
                // +           progressLabel
                // + '      </div>'

                // + '<div class="gauge">'
                output += '<svg class="g hpx pat" style="--s:' + strokeWidth + '" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg">';
            // Filled
            output += '<foreignObject>';
            output += '<div style="--f:' + fill + '" class="fill" xmlns="http://www.w3.org/1999/xhtml"></div>';
            output += '</foreignObject>';

            // Empty
            output += '<path class="empty" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/>';

            // Divider Gaps
            output += '<line style="--pct:25;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
            output += '<line style="--pct:50;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
            output += '<line style="--pct:75;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
            
      
            output += '<g>';
            output += '<line style="--sw:' + (gap*3) + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
            output += '<line style="--sc:#666;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
            output += '</g>';
            output += '</svg>';
            
            output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    // private String renderLine(Integer radius, Decimal length, Integer stroke, Decimal pct, String color) {       
    //     Decimal endAngle =  3.1415 - (pct * 3.1415);
    //     Decimal endX = (Math.cos(endAngle) * length) + radius;
    //     Decimal endY = (Math.sin(endAngle) * length * -1) + radius;

    //     return '<line stroke="' + color + '" stroke-width="' + stroke + '" x1="' + radius + '" y1="' + radius + '" x2="' + endX.setScale(1) + '" y2="' + endY.setScale(1) + '" />';
    // }

    /*private String renderArc(Integer radius, Integer stroke, Decimal startPct, Decimal endPct, String color) {       
        Decimal svgRadius = radius - (stroke / 2.0);
        
        Decimal PI = 3.1415;
        Decimal startAngle = PI - (startPct * PI);
        Decimal startX = (Math.cos(startAngle) * svgRadius) + radius;
        Decimal startY = (Math.sin(startAngle) * svgRadius * -1) + radius;

        Decimal endAngle =  PI - (endPct * PI);
        Decimal endX = (Math.cos(endAngle) * svgRadius) + radius;
        Decimal endY = (Math.sin(endAngle) * svgRadius * -1) + radius;

        return '<path style="--s-color:' + color + '"  d=" M ' 
        + startX.setScale(2) + ' ' + startY.setScale(2) 
        + ' A ' + svgRadius.setScale(0) + ' ' + svgRadius.setScale(0) + ' 0 0 1 '
        + endX.setScale(2) + ' ' + endY.setScale(2) + '" />';
    }*/

    public string getStyle() {return '.GaugeDesign{--h-px2: calc(var(--h-px) * 2);--ttl-h: 0px;--bar-thck: 5px}.GaugeDesign:has(.title){--ttl-h: 14px}.GaugeDesign .b{--bgc: var(--c-bg-empty-fill);--fillc: #3296ed}.GaugeDesign .b .title{height:calc(var(--h-px) - 0px - var(--b-lbl-h));color:#595959}.GaugeDesign .g line{stroke:var(--sc, var(--c-bg));stroke-width:var(--sw)}.GaugeDesign .g path{fill:none;stroke-width:var(--s);stroke:var(--bgc)}.GaugeDesign .g line,.GaugeDesign .g .empty{transform:rotate(calc(var(--pct) * 1.8deg));transform-origin:center bottom}.GaugeDesign foreignObject{width:var(--h-px2);height:var(--h-px)}.GaugeDesign .fill{--sh: calc(var(--h-px2) - 0.2px);width:var(--sh);height:var(--sh);margin:.1px 0 0 .1px;border-radius:50%;background:var(--f)}.GaugeDesign .fill::after{content:"";position:absolute;--ss: calc((var(--s) - 0.1) * 1px);--sh: calc(var(--h-px2) - (var(--ss) * 2));top:var(--ss);left:var(--ss);width:var(--sh);height:var(--sh);border-radius:50%;background:var(--c-bg)}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer rowHeight = (Integer)props.get('height');
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        Integer radius = rowHeight;
        Integer diameter = radius * 2;
        Integer strokeWidth = 6;
        Integer gap = 1;
        if (radius == 40) {
            strokeWidth = 10;
            gap = 2;
        } else if (radius == 60) {
            strokeWidth = 12;
            gap = 2;
        }
        Decimal svgRadius = radius - (strokeWidth / 2.0);
        Integer halfStrokeWidth = strokeWidth/2;
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        String output = '<div class="b w1 hpx" style="--pct:' + pct + '"><svg class="g hpx pat" style="--s:' + strokeWidth + '" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg"><foreignObject><div style="--f:' + fill + '" class="fill" xmlns="http://www.w3.org/1999/xhtml"></div></foreignObject><path class="empty" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/><line style="--pct:25;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/><line style="--pct:50;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/><line style="--pct:75;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/><g><line style="--sw:' + (gap*3) + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/><line style="--sc:#666;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/></g></svg></div>';
        return output;
    }
}