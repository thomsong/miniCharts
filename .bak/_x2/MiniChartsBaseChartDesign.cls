public virtual class MiniChartsBaseChartDesign extends MiniChartsDesignX {
    protected Double[] dataPoints = null;

    protected Decimal dataPointCount = 0;
    protected Decimal dataPointDisplayCount = 0;
    protected Decimal minDataPointsToDisplay = 1;
    
    protected Double baseDataValue = 0;
    protected Decimal baseDataY = 0;

    protected Double minDataValue = null;
    protected Double maxDataValue = null;
    protected Double dataValueRange = 0;
    
    protected Decimal chartWidth = 0;
    protected Decimal chartHeight = 0;
    protected Decimal chartPaddingX = 0;
    protected Decimal chartPaddingY = 0;
    protected Decimal paddedChartWidth = 0;
    protected Decimal paddedChartHeight = 0;

    List<Map<String, Object>> referenceLines = null;

    public MiniChartsBaseChartDesign() {}

    public override virtual String render(Map<String, Object> params, Integer[] chartSize) {
        Decimal chartMargin = MiniChartsRenderController.chartConfig.margin;

        this.params = params;
        this.chartSize = chartSize;

        initChart();

        this.body += '<g transform="translate(' + chartMargin + ' ' +chartMargin + ')">\n';  
        this.body += renderChart();
        this.body += renderRerenceLines();
        this.body += '</g>\n';

        this.addLabels();
       
        
        return super.render(params, chartSize);
    }

    public virtual String renderChart() { return '';}

    private void addLabels() {
        // M = &#7437;
        // B = &#665;
        // K = &#7435;
        // T = &#7451;

        // this.body += '<text style="font-size:10px" text-anchor="end" x="25" y="1">$79&#7435;</text>';
        // this.body += '<text style="font-size:8px; letter-spacing: -0.75; dominant-baseline: hanging;" text-anchor="end" x="25" y="0">$2.1&#7435;</text>';
        
        // this.body += '<text style="font-size:8px; letter-spacing: -0.75; dominant-baseline: hanging;" text-anchor="start" x="0" y="0">Jan</text>';
        // this.body += '<text style="font-size:8px; letter-spacing: -0.75; dominant-baseline: hanging;" text-anchor="end" x="' + chartWidth + '" y="0">Dec</text>';

        // this.body += '<text style="font-size:9px; letter-spacing: -0.75; dominant-baseline: hanging;" text-anchor="start" x="0" y="' + (chartHeight + 1) + '">Jan</text>';
        // this.body += '<text style="font-size:9px; letter-spacing: -0.75; dominant-baseline: hanging;" text-anchor="end" x="' + chartWidth + '" y="' + (chartHeight + 1) + '">Dec</text>';
        
        
        // this.body += '<text style="font-size:9px; letter-spacing: -0.75; dominant-baseline: hanging;" text-anchor="end" x="27" y="0">792.1&#7435;</text>';
        // this.body += '<text style="font-size:9px; letter-spacing: -0.75; dominant-baseline: text-after-edge;" text-anchor="end" x="27" y="20">7,921</text>';
    }

    private void loadReferenceLines() {
        Map<String, Object> lineProps;

        referenceLines = new List<Map<String, Object>>();

        lineProps = new Map<String, Object>();
        lineProps.put('value', 50);
        lineProps.put('color', 'red');
        lineProps.put('thickness', 1);
        lineProps.put('dash', 0);

        referenceLines.add(lineProps);

        lineProps = new Map<String, Object>();
        lineProps.put('color', 'gray');

        referenceLines.add(lineProps);


    }
    public virtual String renderRerenceLines() { 
        String svgOutput = '';

        for (Map<String, Object> lineProps : referenceLines) {
            Decimal lineValue = (Decimal)lineProps.get('value');
            if (lineValue == null) { lineValue = 0;}

            Decimal lineThickness = (Decimal)lineProps.get('thickness');
            if (lineThickness == null) { lineThickness = 2;}
            lineThickness /= 2;

            Decimal lineDashSize = (Decimal)lineProps.get('dash');
            if (lineDashSize == null) { lineDashSize = 0;}
            lineDashSize *= lineThickness;
            Decimal lineDashSizeAlt = lineDashSize * 1.5;

            Decimal lineOpacity = (Decimal)lineProps.get('opacity');
            if (lineOpacity == null) { lineOpacity = 1;}

            String lineColor = (String)lineProps.get('color');
            if (lineColor == null) { lineColor = 'black';}

            final Decimal halfLineThickness = lineThickness/2;
            Decimal lineY = getChartYFromValue(lineValue);
            if (lineY >= 0 && lineY <= chartHeight) {
                // Bump lines fully into view if on top/bottom edge
                if (lineY < halfLineThickness) {
                    lineY = halfLineThickness;
                } else if (lineY > chartHeight-halfLineThickness) {
                    lineY = chartHeight-halfLineThickness;
                }
                
                svgOutput += '<line style="opacity:' + lineOpacity + '; stroke:var(--chart-' + lineColor + '); stroke-dasharray: ' + lineDashSize.setScale(1) + ' ' + lineDashSizeAlt.setScale(1) + '; stroke-width:' + lineThickness.setScale(1) + ';" x1="' + chartPaddingX + '" y1="' + lineY.setScale(1) + '" x2="' + (chartPaddingX + paddedChartWidth) + '" y2="' + lineY.setScale(1) + '" />\n';
            }
        }

        return svgOutput;
    }

    public void initChart() {
        parseParams();
        processDataPoints();
        calculateChartPositions();
    }

    private void parseParams() {
        dataPoints = new Double[50];

        for (Integer i=0; i<dataPoints.size(); i++) {
            dataPoints[i] = Math.random() * 100;
        }
        // /* 20 */ dataPoints = new Double[]{90,90,30,60,20,0,100,30};
        // /* 20 */ dataPoints = new Double[]{-90,-90,-30,-60,-20,-0,-100,-30};
        // dataPoints = new Double[]{100,100,100,60,24,94,30,83,33,12,61,83,100,88,29,31,32,51,-29,-31,-10,-10,-10,-10,-20,-24,-14,-30,-13,33,12,61,83,100,88,29,31,32,51,49,71,100,100,100,100,60,24,94,30,83,33,12,61,83,-10,-38,-29,-31,-32,51,49,71,100};
        // dataPoints = new Double[]{100,40,100,60,24,94,30,83,33,12,61,83,100,88,29,31,32,51,29,31,10,10,10,10,20,24,14,30,13,33,12,61,83,100,88,29,31,32,51,49,71,100,100,100,100,60,24,94,30,83,33,12,61,83,10,38,29,31,32,51,49,71,100};
        // dataPoints = new Double[]{100,100,100,60,24,94,30,83,33,12,61,83,100,88,29,31,32,51,-49,-71,-100,-100,-100,-100,-60,-24,-94,-30,-83,33,12,61,83,100,88,29,31,32,51};
        // dataPoints = new Double[]{12,100,100,60,24,94,30,83,33,12,61,83,100,88,29,31,32,51,49,71,100,100,100,100,60,24,94,30,83,33,12,61,83,100,88,29,31,32,51};
        // dataPoints = new Double[]{-100,-100};
        // dataPoints = new Double[]{100,-30, 12,100,100,60,24,94,30,83,33,12,61,83,100};
        // dataPoints = new Double[]{.100,-.030, .012,.100,.100,.060,.024,.094,.030,.083,.033,.012,.061,.083,.100};
        
        // minDataPointsToDisplay = 25;
        baseDataValue = 0;
        minDataValue = 0;
        maxDataValue = 100;

        loadReferenceLines();
    }

    private void processDataPoints() {
        dataPointCount = dataPoints.size();

        dataPointDisplayCount = Math.max(minDataPointsToDisplay, dataPointCount);

        // Auto-scale chart based on data values
        if (minDataValue == null) {
            minDataValue = 0;

            for (Integer idx=0; idx<dataPointCount; idx++) {
                minDataValue = Math.min(minDataValue, dataPoints[idx]);
            }            
        }

        // Auto-scale chart based on data values
        if (maxDataValue == null) {
            maxDataValue = 0;
            
            for (Integer idx=0; idx<dataPointCount; idx++) {
                maxDataValue = Math.max(maxDataValue, dataPoints[idx]);
            }            
        }

    
        if (minDataValue == maxDataValue) {
            if (minDataValue < 0) {
                maxDataValue = 0;
            } else {
                minDataValue = 0;
            }
        }

        dataValueRange = maxDataValue - minDataValue;

        if (baseDataValue < minDataValue) {
            baseDataValue = minDataValue;
        } else if (baseDataValue > maxDataValue) {
            baseDataValue = maxDataValue;
        }
    }

    private void calculateChartPositions() {
        Decimal chartMargin = MiniChartsRenderController.chartConfig.margin;

        chartWidth = chartSize[0] - (chartMargin * 2);
        chartHeight = chartSize[1] - (chartMargin * 2);

        chartPaddingX = 0;
        chartPaddingY = 0;
        paddedChartWidth = chartWidth - (chartPaddingX * 2);
        paddedChartHeight = chartHeight - (chartPaddingY * 2);

        baseDataY =  getChartYFromValue(baseDataValue);
        
        // MiniChartsLiveLogger.log('baseDataY: ' + baseDataY);
    }

    public Decimal getChartYFromValue(Decimal value) {
        return dataValueRange == 0 ? 0 : chartHeight - chartPaddingY - ((-minDataValue+value)/dataValueRange * paddedChartHeight);
    }

    public String getValueColor(Decimal value) {
        return 'blue';

        // if (value >= -50 && value <= 50) {
        //     return 'yellow';
        // } else if (value > 50) {
        //     return 'green';
        // } else if (value < -50) {
        //     return 'red';
        // }

        // if (value <= 50) {
        //     return 'red';
        // } else if (value <= 75) {
        //     return 'orange';
        // }

        // return 'green';
    }
    
    private void addText() {
        body += '<text x="0" y="15" class="medium">&#127464;&#127462; Canada</text>';
    }
}