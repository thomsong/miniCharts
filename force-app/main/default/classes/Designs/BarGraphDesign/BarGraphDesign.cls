public with sharing class BarGraphDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer cmpIdx = (Integer)props.get('__cmpIdx');


        Boolean showSmallValues = true;

        Double[] dataPoints = new Double[50];

        Integer idx = 0;
        Double lastVal = 0-1000.0;
        for (Double i: dataPoints) {
            dataPoints[idx] = (Math.random() * 200.0) - 100.0;

            if (lastVal > -1000) {
                Double delta = dataPoints[idx] - lastVal;

                if (delta < -50.0) {
                    dataPoints[idx] = lastVal - (50.0 * Math.random());
                } else if (delta > 50.0) {
                    dataPoints[idx] = lastVal + (50.0 * Math.random());
                }
            }

            // dataPoints[idx] = 4.0;//
            lastVal = dataPoints[idx];
            idx += 1;
        }

        ///////////////////////////////////////////////////////
        Double xPadding = 1.0;
        Double yPadding = 1.0;

        Integer graphWidth = 400;
        Integer graphHeight = 100;

        Double minDisplayValue = 0-100.0;
        Double maxDisplayValue = 100.0;
        Double baselineDisplayValue = 0.0;

        // Min baseline
        // baselineDisplayValue = minDisplayValue;

        ///////////////////////////////////////////////////////
        Double displayValueRange = maxDisplayValue - minDisplayValue;
        Double displayScaleY = graphHeight / displayValueRange * -1;
        Double displayOffsetY = graphHeight - (minDisplayValue * displayScaleY);

       
        Double barDisplayWidth = graphWidth / dataPoints.size();

        Double barDisplayPadding = barDisplayWidth * 0.25; //25% goes to padding
        barDisplayWidth = (graphWidth - (barDisplayPadding * (dataPoints.size()-1))) / dataPoints.size();

        
        ///////////////////////////////////////////////////////
        Double baselineDisplayY = (baselineDisplayValue * displayScaleY) + displayOffsetY;
        String baselineDisplayYS0 = String.valueOf(baselineDisplayY.intValue());
        ///////////////////////////////////////////////////////
        
        // Draw Line Path
        String fillPathData = '';

        ///////////////////////////////////////////////////////
        
        Integer barDisplayWidthS0 = barDisplayWidth.intValue();
        
        Double xOffset = 0.0;
        for (Integer i = 0; i < dataPoints.size(); i += 1 ) {
            Double displayY = ((dataPoints[i] * displayScaleY) + displayOffsetY);

            if (showSmallValues) {
                Double baselineDelta = baselineDisplayY - displayY;
                
                if (baselineDelta < 0 && baselineDelta > -2.0) {
                    displayY = baselineDisplayY - 2.0;
                } else if (baselineDelta >= 0 && baselineDelta < 2.0) {
                    displayY = baselineDisplayY + 2.0;
                }
            }

            fillPathData += 'M' + xOffset.intValue() + ',' + baselineDisplayYS0 + 'V' + displayY.intValue() + 'h' + barDisplayWidthS0 + 'V' + baselineDisplayYS0 + 'z';
            
            xOffset += barDisplayWidth + barDisplayPadding;
        }
        
        
        ///////////////////////////////////////////////////////
        // Lines + Fill Area
        
        String lineColor = '#008CF7';
        String fillColor = 'none';

        String gradientSVG = '';
        fillColor = '#BBDEFC';

        fillColor = lineColor;
        // lineColor = 'none';

        if (true) {
            // Fill Gradient
            gradientSVG = ''
                + '<linearGradient id="g-' + cmpIdx + '" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100">'
                    + '<stop stop-color="green" offset="' + baselineDisplayY + '%"/>'
                    + '<stop stop-color="red" offset="' + baselineDisplayY + '%"/>'
                + '</linearGradient>';

            fillColor = 'url(#g-' + cmpIdx + ')';
        }
        
        String fillPathSVG = '<path style="--d-fill-color:' + fillColor + '" class="_graph-fill" d="' + fillPathData + '"/>';
        
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<d>';
            output += '<svg viewBox="-' + xPadding.intValue() +' -' + yPadding.intValue() + ' ' + (graphWidth + (xPadding * 2)).intValue() + ' ' + (graphHeight + (yPadding * 2)).intValue() + '" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">';
                output += gradientSVG;
                output += fillPathSVG;    
                
                // Debug - baseline
                // output += '<line stroke="#777" stroke-width="0.5" y1="' + baselineDisplayYS0 + '" x2="' + graphWidth + '" y2="' + baselineDisplayYS0 + '"/>';
            output += '</svg>';
        output += '</d>';
        
        return BaseGraphDesign.render(props, output);
    } /* END RENDER_TEMPLATE */
    
    private List<Integer> catmullRom2bezier( List<Double> crp ) {
        Integer crpLenM2 = crp.size() - 2;
        Integer crpLenM4 = crpLenM2 - 2;
        
        List<Integer> bezierPoints = new List<Integer>();
        for (Integer i = 0; i < crpLenM2; i+=2) {
            Double p0x, p0y, p3x, p3y;

            Double p1x = crp[ i ];
            Double p1y = crp[ i + 1 ];
            Double p2x = crp[ i + 2 ];
            Double p2y = crp[ i + 3 ];

            if ( i == 0 ) {
                p0x = p1x;
                p0y = p1y;

                p3x = crp[ i + 4 ];
                p3y = crp[ i + 5 ];
            } else if ( i == crpLenM4) {
                p0x = crp[ i - 2 ];
                p0y = crp[ i - 1 ];

                p3x = p2x;
                p3y = p2y;
            } else {
                p0x = crp[ i - 2 ];
                p0y = crp[ i - 1 ];

                p3x = crp[ i + 4 ];
                p3y = crp[ i + 5 ];
            }

            // Integer bp1x = ((6 * p1x + p2x - p0x) / 6).intValue();
            // Integer bp1y = ((6 * p1y + p2y - p0y) / 6).intValue();

            // Integer bp2x = ((6 * p2x + p1x - p3x) / 6).intValue();
            // Integer bp2y = ((6 * p2y + p1y - p3y) / 6).intValue();

            Integer bp1x = (p1x + ((p2x - p0x) / 6)).intValue();
            Integer bp1y = (p1y + ((p2y - p0y) / 6)).intValue();

            Integer bp2x = (p2x + ((p1x - p3x) / 6)).intValue();
            Integer bp2y = (p2y + ((p1y - p3y) / 6)).intValue();

            if (bp1y > 100) {
                bp1y = 100;
            } else if (bp1y < 0) {
                bp1y = 0;
            }

            if (bp2y > 100) {
                bp2y = 100;
            } else if (bp2y < 0) {
                bp2y = 0;
            }

            bezierPoints.add(bp1x);
            bezierPoints.add(bp1y);
            bezierPoints.add(bp2x);
            bezierPoints.add(bp2y);
            bezierPoints.add(p2x.intValue());
            bezierPoints.add(p2y.intValue());
        }
        
        return bezierPoints;
      }

    public String getStyle() {return BaseGraphDesign.getStyle()+'.graph > d{position:relative;width:100cqw;height:100cqh;& svg{position:absolute;top:0;width:100%;height:100%;& path,line{vector-effect:non-scaling-stroke;}.z0{fill:var(--0);}}}';}
    
    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer cmpIdx = (Integer)props.get('__cmpIdx');
        Boolean showSmallValues = true;
        Double[] dataPoints = new Double[50];
        Integer idx = 0;
        Double lastVal = 0-1000.0;
        for (Double i: dataPoints) {
            dataPoints[idx] = (Math.random() * 200.0) - 100.0;
            if (lastVal > -1000) {
                Double delta = dataPoints[idx] - lastVal;
                if (delta < -50.0) {
                    dataPoints[idx] = lastVal - (50.0 * Math.random());
                } else if (delta > 50.0) {
                    dataPoints[idx] = lastVal + (50.0 * Math.random());
                }
            }
            lastVal = dataPoints[idx];
            idx += 1;
        }
        Double xPadding = 1.0;
        Double yPadding = 1.0;
        Integer graphWidth = 400;
        Integer graphHeight = 100;
        Double minDisplayValue = 0-100.0;
        Double maxDisplayValue = 100.0;
        Double baselineDisplayValue = 0.0;
        Double displayValueRange = maxDisplayValue - minDisplayValue;
        Double displayScaleY = graphHeight / displayValueRange * -1;
        Double displayOffsetY = graphHeight - (minDisplayValue * displayScaleY);
        Double barDisplayWidth = graphWidth / dataPoints.size();
        Double barDisplayPadding = barDisplayWidth * 0.25; //25% goes to padding
        barDisplayWidth = (graphWidth - (barDisplayPadding * (dataPoints.size()-1))) / dataPoints.size();
        Double baselineDisplayY = (baselineDisplayValue * displayScaleY) + displayOffsetY;
        String baselineDisplayYS0 = String.valueOf(baselineDisplayY.intValue());
        String fillPathData = '';
        Integer barDisplayWidthS0 = barDisplayWidth.intValue();
        Double xOffset = 0.0;
        for (Integer i = 0; i < dataPoints.size(); i += 1 ) {
            Double displayY = ((dataPoints[i] * displayScaleY) + displayOffsetY);
            if (showSmallValues) {
                Double baselineDelta = baselineDisplayY - displayY;
                if (baselineDelta < 0 && baselineDelta > -2.0) {
                    displayY = baselineDisplayY - 2.0;
                } else if (baselineDelta >= 0 && baselineDelta < 2.0) {
                    displayY = baselineDisplayY + 2.0;
                }
            }
            fillPathData += 'M'+xOffset.intValue()+','+baselineDisplayYS0+'V'+displayY.intValue()+'h'+barDisplayWidthS0+'V'+baselineDisplayYS0+'z';
            xOffset += barDisplayWidth + barDisplayPadding;
        }
        String lineColor = '#008CF7';
        String fillColor = 'none';
        String gradientSVG = '';
        fillColor = '#BBDEFC';
        fillColor = lineColor;
        if (true) {
            gradientSVG = '<linearGradient id="g-'+cmpIdx+'" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100"><stop stop-color="green" offset="'+baselineDisplayY+'%"/><stop stop-color="red" offset="'+baselineDisplayY+'%"/></linearGradient>';
            fillColor = 'url(#g-'+cmpIdx+')';
        }
        String fillPathSVG = '<path style="--0:'+fillColor+'" class="z0" d="'+fillPathData+'"/>';
        String output = '<d><svg viewBox="-'+xPadding.intValue()+' -'+yPadding.intValue()+' '+(graphWidth + (xPadding * 2)).intValue()+' '+(graphHeight + (yPadding * 2)).intValue()+'" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">'+gradientSVG+fillPathSVG+'</svg></d>';
        return BaseGraphDesign.render(props, output);
    }
}