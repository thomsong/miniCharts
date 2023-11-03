global with sharing class MiniChartsRenderController {
    public static Long START_TIME = 0;
    
    public static Boolean isManaged = MiniChartsRenderController.class.getName().contains('.');
    public static String namespace =  isManaged ?  MiniChartsRenderController.class.getName().split('\\.')[0] : '';
    
    public static Boolean DEBUG = false;
    
    public static MiniChartsStudioChartConfig chartConfig = null;
    
    private String chartPageName = '';
    private String chartMarkup = '';
    
    // private Id templateId = null;
    private Id recordId = null;
    private List<String> params = null;

    public String contIdChosen {get; set;}

    public MiniChartsRenderController() {
        // TAKES 30ms
        // List<Messaging.RenderEmailTemplateBodyResult> resList =
        // Messaging.renderEmailTemplate('001Hs00002vtXNjIAM', null, new List<String>{'abcdef-{!Account.name + 17}'});
        // System.debug(resList);

    }

    // Theme1—Obsolete Salesforce theme
    // Theme2—Salesforce Classic 2005 user interface theme
    // Theme3—Salesforce Classic 2010 user interface theme
    // Theme4d—Modern “Lightning Experience” Salesforce theme
    // Theme4t—Salesforce mobile app theme
    // Theme4u—Lightning Console theme
    // PortalDefault—Salesforce Customer Portal theme that applies to Customer Portals only and not to Experience Builder sites
    // Webstore—AppExchange theme

    // This is the meta data for chart setting
    string testIMGHex() {
        final String b64 = '2cTQ2EzMGVjZyEmNmJTQ2I2N4YjZ2EmNzcDN3EmNkdjZyEjNwcTY2UjN4cjZyQkNhZTO2EmNFZTO2EmNzYDO2EmNxYjM3EmN0cTY2MzNhZjZ1I2NBZzM2gjNhZTM2IzNBZDN3Q0NmNTO2QjNkNjY3kjN0YTQ2Q2NhZjNyQjN1YTQ2IjN1cTY2cjNENTY2AzM2ITO2EkNzcDN2QzNhZDM3Q2MwcTMzYjMGZTM2UzNhZDN3gjNmVTY2QzNBZjR2ImNhZTN2UmNkNjY3MzNBZTN2MzNBZzM3kjNBZjZ2EkNlZDR3YjM0cTY2gjN1YTQ2QkN1YDRzI2N0cDO2EkN1YTQ2QkN1YDZ3YzNhZjMzYUNhZDR2kjNFZTO2MjN4YTM2IzN0czM3YzNzMjZ1YWNCdDO2EmNkdjN3EkN0MjR1I2NhZzN3Q2NiNTM3IzNBZTN2YjN1YjM3EkNycTN2IzNwcTY2YkNBZzQ2kjNBZzM2EkN5cTY2Q2MxcTN3UmNzcTM2EmN2YTN2QkM1cjM3MmNhZTM3IjNmZjM3QjNBZTN2IzNkNTM3AzM2cTNzYWN';
        return EncodingUtil.convertFromHex(EncodingUtil.base64Decode(b64.reverse()).toString().toUpperCase()).toString().replace('&', '&amp;');
    }

    // miniCharts Renderer Code
    public MiniChartsRenderController(ApexPages.StandardController controller) {
        

        MiniChartsRenderController.DEBUG = true;//System.currentPageReference().getParameters().get('dbg') == '1';
        MiniChartsLiveLogger.init();

        // MiniChartsLiveLogger.log('getSessionID 2', UserInfo.getSessionID());

        START_TIME = Datetime.now().getTime();

        // System.debug('isManaged');
        // System.debug(isManaged);
        // System.debug('namespace: ' + namespace);
        // controller.addFields(new List<String>{'name'});

        System.debug('MiniChartsRenderController::Constructor with ApexPages.StandardController');
        // System.debug(controller.getRecord());

        // TODO: document.cookie="debug_logs=debug_logs;domain=.force.com";

        // accountRef = (Account)controller.getRecord();
        
        // MiniChartsLiveLogger.log('testIMGHex', testIMGHex());
        chartConfig = MiniChartsStudioChartConfig.getConfig();
        
        // // System.debug(chartConfig);

        this.addResponseHeaders();
        this.parseParams();
        this.initChart();
    }

    // public MiniChartsRenderController() {
    //     System.debug('MiniChartsRenderController::Constructor');
    //     // TODO: document.cookie="debug_logs=debug_logs;domain=.force.com";

    //     MiniChartsRenderController.DEBUG = System.currentPageReference().getParameters().get('debug') == '1';
        
        // this.addResponseHeaders();
    //     this.parseParams();
    //     this.initChart();
    // }

    private void initChart() {
        // this.setChartDesign('LineChart');
        //this.setChartDesign('BarChart');
        //this.setChartDesign('Ideas');
    }

    // private MiniChartsDesign getChartDesign(String chartDesign) {
    //     // Type chartDesignType = Type.forName('MiniCharts' + chartDesign + 'Design');
    //     // if (chartDesignType == null) {
    //     //     this.setError('Invalid Design: ' + chartDesign);
    //     //     return null;
    //     // }

    //     return (MiniChartsDesign)chartDesignType.newInstance();
    // }

    public String getRenderChartx() {
        return 'CPU: ' + Limits.getCpuTime();
    }

    public String getRenderChart() {
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        return renderer.renderSVG();
        
        // System.debug();
        // Map<String, String> params = ApexPages.currentPage().getParameters();

        // for (String varName : params.keySet()) {
        //     Object value = params.get(varName);
        //     System.debug(varName+':'+value);
        // }

        // System.debug('--------');
        // for (String varName : MiniChartsApexFormula.formulaValues.keySet()) {
        //     Object value = MiniChartsApexFormula.formulaValues.get(varName);
        //     System.debug(varName+':'+value);
        // }
        // System.debug('--------');
        
        // return 'CPU: ' + Limits.getCpuTime();
        // return this.chartMarkup + '\n\n\nCPU: ' + Limits.getCpuTime();//

        // String x = '<!--  miniCharts v0.1 Generated Chart - https://miniCharts.app  -->  <svg xmlns="http://www.w3.org/2000/svg"  width="100%" height="50" viewBox="0 0 1024 50"> svg { --chart-black: #181818; --chart-gray: #706e6b; --chart-purple: #9d53f2; --chart-green: #04844b; --chart-red: #aa2422; --chart-yellow: #fcc003; --chart-orange: #f38303; --chart-blue: #3296ed; --chart-dark-blue: #0176D3; --icon-disabled: #dad6d0; --text-black: #181818; --text-gray: #706e6b; --text-purple: #9d53f2; --text-green: #2e844a; --text-red: #ba0517; --text-yellow: #fcc003; --text-orange: #f38303; --text-blue: #0176D3; --highlight-red: #ffdcdb; --highlight-green: #ddf3d3; --highlight-yellow: #fff6b9; --highlight-orange: #ffe1c1; --highlight-blue: #d4e7ff; --highlight-purple: #ecdcff; --highlight-gray: #eeeded; --badge-red: #c23934; --badge-green: #05844b}  <style> line { stroke:rgb(24, 24, 24); stroke-width: 0.5; } text {stroke:none; fill:rgb(24, 24, 24); font-size:12px; text-rendering: optimizeLegibility; dominant-baseline: hanging; font-family:-apple-system, "system-ui", "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol" } </style> <style>rect.bg-canvas-fill {fill:rgba(255,0,0,0.1) !important;}</style> <style>rect.debug {fill:rgba(255,0,0,0.3) !important;}</style> <rect width="1024" height="50" class="bg-canvas-fill" /> <g class="chart BarChart" transform="translate(-2 -2)"> <style>svg #fillGradient stop:nth-child(1){stop-color:#04844b}svg #fillGradient stop:nth-child(2){stop-color:#aa2422}.BarChart rect{fill:#000;stroke:none}.BarChart rect.purple{fill:#9d53f2}.BarChart rect.blue{fill:#3296ed}.BarChart rect.dark-blue{fill:#0071cd}.BarChart rect.green{fill:#04844b}.BarChart rect.red{fill:#aa2422}.BarChart rect.yellow{fill:#fcc003}.BarChart rect.orange{fill:#f38303}.red-stroke{stroke:#aa2422}svg{--test-color: green}</style> <g transform="translate(2.0 2.0)"> <rect class="blue" x="0.0" y="5.5" width="18.4" height="44.5" rx="0.25" /><rect class="blue" x="20.5" y="4.1" width="18.4" height="45.9" rx="0.25" /><rect class="blue" x="41.0" y="49.2" width="18.4" height="0.8" rx="0.25" /><rect class="blue" x="61.6" y="35.7" width="18.4" height="14.3" rx="0.25" /><rect class="blue" x="82.1" y="10.5" width="18.4" height="39.5" rx="0.25" /><rect class="blue" x="102.6" y="23.8" width="18.4" height="26.2" rx="0.25" /><rect class="blue" x="123.1" y="13.1" width="18.4" height="36.9" rx="0.25" /><rect class="blue" x="143.7" y="13.0" width="18.4" height="37.0" rx="0.25" /><rect class="blue" x="164.2" y="0.3" width="18.4" height="49.7" rx="0.25" /><rect class="blue" x="184.7" y="2.4" width="18.4" height="47.6" rx="0.25" /><rect class="blue" x="205.2" y="0.9" width="18.4" height="49.1" rx="0.25" /><rect class="blue" x="225.7" y="23.0" width="18.4" height="27.0" rx="0.25" /><rect class="blue" x="246.3" y="0.1" width="18.4" height="49.9" rx="0.25" /><rect class="blue" x="266.8" y="36.8" width="18.4" height="13.2" rx="0.25" /><rect class="blue" x="287.3" y="12.1" width="18.4" height="37.9" rx="0.25" /><rect class="blue" x="307.8" y="8.8" width="18.4" height="41.2" rx="0.25" /><rect class="blue" x="328.3" y="15.9" width="18.4" height="34.1" rx="0.25" /><rect class="blue" x="348.9" y="13.0" width="18.4" height="37.0" rx="0.25" /><rect class="blue" x="369.4" y="1.9" width="18.4" height="48.1" rx="0.25" /><rect class="blue" x="389.9" y="4.2" width="18.4" height="45.8" rx="0.25" /><rect class="blue" x="410.4" y="3.3" width="18.4" height="46.7" rx="0.25" /><rect class="blue" x="431.0" y="23.3" width="18.4" height="26.7" rx="0.25" /><rect class="blue" x="451.5" y="17.8" width="18.4" height="32.2" rx="0.25" /><rect class="blue" x="472.0" y="12.8" width="18.4" height="37.2" rx="0.25" /><rect class="blue" x="492.5" y="14.4" width="18.4" height="35.6" rx="0.25" /><rect class="blue" x="513.0" y="44.5" width="18.4" height="5.5" rx="0.25" /><rect class="blue" x="533.6" y="4.8" width="18.4" height="45.2" rx="0.25" /><rect class="blue" x="554.1" y="4.8" width="18.4" height="45.2" rx="0.25" /><rect class="blue" x="574.6" y="33.1" width="18.4" height="16.9" rx="0.25" /><rect class="blue" x="595.1" y="24.6" width="18.4" height="25.4" rx="0.25" /><rect class="blue" x="615.7" y="1.6" width="18.4" height="48.4" rx="0.25" /><rect class="blue" x="636.2" y="37.4" width="18.4" height="12.6" rx="0.25" /><rect class="blue" x="656.7" y="48.9" width="18.4" height="1.1" rx="0.25" /><rect class="blue" x="677.2" y="3.7" width="18.4" height="46.3" rx="0.25" /><rect class="blue" x="697.7" y="39.4" width="18.4" height="10.6" rx="0.25" /><rect class="blue" x="718.3" y="23.5" width="18.4" height="26.5" rx="0.25" /><rect class="blue" x="738.8" y="48.7" width="18.4" height="1.3" rx="0.25" /><rect class="blue" x="759.3" y="44.8" width="18.4" height="5.2" rx="0.25" /><rect class="blue" x="779.8" y="18.5" width="18.4" height="31.5" rx="0.25" /><rect class="blue" x="800.4" y="47.4" width="18.4" height="2.6" rx="0.25" /><rect class="blue" x="820.9" y="35.9" width="18.4" height="14.1" rx="0.25" /><rect class="blue" x="841.4" y="36.1" width="18.4" height="13.9" rx="0.25" /><rect class="blue" x="861.9" y="9.9" width="18.4" height="40.1" rx="0.25" /><rect class="blue" x="882.4" y="8.0" width="18.4" height="42.0" rx="0.25" /><rect class="blue" x="903.0" y="46.5" width="18.4" height="3.5" rx="0.25" /><rect class="blue" x="923.5" y="37.6" width="18.4" height="12.4" rx="0.25" /><rect class="blue" x="944.0" y="28.5" width="18.4" height="21.5" rx="0.25" /><rect class="blue" x="964.5" y="0.9" width="18.4" height="49.1" rx="0.25" /><rect class="blue" x="985.0" y="45.6" width="18.4" height="4.4" rx="0.25" /><rect class="blue" x="1005.6" y="39.1" width="18.4" height="10.9" rx="0.25" /><line style="opacity:1; stroke:var(--chart-red); stroke-dasharray: 0.0 0.0; stroke-width:0.5;" x1="0" y1="25.0" x2="1024.0" y2="25.0" /> <line style="opacity:1; stroke:var(--chart-gray); stroke-dasharray: 0.0 0.0; stroke-width:1.0;" x1="0" y1="49.5" x2="1024.0" y2="49.5" /> </g>  </g>  </svg>';
        

        // START_TIME = Datetime.now().getTime();

        

        // for (Integer i = 0; i < 100; i++) {
        //     x2 = EncodingUtil.base64Encode(Blob.valueof(x + '_' + i));
        // }

        // String output = getChartSVG();
        

        // System.debug('RUN_TIME: ' + runTime + 'ms');
        // return 'RUN_TIME: ' + runTime + 'ms';

        // List<FormulaEvaluator.ContextWrapper> context = new List<FormulaEvaluator.ContextWrapper>();
        // context.add(new FormulaEvaluator.ContextWrapper('$Record', '003Hs00004f536QIAQ'));
        // context.add(new FormulaEvaluator.ContextWrapper('$Record.Account', '001Hs00002vtXNmIAM'));
        // context.add(new FormulaEvaluator.ContextWrapper('itemOne', '30'));
        // context.add(new FormulaEvaluator.ContextWrapper('itemTwo', '45'));
        // String stringContext = JSON.serialize(context);

        // String output = '';//FormulaEvaluator.parseFormula('$User.alias+"Test"', stringContext);
        // output = FormulaEvaluator.parseFormula('$User.Name', stringContext);
        // output = FormulaEvaluator.parseFormula('$User.Name', stringContext);
        // output = FormulaEvaluator.parseFormula('$User.Name', stringContext);

        // Long runTime = Datetime.now().getTime() - START_TIME;

        // return 'CPU: ' + Limits.getCpuTime() + '\nrunTime: ' + runTime + '\n' + output;
        // return output;
    }

    public String getChartSVG() {
        // if (design == null) {
        //     this.setError('MISSING DESIGN');
        // }
        
        Map<String, Object> paramMap = new Map<String, Object>();

        // paramMap.put('recordId', '001Hs00002vtXNe');
        // paramMap.put('name', 'Greg Thomson');
        // paramMap.put('age', 41);
        // paramMap.put('amount', 323232.23);
        // paramMap.put('rendered', true);

        Integer[] canvasSize = new Integer[]{chartConfig.width, chartConfig.height};

        String svgBody = '';

        for(MiniChartsStudioChartConfig.Component component : chartConfig.components) {
            // MiniChartsDesign design = getChartDesign('BarChart');
            // Integer[] chartPosition = component.pos;
            // Integer[] chartSize = component.size;
            
            // svgBody += '<g class="chart BarChart" transform="translate(' + chartPosition[0] + ' ' + chartPosition[1] + ')">\n';  
            // if (MiniChartsRenderController.DEBUG) {
            //     svgBody += '<rect width="' + chartSize[0] + '" height="' + chartSize[1] + '" class="debug" />\n';
            // }
            // svgBody += design.render(paramMap, chartSize) + '\n';
            svgBody += '</g>\n';  
        }

        // String base64 = 'data:image/png;base64,' + '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';
        // svgBody += '<image preserveAspectRatio="xMidYMid slice" href="' + base64 + '" x="10" y="10" width="32" height="32"/>\n';  
        // svgBody += '<image href="https://minicharts-dev-ed.develop.file.force.com/file-asset/minicharts_logo_m_1024"  x="10" y="10" width="32" height="32"/>\n';  
        

        return MiniChartsSVGHelper.composeChartSVG(canvasSize, svgBody);
    }

    private void setError(String msg) {
        // this.design = new MiniChartsErrorDesign(msg);   
    }

    private void addResponseHeaders() {
        ApexPages.currentPage().getHeaders().put('X-Powered-By', 'https://microcharts.app');
        
        // Prevent direct viewing
        // ApexPages.currentPage().getHeaders().put('Refresh', '0;url=denied');
    }
    
    private void parseParams() {
        String q = System.currentPageReference().getParameters().get('q');
        if (q == null) {
            q = '';
        }

        // this.params = q.split('֎', 100);

        // Get Template Id
        // try {
        //     this.templateId = params.get(0);
        // } catch (Exception e) {
        //     this.setError(e.getMessage());
        //     return;
        // }

        // Get Record Id
        // try {
        //     this.recordId = params.get(1);
        // } catch (Exception e) {
        //     this.setError(e.getMessage());
        //     return;
        // }

        // System.debug('templateId: ' + this.templateId);
        // System.debug('recordId: ' + this.recordId);

        // Get rest of params
        // Integer paramsSize = params.size();
        // System.debug(params);
    }
    
    

    public Map<String,Object> getFields() {
        // Account account = (Account)[select id, name from Account limit 1];
        Map<String,Object> field_vars = new Map<String,Object>();

        field_vars.put('$.name', 'Gregory Thomson');
        field_vars.put('$.age', 41);

        return field_vars;
      } 

      public void setAccount(Map<String,Object> x) {
        System.debug('setAccount.setAccount.setAccount');
        // return 'aaa';
      } 

      public String getFin() {
        // Decimal var2 = MiniChartsApexFormula.getNumber('var_abc', 123);
        // String var = MiniChartsApexFormula.getText('var_abc', '');

    
        for (String varName : MiniChartsApexFormula.formulaValues.keySet()) {
            Object value = MiniChartsApexFormula.formulaValues.get(varName);
            System.debug(varName+':'+value);
        }
        
        // return 'Hello';
        // List<ApexPage> pages = [SELECT Id, Markup, Name  FROM ApexPage where Name like 'mc%' WITH SECURITY_ENFORCED limit 10 ];
        
        // return json.serialize(pages) + '\n\n' + 'getCpuTime: ' + Limits.getCpuTime();
        return 'getCpuTime: ' + Limits.getCpuTime();
        
      }

      public String xxx { 
        get; 
        set { 
          System.debug('!!!!!!!' + value);
        }
      }
}

// view-source:https://minicharts-dev-ed--c.develop.vf.force.com/apex/mChart?dbg=0&id=001Hs00002vtXNd&q=005Hs00000DRvA9%D6%8E001Hs00002vtXNd%D6%8ECAD139000000%D6%8E1000%D6%8E1696366854%D6%8EHot&isdtp=p1