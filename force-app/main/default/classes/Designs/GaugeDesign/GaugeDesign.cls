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
        // String valueLabelHTML = '<div class="lbl tal tcd">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</div>';
        String valueLabelHTML = '<div>' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</div>';

        /* //////////////////////////////////////////////// */
        String titleHTML = '';
        String titleBeforeHTML = '';
        String titleAfterHTML = '';

        if (true) {
            titleHTML = 
                '<div class="title fxc tal jcsb">'
                    + '<div class="lbl tcd">'
                        + '<span>Sales Goal</span>'
                    + '</div>'
                    + '<div class="lbl tcd">'
                        + valueLabelHTML
                    + '</div>'
              + '</div>';

            if (componentSize == 1) {
                titleAfterHTML = titleHTML;
            } else {
                titleBeforeHTML = titleHTML;
            }
        }
        
        /* //////////////////////////////////////////////// */
        String targetHTML = '';
        if (true) {
            targetHTML = '<line class="target" style="--sc:#2e844a;--pct:' + target + ';" x1="' + (strokeWidth + (gap*2)) + '" y1="' + radius + '" y2="' + radius + '"/>';
            
        }

        /* //////////////////////////////////////////////// */
        String dividersHTML = '';
        if (true) {
            dividersHTML += '<line style="--pct:25;--sw:' + gap + 'px" x1="' + strokeWidth + '" y1="' + radius + '" y2="' + radius + '"/>';
            dividersHTML += '<line style="--pct:50;--sw:' + gap + 'px" x1="' + strokeWidth + '" y1="' + radius + '" y2="' + radius + '"/>';
            dividersHTML += '<line style="--pct:75;--sw:' + gap + 'px" x1="' + strokeWidth + '" y1="' + radius + '" y2="' + radius + '"/>';
        }

        /* //////////////////////////////////////////////// */
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SF when Compressed
        /////////////////////////////////////////////////////
        String output = '';
        output += '<div class="b hpx" style="--pct:' + pct + '">';
            output += titleBeforeHTML;

            output += '<div class="chart-crop">';
                output += '<div class="chart">';
                    // Filled Area
                    output += '<div class="fill" style="--s:' + strokeWidth + ';--f:' + fill + '"></div>';
                    
                    output += '<svg class="g hpx pat" style="--gp:' + gap + 'px;--s:' + strokeWidth + '" viewBox="0 0 ' + diameter + ' ' + radius + '" xmlns="http://www.w3.org/2000/svg">';
                        // Empty Area
                        output += '<path class="empty" d="M' + halfStrokeWidth + ' ' + radius + 'A1 1 0 0 1 ' + (diameter-halfStrokeWidth) + ' ' + radius + '"/>';

                        // Divider Gaps
                        output += dividersHTML;
                        
                        // Target
                        output += targetHTML;

                        // Needle
                        output += '<line style="--sw:' + (gap*3) + 'px" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                        output += '<line style="--sc:#666;" x1="' + radius + '" y1="' + radius + '" y2="' + radius + '"/>';
                        output += '<circle fill="#666" cx="' + radius + '" cy="' + radius + '" r="' + (gap*2) + '"/>';
                    output += '</svg>';
                    
                    output += '<div class="value lbl tcd pat hpx aife jcc fx">';
                        output += valueLabelHTML;
                    output += '</div>';

                output += '</div>';
            output += '</div>';

            output += titleAfterHTML;
            
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--h-px2:calc(var(--h-px)*2);--ttl-h:0;--bgc:var(--c-bg-empty-fill);--fillc:#3296ed;&:has(.title){--ttl-h:13;.chart-crop{--ch:calc(var(--h) - var(--ttl-h));--scl:calc(var(--ch)/var(--h));width:calc(var(--h-px2)*var(--scl));height:calc(var(--ch)*1px);.chart{transform:scale(var(--scl));transform-origin:top left}}}.title{height:calc(var(--ttl-h)*1px);.lbl:last-child{display:none}}.value.lbl{width:var(--h-px2);& span{display:block;background:#fffd;border-radius:10px 10px 0 0;padding:0px 2px;font-size:var(--v-lbl-px)}}&.sz1{--mw:var(--h-px2);--v-lbl-px:8px;.b{display:flex}&:has(.title){.value.lbl{display:none}.chart-crop{--ch:var(--h)}}.title{height:var(--h-px);max-width:calc(100% - var(--h-px2));padding-left:10px;box-sizing:border-box;.lbl:last-child{display:block;font-size:9px;height:9px}}.chart{transform:none}.value.lbl span{border-radius:5px 5px 0 0;padding:0 1px;letter-spacing:-.05em;font-weight:500}}&.sz2{--v-lbl-px:15px}&.sz3{--v-lbl-px:24px}.g{& line,.empty{transform:rotate(calc(var(--pct)*1.8deg));transform-origin:center bottom}& line{&.target{--sw:calc(var(--gp)*2);outline:var(--gp) solid#fff}stroke:var(--sc,var(--c-bg));stroke-width:var(--sw,var(--gp))}& path{fill:none;stroke-width:var(--s);stroke:var(--bgc)}}.fill{--h02:calc(var(--h-px2) - .2px);width:var(--h02);height:var(--h02);margin:.1px 0 0 .1px;border-radius:var(--h-px) var(--h-px) 0 0;background:var(--f);--m:radial-gradient( transparent calc(var(--h-px) - (var(--s)*1px)),#000 0 );-webkit-mask:var(--m);mask:var(--m)}.chart{position:relative;height:var(--h-px);width:var(--h-px2)}';}

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
        String valueLabelHTML = '<div>'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</div>';
        /* //////////////////////////////////////////////// */
        String titleHTML = '';
        String titleBeforeHTML = '';
        String titleAfterHTML = '';
        if (true) {
            titleHTML = '<div class="title fxc tal jcsb"><div class="lbl tcd"><span>Sales Goal</span></div><div class="lbl tcd">'+valueLabelHTML+'</div></div>';
            if (componentSize == 1) {
                titleAfterHTML = titleHTML;
            } else {
                titleBeforeHTML = titleHTML;
            }
        }
        /* //////////////////////////////////////////////// */
        String targetHTML = '';
        if (true) {
            targetHTML = '<line class="target" style="--sc:#2e844a;--pct:'+target+';" x1="'+(strokeWidth + (gap*2))+'" y1="'+radius+'" y2="'+radius+'"/>';
        }
        /* //////////////////////////////////////////////// */
        String dividersHTML = '';
        if (true) {
            dividersHTML += '<line style="--pct:25;--sw:'+gap+'px" x1="'+strokeWidth+'" y1="'+radius+'" y2="'+radius+'"/>';
            dividersHTML += '<line style="--pct:50;--sw:'+gap+'px" x1="'+strokeWidth+'" y1="'+radius+'" y2="'+radius+'"/>';
            dividersHTML += '<line style="--pct:75;--sw:'+gap+'px" x1="'+strokeWidth+'" y1="'+radius+'" y2="'+radius+'"/>';
        }
        /* //////////////////////////////////////////////// */
        String output = '';
        output += '<div class="b hpx" style="--pct:'+pct+'">';
            output += titleBeforeHTML;
            output += '<div class="chart-crop">';
                output += '<div class="chart">';
                    output += '<div class="fill" style="--s:'+strokeWidth+';--f:'+fill+'"></div>';
                    output += '<svg class="g hpx pat" style="--gp:'+gap+'px;--s:'+strokeWidth+'" viewBox="0 0 '+diameter+' '+radius+'" xmlns="http://www.w3.org/2000/svg">';
                        output += '<path class="empty" d="M'+halfStrokeWidth+' '+radius+'A1 1 0 0 1 '+(diameter-halfStrokeWidth)+' '+radius+'"/>';
                        output += dividersHTML;
                        output += targetHTML;
                        output += '<line style="--sw:'+(gap*3)+'px" x1="'+radius+'" y1="'+radius+'" y2="'+radius+'"/>';
                        output += '<line style="--sc:#666;" x1="'+radius+'" y1="'+radius+'" y2="'+radius+'"/>';
                        output += '<circle fill="#666" cx="'+radius+'" cy="'+radius+'" r="'+(gap*2)+'"/>';
                    output += '</svg>';
                    output += '<div class="value lbl tcd pat hpx aife jcc fx">';
                        output += valueLabelHTML;
                    output += '</div>';
                output += '</div>';
            output += '</div>';
            output += titleAfterHTML;
        output += '</div>';
        return output;
    }
}