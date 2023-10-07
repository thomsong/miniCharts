public class MiniChartsLineChartDesign extends MiniChartsDesign {
    public MiniChartsLineChartDesign() {
        this.COMPILED_CSS_STYLE = 'svg.theme-1 #fillGradient stop:nth-child(1){stop-color:#04844b}svg.theme-1 #fillGradient stop:nth-child(2){stop-color:#aa2422}.sparkline path{stroke:#000;stroke-linejoin:round;stroke-linecap:round;stroke-width:1.5;fill:none}.sparkline path.filled{fill:#000;opacity:.2;stroke:none !important}.sparkline path.purple{stroke:#9d53f2}.sparkline path.purple.filled{fill:#9d53f2}.sparkline path.blue{stroke:#3296ed}.sparkline path.blue.filled{fill:#3296ed}.sparkline path.green{stroke:#04844b}.sparkline path.green.filled{fill:#04844b}.sparkline path.red{stroke:#aa2422}.sparkline path.red.filled{fill:#aa2422}.sparkline path.yellow{stroke:#fcc003}.sparkline path.yellow.filled{fill:#fcc003}.sparkline path.red-to-green{stroke:url(#fillGradient)}.sparkline path.red-to-green.filled{fill:url(#fillGradient)}line{stroke:#000;opacity:.75;stroke-width:.25}';
    }

    public override virtual String render(Map<String, Object> params, Integer[] chartSize) {
        this.renderChart(params);
        return super.render(params, chartSize);
    }

    private void renderChart(Map<String, Object> params) {
        this.style = '';
        this.body = '';

        // Double[] dataPoints = new Double[]{0,100,30};
        // Double[] dataPoints = new Double[]{0,100};
        // Double[] dataPoints = new Double[]{30,30};
        // Double[] dataPoints = new Double[]{0,100,30,60,20};
        // /* 10 */ Double[] dataPoints = new Double[]{0,100,30,60,20,0,100,30,60,20};
        // /* 20 */ Double[] dataPoints = new Double[]{90,90,30,60,20,0,100,30};
        // /* 20 */ Double[] dataPoints = new Double[]{90,90,30,60,20,0,100,30,60,20,0,100,100,100,30,60,20,0,100,30,60,20};
        // /* 30 */ Double[] dataPoints = new Double[]{0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20};
        // /* 40 */ Double[] dataPoints = new Double[]{0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20,0,100,30,60,20};
        // /* 50 */ Double[] dataPoints = new Double[]{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,60,24,94,30,83,33,12,61,83,49,88,29,31,32,51,49,71,34,99,83,66,89,0,86,63,97,76,90,87,1,1,7,51,7,36};
        // Double[] dataPoints2 = new Double[]{86,75,28,60,24,94,30,83,33,12,61,83,49,88,29,31,32,51,49,71,34,99,83,66,89,0,86,63,97,76,90,87,1,1,7,51,7,36,23,12,3,46,66,93,8,65,91,43,61,85};
        Double[] dataPoints = new Double[]{86,75,28,60,24,94,30,83,-33,-12,-61,-83,49,88,29,31,32,-51,-49,71,34,99,83,66,89,0,-86,-63,-97,-76,-90,-87,1,1,7,51,7,36,23,12,3,46,66,93,8,65,91,43,61,85};
        // Double[] dataPoints = new Double[]{86,75,28,60,24,94,83,66,89,0,-86,-63,-97,-76,-90,-87};

        // Double[] dataPoints = new Double[]{0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60};
        // Double[] dataPoints = new Double[]{0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80};
        // Double[] dataPoints = new Double[]{0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100,0,100,30,60,20,80,100,0,100,50,100,30,60,20,80,100,0,100};

        this.addDefs(dataPoints);
        
        // this.addChart(dataPoints, true, 'green');
        this.addChart(dataPoints, true, 'red-to-green');
        
        // this.addChart(true);
        // this.addText();
    }

    private void addDefs(Double[] dataPoints) {
        // This is not ideal, but can't figure out easy way to
        // Keep gradient scale correct with lots of data points.
        Decimal dataPointCount = dataPoints.size();
        Integer gradientPct = (Integer)(100-(dataPointCount/2.5));

        if (gradientPct < 10) {
            gradientPct = 10;
        }

        this.body += '<defs>\n';
        // this.body += '  <linearGradient id="fillGradient"  x1="0%" y1="0%" x2="0%" y2="' + gradientPct + '%">\n';
        this.body += '  <linearGradient id="fillGradient"  x1="0%" y1="0%" x2="0%" y2="100%">\n';
        this.body += '      <stop offset="50%" />\n';
        this.body += '      <stop offset="50.01%" />\n';
        this.body += '  </linearGradient>\n';
        this.body += '</defs>\n';
    }

    private void drawBaseline() {
        this.body += '<line x1="1" y1="10" x2="149" y2="10" />\n';
    }

    private void addChart(Double[] dataPoints, Boolean smooth, String chartColor) {
        this.body += '<g class="sparkline" transform="translate(0 0)">>';
        
        addChartPath(dataPoints, smooth, true, chartColor); // Fill
        
        // this.drawBaseline();

        addChartPath(dataPoints, smooth, false, chartColor); // Stroke
        
        // Fade it in
        // this.body += '<animate  dur="0.1s" fill="freeze" attributeName="opacity" from="0" to="1" />';

        this.body += '</g>';
    }

    private void addChartPath(Double[] dataPoints, Boolean smooth, Boolean fillMode, String chartColor) {
        Double minY = -100; 
        Double maxY = 100;
        Double scaleY = maxY - minY;

        Decimal canvasWidth = this.chartSize[0];
        Decimal canvasHeight = this.chartSize[1];

        Decimal chartPadding = 1; // 2px for stroke width
        Decimal chartWidth = canvasWidth - (chartPadding * 2);
        Decimal chartHeight = canvasHeight - (chartPadding * 2);
        
        Decimal minDataPointsToDisplay = 1;

        Decimal dataPointCount = dataPoints.size();
        Decimal dataPointWidth = chartWidth/(Math.max(minDataPointsToDisplay, dataPointCount)-1);

        // MiniChartsLiveLogger.log('dataPointWidth: ' + dataPointWidth);

        Decimal xOverflowWidth = 2;

        if (fillMode) {
            this.body += '<path class="filled ' + chartColor + '" d="\n';
        } else {
            this.body += '<path class="' + chartColor + '" d="\n';
        }
        // this.body += 'M ' + (-xOverflowWidth).setScale(1) + ' ' + canvasHeight + '\n';

        String pathData = '';
        String pathDataStart = '';

        Decimal zeroY = 19;

        for (Integer idx=0; idx<dataPointCount; idx++) {
            Decimal dataPointValue = dataPoints[idx] - minY;
            Decimal pointX = dataPointWidth * (Decimal)idx + chartPadding;
            Decimal pointY = canvasHeight-((dataPointValue/scaleY) * chartHeight) - chartPadding;

            if (idx < dataPointCount-1) {
                // First + Middle Points
                Decimal nextDataPointValue = dataPoints[idx+1] - minY;
                Decimal nextPointX = dataPointWidth * (Decimal)(idx+1) + chartPadding;
                Decimal nextPointY = canvasHeight-((nextDataPointValue/scaleY) * chartHeight) - chartPadding;

                Decimal midPointX = (nextPointX+pointX)/2;
                Decimal midPointY = (nextPointY+pointY)/2;

                Decimal smoothOffsetX = dataPointWidth/25;
                Decimal smoothOffsetY = 0;
                
                smoothOffsetY = (pointY-nextPointY)/10;
                midPointY = (nextPointY+pointY+smoothOffsetY)/2;

                if (idx == 0) {
                    // First Point
                    pathData += 'M ' + chartPadding + ' ' + (pointY + smoothOffsetY).setScale(1) + '\n';
                    pathDataStart += 'M ' + chartPadding + ' ' + zeroY.setScale(1) + '\n';
                    
                    pathData += smooth ? 'S ' :  'L ';
                    pathDataStart += smooth ? 'S ' :  'L ';
                }
                
                if (smooth) {
                    pathData += (pointX-smoothOffsetX).setScale(1) + ' ' + (pointY + smoothOffsetY).setScale(1) + ' ' + (midPointX-smoothOffsetX).setScale(1) + ' ' + midPointY.setScale(1) + ' ';
                    pathDataStart += (pointX-smoothOffsetX).setScale(1) + ' ' + zeroY.setScale(1) + ' ' + (midPointX-smoothOffsetX).setScale(1) + ' ' + zeroY.setScale(1) + ' ';
                } else {
                    pathData += pointX.setScale(1) + ' ' + pointY.setScale(1) + ' ';
                    pathDataStart += pointX.setScale(1) + ' ' + zeroY.setScale(1) + ' ';
                }
            } else {
                // Last Point
                pathData += 'L ' + pointX.setScale(1) + ' ' + pointY.setScale(1) + '\n';
                pathDataStart += 'L ' + pointX.setScale(1) + ' ' + zeroY.setScale(1) + '\n';
                
                if (fillMode) {
                    pathData += 'L ' + pointX.setScale(1) + ' ' + canvasHeight.setScale(1) + '\n';
                    pathDataStart += 'L ' + pointX.setScale(1) + ' ' + canvasHeight.setScale(1) + '\n';

                    pathData += 'L ' + chartPadding + ' ' + canvasHeight + '\n';
                    pathDataStart += 'L ' + chartPadding + ' ' + canvasHeight + '\n';
                }

            }
        }
        
        this.body += pathData;
        this.body += '">';
        // this.body += '<animate  dur="0.1s" fill="freeze" attributeName="d" values="' + pathDataStart + '; ' + pathData + '" />';
        this.body += '</path>';

        //this.body += pathDataStart;
    }

    private void addText() {
        this.body += '<text x="0" y="15" class="medium">&#127464;&#127462; Canada</text>';
    }
}