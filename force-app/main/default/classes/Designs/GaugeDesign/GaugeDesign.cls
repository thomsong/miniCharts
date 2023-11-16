public with sharing class GaugeDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        // Integer cmpId = MiniChartsRenderer.getCmpIdx();
        Integer rowHeight = (Integer)props.get('__height');
        Integer componentSize = (Integer)props.get('__sz');
        
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);

        /* //////////////////////////////////////////////// */
        Integer radius = rowHeight;
        Integer diameter = radius * 2;
        
        Integer strokeWidth = 6;
        Integer gap = 1;

        if (componentSize >= 3) {
            strokeWidth = 12;
            gap = 2;
        } else if (componentSize >= 2) {
            strokeWidth = 10;
            gap = 2;
        }

        Integer halfStrokeWidth = strokeWidth/2;
        Decimal svgRadius = radius - halfStrokeWidth;

        /* //////////////////////////////////////////////// */
        // String fill = '#3296ed';//'#2e844a;';//'conic-gradient(from 270deg, black 0% 12.5%, red 12.5% 25%, yellow 25% 37.5%, green 37.5% 50%);';
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        
        /* //////////////////////////////////////////////// */
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        
        String valueLabelHTML = MiniChartsHelper.generateLabelText('$' + String.valueOf(amt));

        /* //////////////////////////////////////////////// */
        String titleHTML = '';
        String titleBeforeHTML = '';
        String titleAfterHTML = '';

        if (true) {
            titleHTML = 
                '<t class="fxc jcsb">'
                    + '<l>'
                        + 'Sales Goal'
                    + '</l>'
                    + '<l>'
                        + valueLabelHTML
                    + '</l>'
              + '</t>';

            if (componentSize == 1) {
                titleAfterHTML = titleHTML;
            } else {
                titleBeforeHTML = titleHTML;
            }
        }
        
        /* //////////////////////////////////////////////// */
        String targetHTML = '';
        if (true) {
            targetHTML = '<ln t="1" class="_target" style="--d-stroke-color:#2e844a;--d-percent-value:' + target + ';"/>';
            // targetHTML = '<path class="_target" style="--d-stroke-color:#2e844a;--d-percent-value:' + target + ';" d="' + (strokeWidth + (gap*2)) + '" y1="' + radius + '" y2="' + radius + '"/>';
            // targetHTML = '<path t="1" style="--d-stroke-color:#2e844a;--d-percent-value:' + target + ';" d="M' + (strokeWidth + (gap*2)) + ' ' + radius + 'l0 ' + radius + '"/>';
        }

        /* //////////////////////////////////////////////// */
        String dividersHTML = '';
        if (true) {
            dividersHTML += '<ln style="--d-percent-value:25"/>';
            dividersHTML += '<ln style="--d-percent-value:50"/>';
            dividersHTML += '<ln style="--d-percent-value:75"/>';
        }

        /* //////////////////////////////////////////////// */
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SF when Compressed
        /////////////////////////////////////////////////////
        String output = '';
        output += '<b class="hpx" style="--d-percent-value:' + pct + ';--d-stroke-width:' + strokeWidth + 'px;--d-line-width:' + gap + 'px">';
            output += titleBeforeHTML;

            output += '<d class="_chart-container">';
                output += '<d class="_chart">';
                    // Filled Area
                    output += '<d class="_chart-fill" style="--f:' + fill + '" />';
                 
                    // Divider Gaps
                    output += dividersHTML;
                    
                    // Target
                    output += targetHTML;

                    // Needle

                    output += '<ln n="1" style="--d-stroke-color:#666;"/>';
                       
                    output += '<l class="_value pat hpx aife jcc fx">';
                        output += valueLabelHTML;
                    output += '</l>';

                output += '</d>';
            output += '</d>';

            output += titleAfterHTML;
            
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--h-px2:calc(var(--h-px)*2);--d-total-height:0;--d-background-color:var(--c-bg-empty-fill);--d-fill-color:#3296ed;._chart-container{overflow:hidden}&:has(t){--d-total-height:13;._chart-container{--d-chart-height:calc(var(--h) - var(--d-total-height));--d-chart-scale:calc(var(--d-chart-height)/var(--h));width:calc(var(--h-px2)*var(--d-chart-scale));height:calc(var(--d-chart-height)*1px);._chart{transform:scale(var(--d-chart-scale));transform-origin:top left}}}& t{height:calc(var(--d-total-height)*1px);& l:last-child{display:none}}& l._value{width:var(--h-px2);& > *{display:block;background:#fffd;border-radius:10px 10px 0 0;padding:0px 2px;font-size:var(--d-value-font-size)}}&.sz1{--d-value-font-size:8px;--d-total-height:0;& b{display:flex}&:has(t){& l._value{display:none}.--d-chart-container{--d-chart-height:var(--h)}}& t{height:var(--h-px);max-width:calc(100% - var(--h-px2));padding-left:10px;box-sizing:border-box;& l:last-child{display:block;font-size:9px;height:9px}}._chart{transform:none}& l._value > *{border-radius:5px 5px 0 0;padding:0 1px;letter-spacing:-.05em;font-weight:500}}&.sz2{--d-value-font-size:15px}&.sz3{--d-value-font-size:24px}& ln,& ln[t]:after{position:absolute;top:0;background:var(--d-stroke-color,#fff)}& ln{--d-half-line-width:calc(var(--d-line-width)/2);bottom:0;left:calc(50% - var(--d-half-line-width));width:var(--d-line-width);transform:rotate(calc(var(--d-percent-value)*1.8deg - 90deg));transform-origin:bottom;&[t]{background:none}&[n]{outline:calc(var(--d-half-line-width)/2) solid white}&[t]:after{content:"";left:calc(var(--d-half-line-width)*-1);width:calc(var(--d-line-width)*2);height:calc(var(--d-stroke-width)*1.25);outline:var(--d-half-line-width) solid white}}._chart-fill{--h02:calc(var(--h-px2) - .2px);width:var(--h02);height:var(--h02);margin:.1px 0 0 .1px;border-radius:var(--h-px) var(--h-px) 0 0;--d-empty-fill-pct:calc(var(--d-percent-value)*0.5%);background-image:conic-gradient(from 270deg,transparent var(--d-empty-fill-pct),var(--d-background-color) var(--d-empty-fill-pct)),var(--f);--m:radial-gradient(transparent calc(var(--h-px) - var(--d-stroke-width)),#000 0);-webkit-mask:var(--m);mask:var(--m)}._chart{position:relative;height:var(--h-px);width:var(--h-px2)}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer rowHeight = (Integer)props.get('__height');
        Integer componentSize = (Integer)props.get('__sz');
        Integer pct = Math.round(Math.random() * 100);
        Integer target = Math.round(Math.random() * 100);
        /* //////////////////////////////////////////////// */
        Integer radius = rowHeight;
        Integer diameter = radius * 2;
        Integer strokeWidth = 6;
        Integer gap = 1;
        if (componentSize >= 3) {
            strokeWidth = 12;
            gap = 2;
        } else if (componentSize >= 2) {
            strokeWidth = 10;
            gap = 2;
        }
        Integer halfStrokeWidth = strokeWidth/2;
        Decimal svgRadius = radius - halfStrokeWidth;
        /* //////////////////////////////////////////////// */
        String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)50%)';
        /* //////////////////////////////////////////////// */
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String valueLabelHTML = MiniChartsHelper.generateLabelText('$'+String.valueOf(amt));
        /* //////////////////////////////////////////////// */
        String titleHTML = '';
        String titleBeforeHTML = '';
        String titleAfterHTML = '';
        if (true) {
            titleHTML = '<t class="fxc jcsb"><l>Sales Goal</l><l>'+valueLabelHTML+'</l></t>';
            if (componentSize == 1) {
                titleAfterHTML = titleHTML;
            } else {
                titleBeforeHTML = titleHTML;
            }
        }
        /* //////////////////////////////////////////////// */
        String targetHTML = '';
        if (true) {
            targetHTML = '<ln t="1" class="_target" style="--d-stroke-color:#2e844a;--d-percent-value:'+target+';"/>';
        }
        /* //////////////////////////////////////////////// */
        String dividersHTML = '';
        if (true) {
            dividersHTML += '<ln style="--d-percent-value:25"/>';
            dividersHTML += '<ln style="--d-percent-value:50"/>';
            dividersHTML += '<ln style="--d-percent-value:75"/>';
        }
        /* //////////////////////////////////////////////// */
        String output = '';
        output += '<b class="hpx" style="--d-percent-value:'+pct+';--d-stroke-width:'+strokeWidth+'px;--d-line-width:'+gap+'px">';
            output += titleBeforeHTML;
            output += '<d class="_chart-container">';
                output += '<d class="_chart">';
                    output += '<d class="_chart-fill" style="--f:'+fill+'" />';
                    output += dividersHTML;
                    output += targetHTML;
                    output += '<ln n="1" style="--d-stroke-color:#666;"/>';
                    output += '<l class="_value pat hpx aife jcc fx">';
                        output += valueLabelHTML;
                    output += '</l>';
                output += '</d>';
            output += '</d>';
            output += titleAfterHTML;
        output += '</b>';
        return output;
    }
}