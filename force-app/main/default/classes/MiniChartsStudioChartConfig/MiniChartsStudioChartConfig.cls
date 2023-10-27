public with sharing class MiniChartsStudioChartConfig {
    
    public class Formula {
        public String name;
        public String type;
        public String formula;

        public Formula(String name, String type, String formula) {
            this.name = name;           // Name of variable
            this.type = type;           // Text, Number, Currency, Boolean, Date, Date/Time
            this.formula = formula;     // VF template formula
        }
    }

    public class Component {
        public String type;
        public Integer[] pos;
        public Integer[] size;
        public Map<String, String> props;
    }

    public String linkedObjectName;     // SObject name
    public String linkedFieldName;      // Field name

    public String name;                 // Name of Chart
    public Integer width;               // width of SVG canvas
    public Integer height;              // height of SVG canvas
    public Decimal margin;              // Component margins

    public List<Formula> formulas;
    public List<Component> components;

    public static MiniChartsStudioChartConfig getConfig() {
        String namespacePrefix = MiniChartsRenderController.namespace;
        String pageName = ApexPages.currentPage().getUrl().substringAfter('apex/').substringAfter(namespacePrefix + '__').split('\\?')[0];
        
        List<ApexPage> vfPages = [select name, markup, Description from ApexPage where name =: pageName and NamespacePrefix =: namespacePrefix limit 1];

        if (vfPages.size() < 1) {
            // TODO: Handle error
            return null;
        }
        
        String chartName = vfPages[0].name;

        MiniChartsStudioChartConfig chartConfig = (MiniChartsStudioChartConfig)MiniChartsCache.get('chartConfig', chartName);

        if (chartConfig == null) {
            chartConfig = parseMarkup(chartName, vfPages[0].markup);
        }

        return chartConfig;
    }

    public static MiniChartsStudioChartConfig parseMarkup(String chartName, String markup) {
        MiniChartsStudioChartConfig chartConfig;

        String base64Data = '';
        Boolean foundData = false;
        Matcher miniChartsConfigDataMatcher = Pattern.compile('<!--  (.+?)(\\s{2,})-->').matcher(markup);
        while(miniChartsConfigDataMatcher.find()) {
            String data = miniChartsConfigDataMatcher.group(1);

            if (foundData) {
                base64Data += data;
            } else if (data.contains('https://miniCharts.app')) {
                foundData = true;
            }
        }

        String decodedData;
        decodedData = EncodingUtil.base64Decode(base64Data).toString();
        // System.debug(decodedData);

        Matcher miniChartsStudioMatcher = Pattern.compile('@miniChartsStudio\\n((.|\\n)*)\\n-->').matcher(markup);
        if (miniChartsStudioMatcher.find()) {
            String configJson = miniChartsStudioMatcher.group(1);
            chartConfig = (MiniChartsStudioChartConfig)JSON.deserializeStrict(configJson, MiniChartsStudioChartConfig.class);
            chartConfig.formulas = new List<Formula>();
        } else {
            System.debug('ERROR: Missing Config JSON');
            return null;
        }

        Matcher mcLinkedFieldMatcher = Pattern.compile('<apex:variable var="mcLinkedField" value="\\{\\!(.*)\\.(.*)\\}" \\/>').matcher(markup);
        if (mcLinkedFieldMatcher.find()) {
            chartConfig.linkedObjectName = mcLinkedFieldMatcher.group(1);
            chartConfig.linkedFieldName = mcLinkedFieldMatcher.group(2);
        } else {
            System.debug('ERROR: Missing mcLinkedField');
            return null;
        }

        // Get Formulas
        Matcher miniChartsFormulaMatcher = Pattern.compile('<(.*):MiniChartsFormula id="(.*)" type="(.*)" formula="(.*)" \\/>').matcher(markup);
        while (miniChartsFormulaMatcher.find()) {
            String name = miniChartsFormulaMatcher.group(2);
            String type = miniChartsFormulaMatcher.group(3);
            String formula = miniChartsFormulaMatcher.group(4);

            chartConfig.formulas.add((new MiniChartsStudioChartConfig.Formula(name, type, formula)));
        }

        return chartConfig;
    }

    public override String toString() {
        return JSON.serialize(this);
    }
}