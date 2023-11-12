public with sharing class RingDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer rowHeight = (Integer)props.get('__height');
        Integer componentSize = (Integer)props.get('__sz');
        String titleText = 'Sales Goal';
        
        Boolean alwaysShowIcon = false;//true;

        Integer pct = Math.round(Math.random() * 100);
        // if (pct > 99) {
            pct = 100;
        // }

        /* //////////////////////////////////////////////// */
        String iconName = 'check';//check'; // check
        string primaryColor = '#2E844A';//'#DD7A01';//'#2E844A';

        // Salesforce flips the icon when filled in their UI
        // if (iconName == 'success' && pct == 100) {
            // iconName = 'check';
        // }

        /* //////////////////////////////////////////////// */
        Integer radius = rowHeight;
        Integer diameter = radius * 2;
        
        Integer strokeWidth = 3;
        Integer gap = 1;

        if (componentSize >= 3) {
            strokeWidth = 5;
            gap = 2;
        } else if (componentSize >= 2) {
            strokeWidth = 4;
            gap = 2;
        }

        Integer halfStrokeWidth = strokeWidth/2;
        Decimal svgRadius = radius - halfStrokeWidth;
        
        /* //////////////////////////////////////////////// */
        // String fill = '#3296ed';//'#2e844a;';//'conic-gradient(from 270deg, black 0% 12.5%, red 12.5% 25%, yellow 25% 37.5%, green 37.5% 50%);';
        // String fill = 'conic-gradient(from 270deg,var(--c-t3),var(--c-t1)100%)';
        String fill = 'conic-gradient(from 270deg,var(--fillc),var(--fillc) var(--ppct),var(--bgc) var(--ppct),var(--bgc) 100%)';
        /* //////////////////////////////////////////////// */
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        
        String pctLabelHTML =  MiniChartsHelper.generateLabelText( String.valueOf(pct) + '%');
        // String valueLabelHTML = MiniChartsHelper.generateLabelText('$' + String.valueOf(amt));

        /* //////////////////////////////////////////////// */
        String titleBeforeHTML = '';
        String titleAfterHTML = '';

        if (titleText != '') {
            if (componentSize == 1) {
                titleAfterHTML = 
                    '<div class="title fxc tal jcc">'
                        + '<div class="lbl tcd">'
                            + '<span>' + titleText + '</span>'
                        + '</div>'
                        + '<div class="lbl tcd">'
                            + pctLabelHTML
                        + '</div>'
                  + '</div>';
            } else {
                titleBeforeHTML = 
                    '<div class="title">'
                        + '<div class="lbl tcd">'
                            + '<span>' + titleText + '</span>'
                        + '</div>'
                  + '</div>';
            }
        }
        
        /* //////////////////////////////////////////////// */
        String iconHTML = '';
        if (iconName != '' && (alwaysShowIcon || pct >= 100)) {
            iconHTML = ''
                + '<div class="ico fx jcc aic ' + iconName + '">'
                    + '<svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">'
                        + '<use style="fill:var(--icoc)" href="#' + MiniChartsIcons.getIcon('utility', iconName) + '" />'
                    + '</svg>'
                + '</div>';
        }

        /* //////////////////////////////////////////////// */
        String fullClass = pct >= 100 ? ' full' : '';
        
        /* //////////////////////////////////////////////// */
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SF when Compressed
        /////////////////////////////////////////////////////
        String output = '';
        output += '<div class="b aa hpx fxc' + fullClass + '" style="--fillc:' + primaryColor + ';--pct:' + pct + '">';
            output += titleBeforeHTML;
                output += '<div class="chart-crop">';
                    output += '<div class="chart">';
                        output += '<div class="fill" style="--s:' + strokeWidth + ';--f:' + fill + '"></div>';
                        output += iconHTML;
                        output += '<div class="value lbl tcd pat hpx aic jcc fx">';
                            output += pctLabelHTML;
                        output += '</div>';
                    output += '</div>';
                output += '</div>';
            output += titleAfterHTML;
        output += '</div>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    public string getStyle() {return '--ttl-h:0;&:has(.title){--ttl-h:13}.b{--ppct:calc(var(--pct)*1%);--bgc:var(--c-bg-empty-fill);--fillc:black;--icoc:var(--fillc)}&.sz1{.b{flex-direction:row}.value.lbl{display:none}.title{height:var(--h-px);max-width:calc(100% - var(--h-px));padding-left:5px;.lbl:last-child{display:block;font-size:9px;height:9px}}&:has(.full):has(.ico){--c-bg:var(--fillc);.ico{--icoc:#fff}}}&.sz2{--v-lbl-px:12px}&.sz3{--v-lbl-px:18px}&:not(&.sz1){&:has(.title){.chart-crop{--ch:calc(var(--h) - var(--ttl-h));--scl:calc(var(--ch)/var(--h));width:calc(var(--h-px)*var(--scl));height:calc(var(--ch)*1px)}.chart{transform:scale(var(--scl));transform-origin:top left}}&:not(:has(.full)):has(.ico):has(.value){.ico{& svg{height:calc(var(--h-px)/4);margin-top:calc(var(--h-px)/-2.75)}}}}.title{height:calc(var(--ttl-h)*1px);.lbl{flex-grow:0}}.value{&.lbl{width:var(--h-px);& span{border-radius:5px;padding:0 1px;letter-spacing:-.05em;font-weight:500;font-size:var(--v-lbl-px)}}}.chart{--ch:var(--h);position:relative;width:var(--h-px);flex-shrink:0}.fill{position:absolute;width:var(--h-px);height:var(--h-px);border-radius:var(--h-px);background:var(--f);background-size:100% 100%;--m:radial-gradient( transparent calc((var(--h-px) - (var(--s)*2px))*0.5),#000 0 );-webkit-mask:var(--m);mask:var(--m)}.ico{position:relative;height:var(--h-px);& svg{height:clamp(9px,calc(var(--h-px)/2.5),20px)}&.warning{margin-top:-1px}}&:has(.ico){.value{margin-top:calc(var(--h-px)/9)}&:has(.full){.value{display:none}}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer rowHeight = (Integer)props.get('__height');
        Integer componentSize = (Integer)props.get('__sz');
        String titleText = 'Sales Goal';
        Boolean alwaysShowIcon = false;//true;
        Integer pct = Math.round(Math.random() * 100);
            pct = 100;
        /* //////////////////////////////////////////////// */
        String iconName = 'check';//check'; // check
        string primaryColor = '#2E844A';//'#DD7A01';//'#2E844A';
        /* //////////////////////////////////////////////// */
        Integer radius = rowHeight;
        Integer diameter = radius * 2;
        Integer strokeWidth = 3;
        Integer gap = 1;
        if (componentSize >= 3) {
            strokeWidth = 5;
            gap = 2;
        } else if (componentSize >= 2) {
            strokeWidth = 4;
            gap = 2;
        }
        Integer halfStrokeWidth = strokeWidth/2;
        Decimal svgRadius = radius - halfStrokeWidth;
        /* //////////////////////////////////////////////// */
        String fill = 'conic-gradient(from 270deg,var(--fillc),var(--fillc) var(--ppct),var(--bgc) var(--ppct),var(--bgc) 100%)';
        /* //////////////////////////////////////////////// */
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String pctLabelHTML =  MiniChartsHelper.generateLabelText( String.valueOf(pct)+'%');
        /* //////////////////////////////////////////////// */
        String titleBeforeHTML = '';
        String titleAfterHTML = '';
        if (titleText != '') {
            if (componentSize == 1) {
                titleAfterHTML = '<div class="title fxc tal jcc"><div class="lbl tcd"><span>'+titleText+'</span></div><div class="lbl tcd">'+pctLabelHTML+'</div></div>';
            } else {
                titleBeforeHTML = '<div class="title"><div class="lbl tcd"><span>'+titleText+'</span></div></div>';
            }
        }
        /* //////////////////////////////////////////////// */
        String iconHTML = '';
        if (iconName != '' && (alwaysShowIcon || pct >= 100)) {
            iconHTML = '<div class="ico fx jcc aic '+iconName+'"><svg viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg"><use style="fill:var(--icoc)" href="#'+MiniChartsIcons.getIcon('utility', iconName)+'" /></svg></div>';
        }
        /* //////////////////////////////////////////////// */
        String fullClass = pct >= 100 ? ' full' : '';
        /* //////////////////////////////////////////////// */
        String output = '';
        output += '<div class="b aa hpx fxc'+fullClass+'" style="--fillc:'+primaryColor+';--pct:'+pct+'">';
            output += titleBeforeHTML;
                output += '<div class="chart-crop">';
                    output += '<div class="chart">';
                        output += '<div class="fill" style="--s:'+strokeWidth+';--f:'+fill+'"></div>';
                        output += iconHTML;
                        output += '<div class="value lbl tcd pat hpx aic jcc fx">';
                            output += pctLabelHTML;
                        output += '</div>';
                    output += '</div>';
                output += '</div>';
            output += titleAfterHTML;
        output += '</div>';
        return output;
    }
}