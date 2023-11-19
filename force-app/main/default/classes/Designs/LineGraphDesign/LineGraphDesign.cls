public with sharing class LineGraphDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        Integer cmpIdx = (Integer)props.get('__cmpIdx');

        Boolean renderGridLines = true;
        Boolean renderFill = true;
        Boolean renderSmooth = true;
        Boolean renderAsSteps = false;
        Boolean renderPoints = false;

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

        ///////////////////////////////////////////////////////
        Integer dotSize = 6;
        
        Double xPadding = 0.0;
        Double yPadding = 1.0;

        if (renderAsSteps) {
            renderSmooth = false;
            xPadding = 1.0;
        } else if (dotSize <= 0) {
            renderPoints = false;
        }

        if (renderPoints) {
            xPadding = dotSize / 2.0;
            yPadding = dotSize / 2.0;
        }

        Integer graphWidth = 400;
        Integer graphHeight = 100;

        Double minDisplayValue = 0-100.0;
        Double maxDisplayValue = 100.0;
        Double baselineDisplayValue = 0.0;

        // Min baseline
        baselineDisplayValue = minDisplayValue;

        ///////////////////////////////////////////////////////
        Double displayValueRange = maxDisplayValue - minDisplayValue;
        Double displayScaleY = graphHeight / displayValueRange * -1;
        Double displayOffsetY = graphHeight - (minDisplayValue * displayScaleY);

        Double pointDisplayWidth = graphWidth / (dataPoints.size() - 1.0);
        
        ///////////////////////////////////////////////////////
        Double baselineDisplayY = (baselineDisplayValue * displayScaleY) + displayOffsetY;
        String baselineDisplayYS0 = String.valueOf(baselineDisplayY.intValue());
        ///////////////////////////////////////////////////////
        
        // Draw Line Path
        String fillPathData = '';
        String valuePoints = '';

        ///////////////////////////////////////////////////////
        
        // First Point - Took out of loop to avoid extra if checks for performance
        Integer displayY0 = ((dataPoints[0] * displayScaleY) + displayOffsetY).intValue();
        
        if (renderPoints) {
            valuePoints = 'M0,' + displayY0 + 'h0';
        }

        if (renderSmooth == false) {
            fillPathData = 'M-10,' + baselineDisplayYS0 + 'V' + displayY0 + 'H0';
            Double xOffset = 0.0;
            for (Integer i = 0; i < dataPoints.size(); i += 1 ) {
                Double displayY = (dataPoints[i] * displayScaleY) + displayOffsetY;

                if (renderAsSteps == false) {
                    fillPathData += 'L' + xOffset.intValue() + ',' + displayY.intValue();
                } else {
                    fillPathData += 'H' + xOffset.intValue() + 'V' + displayY.intValue();
                }

                if (renderPoints) {
                    valuePoints += 'M' + xOffset.intValue() + ',' + displayY.intValue() + 'h0';
                }

                xOffset += pointDisplayWidth;
            }
        } else {
            List<Double> linePoints  = new List<Double>();

            Double xOffset = 0.0;
            Integer dataSize = dataPoints.size();
            for (Integer i = 0; i < dataSize; i += 1 ) {
                Double displayY = (dataPoints[i] * displayScaleY) + displayOffsetY;

                linePoints.add(xOffset);
                linePoints.add(displayY);
                
                if (renderPoints) {
                    valuePoints += 'M' + xOffset.intValue() + ',' + displayY.intValue() + 'h0';
                }

                xOffset += pointDisplayWidth;
            }

            fillPathData = 'M-10,' + baselineDisplayYS0 + 'V' + displayY0 + 'H0C' + String.join(catmullRom2bezier(linePoints), ' ');
        }
        
        ///////////////////////////////////////////////////////
        // Lines + Fill Area
        
        String lineColor = '#008CF7';
        String fillColor = 'none';

        String gradientSVG = '';
        if (renderFill) {
            fillColor = '#008CF744';

            if (false) {
                // Fill Gradient
                if (baselineDisplayY > 95) {
                    gradientSVG = ''
                        + '<linearGradient id="g-' + cmpIdx + '" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100">'
                            + '<stop stop-color="green" offset="0%"/>'
                            + '<stop stop-color="blue" offset="100%"/>'
                        + '</linearGradient>';
                } else if (baselineDisplayY < 5) {
                    gradientSVG = ''
                        + '<linearGradient id="g-' + cmpIdx + '" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100">'
                            + '<stop stop-color="red" offset="0%"/>'
                            + '<stop stop-color="yellow" offset="100%"/>'
                        + '</linearGradient>';
                } else {
                    gradientSVG = ''
                        + '<linearGradient id="g-' + cmpIdx + '" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100">'
                            + '<stop stop-color="green" offset="0%"/>'
                            + '<stop stop-color="blue" offset="' + baselineDisplayY + '%"/>'
                            + '<stop stop-color="red" offset="' + baselineDisplayY + '%"/>'
                            + '<stop stop-color="yellow" offset="100%"/>'
                        + '</linearGradient>';
                }
            

                fillColor = 'url(#g-' + cmpIdx + ')';
            }
        }

        String fillPathSVG = '';
        if (xPadding > 0) {
            fillPathSVG = '<mask id="m' + cmpIdx + '"><path style="fill:white;" d="M-0.5-2H400.5V102H0"/></mask>'
                         + '<path mask="url(#m' + cmpIdx + ')" style="--d-line-color:' + lineColor + ';--d-fill-color:' + fillColor + '" class="_graph-fill" d="' + fillPathData + 'H410V' + baselineDisplayYS0 + '"/>';
        } else {
            fillPathSVG = '<path style="--d-line-color:' + lineColor + ';--d-fill-color:' + fillColor + '" class="_graph-fill" d="' + fillPathData + 'H410V' + baselineDisplayYS0 + '"/>';
        }
        
        ///////////////////////////////////////////////////////
        // Points
        String pointsPathSVG = '';
        
        if (renderPoints) {
            String pointColor = 'red';//'#027FD5';
            pointsPathSVG = '<path style="--d-point-color:' + pointColor + '" class="_graph-points" d="' + valuePoints + '"/>';
        }

        ///////////////////////////////////////////////////////
        // Horizontal grid lines
        String gridLineSVG = '';
        if (renderGridLines) {
            // (displayScaleY * -1 * 50).intValue(); 
            Integer markerGap = (displayScaleY * displayValueRange / -2.0).intValue();
            
            Integer baseline = baselineDisplayY.intValue();
            while (baseline - markerGap >= 0) {
                baseline -= markerGap;
            }
            
            gridLineSVG = '<path stroke="#e4e3e2" stroke-width="0.5" d="';
            for (Integer y = baseline; y <= 100; y += markerGap) {
                gridLineSVG += 'M0,' + y + 'h' + graphWidth;
            }
            gridLineSVG += '"/>';

            // gridLineSVG += '<line stroke="red" stroke-width="0.5" y1="' + baselineDisplayY.intValue() + '" x2="' + graphWidth + '" y2="' + baselineDisplayY.intValue() + '"/>';
        }

        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        String output = '';
        output += '<d>';
            output += '<svg viewBox="-' + xPadding.intValue() +' -' + yPadding.intValue() + ' ' + (graphWidth + (xPadding * 2)).intValue() + ' ' + (graphHeight + (yPadding * 2)).intValue() + '" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">';
                output += gridLineSVG;
                output += gradientSVG;
                output += fillPathSVG;
                output += pointsPathSVG;    
                
                // // Debug - baseline
                // for (Integer y = 0; y <= 100; y += 10) {
                //     output += '<line stroke="#777" stroke-width="0.5" y1="' + y + '" x2="' + graphWidth + '" y2="' + y + '"/>';
                // }
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

    public String getStyle() {return BaseGraphDesign.getStyle()+'.graph > d{position:relative;width:100cqw;height:100cqh;& svg{position:absolute;top:0;width:100%;height:100%;& path,line{vector-effect:non-scaling-stroke;stroke-linecap:round;stroke-linejoin:round;}.z2{fill-rule:nonzero;fill:var(--2);stroke-width:1px;stroke:var(--1);}.z1{stroke-width:min(3cqw,max(1.5px,6cqh));stroke-linecap:round;stroke:var(--0);}.z0{fill:#fff;stroke:none;}}}';}
    
    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        Integer cmpIdx = (Integer)props.get('__cmpIdx');
        Boolean renderGridLines = true;
        Boolean renderFill = true;
        Boolean renderSmooth = true;
        Boolean renderAsSteps = false;
        Boolean renderPoints = false;
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
        Integer dotSize = 6;
        Double xPadding = 0.0;
        Double yPadding = 1.0;
        if (renderAsSteps) {
            renderSmooth = false;
            xPadding = 1.0;
        } else if (dotSize <= 0) {
            renderPoints = false;
        }
        if (renderPoints) {
            xPadding = dotSize / 2.0;
            yPadding = dotSize / 2.0;
        }
        Integer graphWidth = 400;
        Integer graphHeight = 100;
        Double minDisplayValue = 0-100.0;
        Double maxDisplayValue = 100.0;
        Double baselineDisplayValue = 0.0;
        baselineDisplayValue = minDisplayValue;
        Double displayValueRange = maxDisplayValue - minDisplayValue;
        Double displayScaleY = graphHeight / displayValueRange * -1;
        Double displayOffsetY = graphHeight - (minDisplayValue * displayScaleY);
        Double pointDisplayWidth = graphWidth / (dataPoints.size() - 1.0);
        Double baselineDisplayY = (baselineDisplayValue * displayScaleY) + displayOffsetY;
        String baselineDisplayYS0 = String.valueOf(baselineDisplayY.intValue());
        String fillPathData = '';
        String valuePoints = '';
        Integer displayY0 = ((dataPoints[0] * displayScaleY) + displayOffsetY).intValue();
        if (renderPoints) {
            valuePoints = 'M0,'+displayY0+'h0';
        }
        if (renderSmooth == false) {
            fillPathData = 'M-10,'+baselineDisplayYS0+'V'+displayY0+'H0';
            Double xOffset = 0.0;
            for (Integer i = 0; i < dataPoints.size(); i += 1 ) {
                Double displayY = (dataPoints[i] * displayScaleY) + displayOffsetY;
                if (renderAsSteps == false) {
                    fillPathData += 'L'+xOffset.intValue()+','+displayY.intValue();
                } else {
                    fillPathData += 'H'+xOffset.intValue()+'V'+displayY.intValue();
                }
                if (renderPoints) {
                    valuePoints += 'M'+xOffset.intValue()+','+displayY.intValue()+'h0';
                }
                xOffset += pointDisplayWidth;
            }
        } else {
            List<Double> linePoints  = new List<Double>();
            Double xOffset = 0.0;
            Integer dataSize = dataPoints.size();
            for (Integer i = 0; i < dataSize; i += 1 ) {
                Double displayY = (dataPoints[i] * displayScaleY) + displayOffsetY;
                linePoints.add(xOffset);
                linePoints.add(displayY);
                if (renderPoints) {
                    valuePoints += 'M'+xOffset.intValue()+','+displayY.intValue()+'h0';
                }
                xOffset += pointDisplayWidth;
            }
            fillPathData = 'M-10,'+baselineDisplayYS0+'V'+displayY0+'H0C'+String.join(catmullRom2bezier(linePoints), ' ');
        }
        String lineColor = '#008CF7';
        String fillColor = 'none';
        String gradientSVG = '';
        if (renderFill) {
            fillColor = '#008CF744';
            if (false) {
                if (baselineDisplayY > 95) {
                    gradientSVG = '<linearGradient id="g-'+cmpIdx+'" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100"><stop stop-color="green" offset="0%"/><stop stop-color="blue" offset="100%"/></linearGradient>';
                } else if (baselineDisplayY < 5) {
                    gradientSVG = '<linearGradient id="g-'+cmpIdx+'" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100"><stop stop-color="red" offset="0%"/><stop stop-color="yellow" offset="100%"/></linearGradient>';
                } else {
                    gradientSVG = '<linearGradient id="g-'+cmpIdx+'" gradientUnits="userSpaceOnUse" x1="0" x2="0" y1="0" y2="100"><stop stop-color="green" offset="0%"/><stop stop-color="blue" offset="'+baselineDisplayY+'%"/><stop stop-color="red" offset="'+baselineDisplayY+'%"/><stop stop-color="yellow" offset="100%"/></linearGradient>';
                }
                fillColor = 'url(#g-'+cmpIdx+')';
            }
        }
        String fillPathSVG = '';
        if (xPadding > 0) {
            fillPathSVG = '<mask id="m'+cmpIdx+'"><path style="fill:white;" d="M-0.5-2H400.5V102H0"/></mask><path mask="url(#m'+cmpIdx+')" style="--1:'+lineColor+';--2:'+fillColor+'" class="z2" d="'+fillPathData+'H410V'+baselineDisplayYS0+'"/>';
        } else {
            fillPathSVG = '<path style="--1:'+lineColor+';--2:'+fillColor+'" class="z2" d="'+fillPathData+'H410V'+baselineDisplayYS0+'"/>';
        }
        String pointsPathSVG = '';
        if (renderPoints) {
            String pointColor = 'red';//'#027FD5';
            pointsPathSVG = '<path style="--0:'+pointColor+'" class="z1" d="'+valuePoints+'"/>';
        }
        String gridLineSVG = '';
        if (renderGridLines) {
            Integer markerGap = (displayScaleY * displayValueRange / -2.0).intValue();
            Integer baseline = baselineDisplayY.intValue();
            while (baseline - markerGap >= 0) {
                baseline -= markerGap;
            }
            gridLineSVG = '<path stroke="#e4e3e2" stroke-width="0.5" d="';
            for (Integer y = baseline; y <= 100; y += markerGap) {
                gridLineSVG += 'M0,'+y+'h'+graphWidth;
            }
            gridLineSVG += '"/>';
        }
        String output = '<d><svg viewBox="-'+xPadding.intValue()+' -'+yPadding.intValue()+' '+(graphWidth + (xPadding * 2)).intValue()+' '+(graphHeight + (yPadding * 2)).intValue()+'" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none">'+gridLineSVG+gradientSVG+fillPathSVG+pointsPathSVG+'</svg></d>';
        return BaseGraphDesign.render(props, output);
    }
}