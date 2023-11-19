public with sharing class FunnelDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer cmpIdx = (Integer)props.get('__cmpIdx');

        Boolean showSmallValues = true;

        Integer pct = Math.round(Math.random() * 100);

        ///////////////////////////////////////////////////////
        List<Double> funnelValues = new List<Double>();

        Double currentValue = 0.0;
        
        for (Integer idx = 0; idx < 33; idx += 1) {
            // currentValue -= (Math.random() * currentValue * 0.3);
            currentValue = Math.random() * 100;
            funnelValues.add(currentValue);
        }
        
        // System.debug(funnelValues);
        
        ///////////////////////////////////////////////////////

        Integer graphWidth = 400;
        Integer graphHeight = 100;

        Double funnelStepDisplayWidth = graphWidth / funnelValues.size();
        Integer funnelStepTransitionWidth = 0;
        
        funnelStepTransitionWidth = Math.round(funnelStepDisplayWidth * 0.15);
        if (funnelStepTransitionWidth < 1) {
            funnelStepTransitionWidth = 1;
        }
        
        Double funnelStepTransitionWidthDouble = Double.valueOf(funnelStepTransitionWidth);
        funnelStepDisplayWidth = (graphWidth - (funnelStepTransitionWidthDouble * (funnelValues.size()-1))) / funnelValues.size();
        
        if (showSmallValues) {
            for (Integer i = 1; i < funnelValues.size(); i += 1 ) {
                if (funnelValues[i] < 4.0) {
                    funnelValues[i] = 4.0;
                }
            }
        }

        ///////////////////////////////////////////////////////
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String titleHTML = '';
        if (true) {
            titleHTML = ''
                + '<t s="sm">'
                    + '<l>' + 'Win Rate' + '</l>'
                    + '<l class="tar">' + MiniChartsHelper.generateLabelText('$' + String.valueOf(amt)) + '</l>'
                + '</t>';
        }
        
        ///////////////////////////////////////////////////////
        String xLabelsHTML = '';
        if (true) {
            String funnelWidth = '';
            
            if (false) {
                String.valueOf(funnelStepDisplayWidth / 400);
            }
            xLabelsHTML = ''
                + '<d class="_x-labels fxr jcsb" style="--d-step-width:' + funnelWidth + '">'
                    + '<l><pct>100</pct> Stage 1</l>'
                    // + '<l><pct>80</pct> Stage 2</l>'
                    // + '<l><pct>76</pct> Stage 3</l>'
                    // + '<l><pct>62</pct> Stage 4</l>'
                    // + '<l><pct>49</pct> Stage 5</l>'
                    + '<l><pct>24</pct> Stage 6</l>'
                + '</d>';
        }

        ///////////////////////////////////////////////////////

        Integer funnelStepDisplayWidthInt = funnelStepDisplayWidth.intValue();
        String funnelStepTransitionWidthS0 = String.valueOf(funnelStepTransitionWidth);
        Double stepRemainder = funnelStepDisplayWidth - funnelStepDisplayWidthInt;

        Integer xOffset = 0;
        Integer lastXOffset = 0;
        Integer lastHalfValue = 0;

        String fillPathData = '';
        String transitionPathData = '';

        Double totalRemainer = 0.0;

        for (Integer i = 0; i < funnelValues.size(); i += 1 ) {
            Integer halfValue = (funnelValues[i] / 2).intValue();
            Integer value = halfValue * 2;

            if (i > 0) {
                String tPath = 'M' + xOffset + ',' + (50 - lastHalfValue) + 'l' + funnelStepTransitionWidthS0 + ',' + (lastHalfValue - halfValue) + 'v' + value + 'l-' + funnelStepTransitionWidthS0 + ',' + (lastHalfValue - halfValue) + 'Z   ';
                fillPathData += tPath;
                transitionPathData += tPath;

                xOffset += funnelStepTransitionWidth;
            }
            
            Integer hWidth = funnelStepDisplayWidthInt;
             
            totalRemainer += stepRemainder;
            if (totalRemainer >= 0.9) {
                Double hAdditional = Math.round(totalRemainer);
                totalRemainer -= hAdditional;
                hWidth += hAdditional.intValue();
            }

            fillPathData += 'M' + xOffset + ',' + (50 - halfValue) + 'h' + hWidth + 'v' + value + 'h-' + hWidth + 'Z';

            lastXOffset = xOffset;
            lastHalfValue = halfValue;

            xOffset += hWidth;
        }

        ///////////////////////////////////////////////////////
        String fillColor = 'none';

        String gradientSVG = '';
        fillColor = '#3290ED';

        if (false) {
            // Fill Gradient
            gradientSVG = ''
                + '<linearGradient id="g-' + cmpIdx + '" gradientUnits="userSpaceOnUse" x1="0" x2="400" y1="0" y2="0">'
                    + '<stop stop-color="#034ABC" offset="0%"/>'
                    + '<stop stop-color="#3DBA67" offset="100%"/>'
                + '</linearGradient>';

            fillColor = 'url(#g-' + cmpIdx + ')';
        }
        

        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<b style="--d-percent-value:' + pct + '%">';
            output += titleHTML;
            output += '<d class="fg fxr">';
                output += '<d class="graph fg">';
                    output += '<d>';
                        output += '<svg viewBox="0 0 ' + graphWidth + ' ' + graphHeight + '" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">';
                            output += gradientSVG;
                            output += '<path style="fill:' + fillColor + '" d="' + fillPathData + '"/>';
                            output += '<path fill="#0000002A" d="' + transitionPathData + '"/>';
                        output += '</svg>';
                    output += '</d>';
                output += '</d>';
            output += '</d>';
            output += xLabelsHTML;
        output += '</b>';
        
        return output;
    } /* END RENDER_TEMPLATE */

    
    public String getStyle() {return '--1:0px;--0:0px;&:has(t){--1:13px;}&:has(t[s="sm"]){--1:11px;}&:has(.z0){--0:11px;}--3:calc(var(--h-px) - var(--1) - var(--0));& b{width:100%;& t{height:var(--1);& l:first-of-type{padding-right:1ch;}}.graph{position:relative;height:var(--3);container-type:size;& > d{position:relative;width:100cqw;height:100cqh;& svg{position:absolute;top:0;width:100%;height:100%;}}}.z0{font-size:8px;height:var(--0);& l{width:calc(var(--2,1)*100%);text-align:center;}}}&.sz1:has(t){--0:0px;.z0{display:none;}}';}

    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer cmpIdx = (Integer)props.get('__cmpIdx');
        Boolean showSmallValues = true;
        Integer pct = Math.round(Math.random() * 100);
        List<Double> funnelValues = new List<Double>();
        Double currentValue = 0.0;
        for (Integer idx = 0; idx < 33; idx += 1) {
            currentValue = Math.random() * 100;
            funnelValues.add(currentValue);
        }
        Integer graphWidth = 400;
        Integer graphHeight = 100;
        Double funnelStepDisplayWidth = graphWidth / funnelValues.size();
        Integer funnelStepTransitionWidth = 0;
        funnelStepTransitionWidth = Math.round(funnelStepDisplayWidth * 0.15);
        if (funnelStepTransitionWidth < 1) {
            funnelStepTransitionWidth = 1;
        }
        Double funnelStepTransitionWidthDouble = Double.valueOf(funnelStepTransitionWidth);
        funnelStepDisplayWidth = (graphWidth - (funnelStepTransitionWidthDouble * (funnelValues.size()-1))) / funnelValues.size();
        if (showSmallValues) {
            for (Integer i = 1; i < funnelValues.size(); i += 1 ) {
                if (funnelValues[i] < 4.0) {
                    funnelValues[i] = 4.0;
                }
            }
        }
        Decimal amt = (Math.random() * 10000000.0) - 5000000;
        String titleHTML = '';
        if (true) {
            titleHTML = '<t s="sm"><l>Win Rate</l><l class="tar">'+MiniChartsHelper.generateLabelText('$'+String.valueOf(amt))+'</l></t>';
        }
        String xLabelsHTML = '';
        if (true) {
            String funnelWidth = '';
            if (false) {
                String.valueOf(funnelStepDisplayWidth / 400);
            }
            xLabelsHTML = '<d class="z0 fxr jcsb" style="--2:'+funnelWidth+'"><l><pct>100</pct> Stage 1</l><l><pct>24</pct> Stage 6</l></d>';
        }
        Integer funnelStepDisplayWidthInt = funnelStepDisplayWidth.intValue();
        String funnelStepTransitionWidthS0 = String.valueOf(funnelStepTransitionWidth);
        Double stepRemainder = funnelStepDisplayWidth - funnelStepDisplayWidthInt;
        Integer xOffset = 0;
        Integer lastXOffset = 0;
        Integer lastHalfValue = 0;
        String fillPathData = '';
        String transitionPathData = '';
        Double totalRemainer = 0.0;
        for (Integer i = 0; i < funnelValues.size(); i += 1 ) {
            Integer halfValue = (funnelValues[i] / 2).intValue();
            Integer value = halfValue * 2;
            if (i > 0) {
                String tPath = 'M'+xOffset+','+(50 - lastHalfValue)+'l'+funnelStepTransitionWidthS0+','+(lastHalfValue - halfValue)+'v'+value+'l-'+funnelStepTransitionWidthS0+','+(lastHalfValue - halfValue)+'Z ';
                fillPathData += tPath;
                transitionPathData += tPath;
                xOffset += funnelStepTransitionWidth;
            }
            Integer hWidth = funnelStepDisplayWidthInt;
            totalRemainer += stepRemainder;
            if (totalRemainer >= 0.9) {
                Double hAdditional = Math.round(totalRemainer);
                totalRemainer -= hAdditional;
                hWidth += hAdditional.intValue();
            }
            fillPathData += 'M'+xOffset+','+(50 - halfValue)+'h'+hWidth+'v'+value+'h-'+hWidth+'Z';
            lastXOffset = xOffset;
            lastHalfValue = halfValue;
            xOffset += hWidth;
        }
        String fillColor = 'none';
        String gradientSVG = '';
        fillColor = '#3290ED';
        if (false) {
            gradientSVG = '<linearGradient id="g-'+cmpIdx+'" gradientUnits="userSpaceOnUse" x1="0" x2="400" y1="0" y2="0"><stop stop-color="#034ABC" offset="0%"/><stop stop-color="#3DBA67" offset="100%"/></linearGradient>';
            fillColor = 'url(#g-'+cmpIdx+')';
        }
        return '<b style="--d-percent-value:'+pct+'%">'+titleHTML+'<d class="fg fxr"><d class="graph fg"><d><svg viewBox="0 0 '+graphWidth+' '+graphHeight+'" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">'+gradientSVG+'<path style="fill:'+fillColor+'" d="'+fillPathData+'"/><path fill="#0000002A" d="'+transitionPathData+'"/></svg></d></d></d>'+xLabelsHTML+'</b>';
    }
}