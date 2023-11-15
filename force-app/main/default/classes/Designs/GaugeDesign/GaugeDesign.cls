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
            targetHTML = '<line class="_target" style="--d-stroke-color:#2e844a;--d-percent-value:' + target + ';" x1="' + (strokeWidth + (gap*2)) + '" y1="' + radius + '" y2="' + radius + '"/>';
            
        }

        /* //////////////////////////////////////////////// */
        String dividersHTML = '';
        if (true) {
            dividersHTML += '<line style="--d-percent-value:25;--d-stroke-width:' + gap + 'px" x1="' + strokeWidth + '" y1="' + radius + '" y2="' + radius + '"/>';
            dividersHTML += '<line style="--d-percent-value:50;--d-stroke-width:' + gap + 'px" x1="' + strokeWidth + '" y1="' + radius + '" y2="' + radius + '"/>';
            dividersHTML += '<line style="--d-percent-value:75;--d-stroke-width:' + gap + 'px" x1="' + strokeWidth + '" y1="' + radius + '" y2="' + radius + '"/>';
        }

        /* //////////////////////////////////////////////// */
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SF when Compressed
        /////////////////////////////////////////////////////
        String output = '';
        output += '<b class="hpx" style="--d-percent-value:' + pct + '">';
            output += titleBeforeHTML;

            output += '<d class="_chart-container">';
                output += '<d class="_chart">';
                    // Filled Area
                    output += '<d class="_chart-fill" style="--d-stroke-width:' + strokeWidth + ';--f:' + fill + '" />';
                    
                    output += '<svg class="_gauge hpx pat" style="--d-gap:' + gap + 'px;--d-stroke-width:' + strokeWidth + '" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg">';
                        // Empty Area
                        output += '<path e="1" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/>';

                        // Divider Gaps
                        output += dividersHTML;
                        
                        // Target
                        output += targetHTML;

                        // Needle
                        output += '<line style="--d-stroke-width:' + (gap*3) + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                        output += '<line style="--d-stroke-color:#666;" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                        output += '<circle fill="#666" cx="' + radius + '" cy="' + radius + '" r="' + (gap*2) + '"/>';
                    output += '</svg>';
                    
                    output += '<l class="_value pat hpx aife jcc fx">';
                        output += valueLabelHTML;
                    output += '</l>';

                output += '</d>';
            output += '</d>';

            output += titleAfterHTML;
            
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--h-px2:calc(var(--h-px)*2);--1:0;--10:var(--c-bg-empty-fill);--6:#3296ed;.z4{overflow:hidden}&:has(t){--1:13;.z4{--8:calc(var(--h) - var(--1));--7:calc(var(--8)/var(--h));width:calc(var(--h-px2)*var(--7));height:calc(var(--8)*1px);.z5{transform:scale(var(--7));transform-origin:top left}}}& t{height:calc(var(--1)*1px);& l:last-child{display:none}}& l.z0{width:var(--h-px2);& > *{display:block;background:#fffd;border-radius:10px 10px 0 0;padding:0px 2px;font-size:var(--0)}}&.sz1{--0:8px;--1:0;& b{display:flex}&:has(t){& l.z0{display:none}.--9{--8:var(--h)}}& t{height:var(--h-px);max-width:calc(100% - var(--h-px2));padding-left:10px;box-sizing:border-box;& l:last-child{display:block;font-size:9px;height:9px}}.z5{transform:none}& l.z0 > *{border-radius:5px 5px 0 0;padding:0 1px;letter-spacing:-.05em;font-weight:500}}&.sz2{--0:15px}&.sz3{--0:24px}.z2{& line,[e]{transform:rotate(calc(var(--4)*1.8deg));transform-origin:center bottom}& line{--2:var(--5);&.z1{--2:calc(var(--5)*2);outline:var(--5) solid #fff}stroke:var(--3,var(--c-bg));stroke-width:var(--2,var(--5))}& path{fill:none;stroke-width:var(--2);stroke:var(--10)}}.z3{--h02:calc(var(--h-px2) - .2px);width:var(--h02);height:var(--h02);margin:.1px 0 0 .1px;border-radius:var(--h-px) var(--h-px) 0 0;background:var(--f);--m:radial-gradient(transparent calc(var(--h-px) - (var(--2)*1px)),#000 0);-webkit-mask:var(--m);mask:var(--m)}.z5{position:relative;height:var(--h-px);width:var(--h-px2)}';}

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
            targetHTML = '<line class="z1" style="--3:#2e844a;--4:'+target+';" x1="'+(strokeWidth + (gap*2))+'" y1="'+radius+'" y2="'+radius+'"/>';
        }
        /* //////////////////////////////////////////////// */
        String dividersHTML = '';
        if (true) {
            dividersHTML += '<line style="--4:25;--2:'+gap+'px" x1="'+strokeWidth+'" y1="'+radius+'" y2="'+radius+'"/>';
            dividersHTML += '<line style="--4:50;--2:'+gap+'px" x1="'+strokeWidth+'" y1="'+radius+'" y2="'+radius+'"/>';
            dividersHTML += '<line style="--4:75;--2:'+gap+'px" x1="'+strokeWidth+'" y1="'+radius+'" y2="'+radius+'"/>';
        }
        /* //////////////////////////////////////////////// */
        return '<b class="hpx" style="--4:'+pct+'">' + titleBeforeHTML + '<d class="z4"><d class="z5"><d class="z3" style="--2:'+strokeWidth+';--f:'+fill+'" /><svg class="z2 hpx pat" style="--5:'+gap+'px;--2:'+strokeWidth+'" viewBox="0 0 '+diameter+' '+radius+'" xmlns="http://www.w3.org/2000/svg"><path e="1" d="M'+halfStrokeWidth+' '+radius+'A1 1 0 0 1 '+(diameter-halfStrokeWidth)+' '+radius+'"/>' + dividersHTML + targetHTML + '<line style="--2:'+(gap*3)+'px" x1="'+radius+'" y1="'+radius+'" y2="'+radius+'"/><line style="--3:#666;" x1="'+radius+'" y1="'+radius+'" y2="'+radius+'"/><circle fill="#666" cx="'+radius+'" cy="'+radius+'" r="'+(gap*2)+'"/></svg><l class="z0 pat hpx aife jcc fx">' + valueLabelHTML + '</l></d></d>' + titleAfterHTML + '</b>';
    }
}