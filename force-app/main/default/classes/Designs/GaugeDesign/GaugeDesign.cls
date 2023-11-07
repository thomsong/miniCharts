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

        Integer gap3 = gap*3;

        // String fill = 'blue';//'conic-gradient(from 270deg, black 0% 12.5%, red 12.5% 25%, yellow 25% 37.5%, green 37.5% 50%);';
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        String chartSVG =  ''
        + '<svg class="g" style="--s:' + strokeWidth + ';" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg">'
            // Filled
            + '<foreignObject style="--d:' + diameter + 'px" >'
                + '<div style="--f:' + fill + '" class="fill" xmlns="http://www.w3.org/1999/xhtml"></div>'
            + '</foreignObject>'

            // Empty
            // + renderArc(radius, strokeWidth, pct/100.0, 1.0 , 'var(--bgc)');
            
            + '<path class="empty" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/>';

            // Divider Gaps
            // + renderLine(radius, radius + 0.5, gap, 0.25, 'white')
            // + renderLine(radius, radius + 0.5, gap, 0.50, 'white')
            // + renderLine(radius, radius + 0.5, gap, 0.75, 'white');

        chartSVG+= ''
            + '<g class="ptr">'
                + '<line style="--sw:' + gap3 + 'px" x1="' + radius + '" y1="' + radius + '" x2="0" y2="' + radius + '"/>'
                + '<line style="--sc:#666;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" x2="0" y2="' + radius + '"/>'
            + '</g>'
        + '</svg>';

        String output = ''
            + '<div class="b" style="--dpct:' + pct + ';--pct:' + pct + '%;">'
                // + '      <div class="title">'
                // + '         <div class="lbl tal tcd"><span>Win Rate</span></div>'
                // +           progressLabel
                // + '      </div>'

                // + '<div class="gauge">'
                + chartSVG
                // + '</div>'    
            + '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    private String renderLine(Integer radius, Decimal length, Integer stroke, Decimal pct, String color) {       
        Decimal endAngle =  3.1415 - (pct * 3.1415);
        Decimal endX = (Math.cos(endAngle) * length) + radius;
        Decimal endY = (Math.sin(endAngle) * length * -1) + radius;

        return '<line stroke="' + color + '" stroke-width="' + stroke + '" x1="' + radius + '" y1="' + radius + '" x2="' + endX.setScale(1) + '" y2="' + endY.setScale(1) + '" />';
    }

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

    public string getStyle() {return '.GaugeDesign{--ttl-h: 0px;--gh: var(--h-px);--gw: calc(var(--gh) * 2);--bar-thck: 5px}.GaugeDesign:has(.title){--ttl-h: 14px}.GaugeDesign .b{--bgc: var(--c-bg-empty-fill);--fillc: #3296ed;container-type:inline-size;width:100%;height:var(--h-px)}.GaugeDesign .b .title{display:flex;justify-content:space-between;align-items:flex-start;height:calc(var(--h-px) - var(--bar-height) - var(--b-lbl-h));color:#595959;font-size:12px}.GaugeDesign .g{position:absolute;top:0;height:var(--gh)}.GaugeDesign .g line{stroke:var(--sc, white);stroke-width:var(--sw)}.GaugeDesign .g path{fill:none;stroke-width:var(--s);stroke:var(--bgc)}.GaugeDesign .g .ptr,.GaugeDesign .g .empty{transform:rotate(calc(var(--dpct) * 1.8deg));transform-origin:center bottom}.GaugeDesign foreignObject{width:var(--d);height:var(--d)}.GaugeDesign .fill{--h-px2: calc(var(--h-px) * 2);--sh: calc(var(--h-px2) - 0.2px);width:var(--sh);height:var(--sh);margin:.1px 0 0 .1px;border-radius:50%;background:var(--f)}.GaugeDesign .fill::after{content:"";position:absolute;--ss: calc((var(--s) - 0.1) * 1px);--sh: calc(var(--h-px2) - (var(--ss) * 2));top:var(--ss);left:var(--ss);width:var(--sh);height:var(--sh);border-radius:50%;background:#fff}';}

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
        Integer gap3 = gap*3;
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        String chartSVG =  '<svg class="g" style="--s:' + strokeWidth + ';" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg"><foreignObject style="--d:' + diameter + 'px" ><div style="--f:' + fill + '" class="fill" xmlns="http://www.w3.org/1999/xhtml"></div></foreignObject><path class="empty" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/>';
        chartSVG+= '<g class="ptr"><line style="--sw:' + gap3 + 'px" x1="' + radius + '" y1="' + radius + '" x2="0" y2="' + radius + '"/><line style="--sc:#666;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" x2="0" y2="' + radius + '"/></g></svg>';
        String output = '<div class="b" style="--dpct:' + pct + ';--pct:' + pct + '%;">'
                + chartSVG
+'</div>';
        return output;
    }
}