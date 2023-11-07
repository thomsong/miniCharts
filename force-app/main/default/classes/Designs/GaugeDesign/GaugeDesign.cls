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

        Integer halfStrokeWidth = strokeWidth/2;
        Decimal svgRadius = radius - halfStrokeWidth;

        // String fill = 'blue';//'conic-gradient(from 270deg, black 0% 12.5%, red 12.5% 25%, yellow 25% 37.5%, green 37.5% 50%);';
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if cases below here - Only conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<div class="b w1 hpx" style="--pct:' + pct + '">';
            // + '      <div class="title aifs fx jcsb">'
            // + '         <div class="lbl tal tcd"><span>Win Rate</span></div>'
            // +           progressLabel
            // + '      </div>'

            output += '<svg class="g hpx pat" style="--s:' + strokeWidth + '" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg">';
                // Filled Area
                output += '<foreignObject>';
                    output += '<div style="--f:' + fill + '" class="fill" xmlns="http://www.w3.org/1999/xhtml"></div>';
                output += '</foreignObject>';

                // Empty Area
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
            
            output += '<div class="value lbl tcd pat hpx aife jcc fx">';
                output += '<span><sup>$</sup>19.9<sub>M</sub></span>';
            output += '</div>';
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '.GaugeDesign{--h-px2: calc(var(--h-px) * 2);--ttl-h: 0px;--bar-thck: 5px}.GaugeDesign:has(.title){--ttl-h: 14px}.GaugeDesign .b{--bgc: var(--c-bg-empty-fill);--fillc: #3296ed}.GaugeDesign .b .title{height:calc(var(--h-px) - 0px - var(--b-lbl-h));color:#595959}.GaugeDesign .value.lbl{width:var(--h-px2)}.GaugeDesign .g line{stroke:var(--sc, var(--c-bg));stroke-width:var(--sw)}.GaugeDesign .g path{fill:none;stroke-width:var(--s);stroke:var(--bgc)}.GaugeDesign .g line,.GaugeDesign .g .empty{transform:rotate(calc(var(--pct) * 1.8deg));transform-origin:center bottom}.GaugeDesign foreignObject{width:var(--h-px2);height:var(--h-px)}.GaugeDesign .fill{--sh: calc(var(--h-px2) - 0.2px);width:var(--sh);height:var(--sh);margin:.1px 0 0 .1px;border-radius:50%;background:var(--f)}.GaugeDesign .fill::after{content:"";position:absolute;--ss: calc((var(--s) - 0.1) * 1px);--sh: calc(var(--h-px2) - (var(--ss) * 2));top:var(--ss);left:var(--ss);width:var(--sh);height:var(--sh);border-radius:50%;background:var(--c-bg)}';}

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
        Integer halfStrokeWidth = strokeWidth/2;
        Decimal svgRadius = radius - halfStrokeWidth;
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        String output = '';
        output += '<div class="b w1 hpx" style="--pct:' + pct + '">';
            output += '<svg class="g hpx pat" style="--s:' + strokeWidth + '" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg">';
                output += '<foreignObject>';
                    output += '<div style="--f:' + fill + '" class="fill" xmlns="http://www.w3.org/1999/xhtml"></div>';
                output += '</foreignObject>';
                output += '<path class="empty" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/>';
                output += '<line style="--pct:25;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                output += '<line style="--pct:50;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                output += '<line style="--pct:75;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                output += '<g>';
                    output += '<line style="--sw:' + (gap*3) + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                    output += '<line style="--sc:#666;--sw:' + gap + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                output += '</g>';
            output += '</svg>';
            output += '<div class="value lbl tcd pat hpx aife jcc fx">';
                output += '<span><sup>$</sup>19.9<sub>M</sub></span>';
            output += '</div>';
        output += '</div>';
        return output;
    }
}