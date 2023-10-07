public class MiniChartsBarChartDesign extends MiniChartsBaseChartDesign {
    public MiniChartsBarChartDesign() {
        this.COMPILED_CSS_STYLE = 'svg #fillGradient stop:nth-child(1){stop-color:#04844b}svg #fillGradient stop:nth-child(2){stop-color:#aa2422}.BarChart rect{fill:#000;stroke:none}.BarChart rect.purple{fill:#9d53f2}.BarChart rect.blue{fill:#3296ed}.BarChart rect.dark-blue{fill:#0071cd}.BarChart rect.green{fill:#04844b}.BarChart rect.red{fill:#aa2422}.BarChart rect.yellow{fill:#fcc003}.BarChart rect.orange{fill:#f38303}.red-stroke{stroke:#aa2422}svg{--test-color: green}';
    }

    public override virtual String renderChart() {
        Decimal barPadding = dataPointDisplayCount < 2 ? 0 : paddedChartWidth/(dataPointDisplayCount-1) * 0.1;
        Decimal barWidth = (paddedChartWidth/dataPointDisplayCount) - (barPadding*(dataPointDisplayCount-1))/dataPointDisplayCount;

        String svgOutput = '';
        Decimal pointX = chartPaddingX;

        for (Integer idx=0; idx<dataPointCount; idx++) {
            Decimal dataPointValue = Math.max(minDataValue, Math.min(maxDataValue, dataPoints[idx]));
            Decimal dataBasePointValue = dataPointValue - baseDataValue;
            
            String barColor = getValueColor(dataPointValue);

            Boolean isNegValue = dataBasePointValue < 0;
            Decimal barHeight = dataValueRange == 0 ? 0 : Math.abs(dataBasePointValue / dataValueRange * paddedChartHeight);
            Decimal barY = (isNegValue ? barHeight:0) + ( - barHeight + baseDataY);
            
            svgOutput += '<rect class="' + barColor + '" x="' + pointX.setScale(1) + '" y="' + barY.setScale(1) + '" width="' + barWidth.setScale(1) + '" height="' + barHeight.setScale(1) + '" rx="0.25" />';
            
            pointX += barWidth + barPadding;
        }

        return svgOutput;
    }
}