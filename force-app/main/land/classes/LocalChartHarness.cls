public class LocalChartHarness {
    // String chartType = Env.get('chart') + 'Design';

    // if (chartType == '') {
    //     System.debug('Missing Chart Type Argument: npm run land -- chart=name');
    //     return '';
    // }

    private Map<String, Object> getConfig() {
        Map<String, Object> config = new Map<String, Object>();
        config.put('w', 400);
        config.put('h', 160);

        List<Map<String, Object>> canvasRows = new List<Map<String, Object>>();
        
        Map<String, Object> row;
        List<Map<String, Object>> rowComponents;
        Map<String, Object> component;

        /* **************** */
        // Row 1.Title
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 20);
        
        // TextDesign
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('algn', 'ml');
        rowComponents.add(component);

        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        // Space Filler
        component = new Map<String, Object>(); 
        component.put('t', 'SpaceFiller');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        

        /* **************** */
        // Row 1
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 20);
        
        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /* **************** */
        // Row 2.Title
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 40);
        
        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);
        
        // TextDesign
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('algn', 'ml');
        rowComponents.add(component);

        // TextDesign
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('algn', 'mr');
        rowComponents.add(component);

        // IconDesign
        component = new Map<String, Object>(); 
        component.put('t', 'IconDesign');
        // component.put('algn', 'ml');
        rowComponents.add(component);

        // TextDesign
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('algn', 'ml');
        rowComponents.add(component);

        // TextDesign
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('algn', 'mr');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /* **************** */
        // Row 2
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 20);
        
        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /* **************** */
        // Row Spacer
        /* **************** */
        // row = new Map<String, Object>(); 
        // row.put('h', 10);
        // canvasRows.add(row);

        /* **************** */
        // Row 3
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 20);
        
        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /* **************** */
        // Row 4
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 40);
        
        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /* **************** */
        // Row 5
        /* **************** */
        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 60);
        
        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);


        /* **************** */
        config.put('rows', canvasRows);

        return config;
    }

    public String renderSVG() {
        Map<String, Object> chartConfig = this.getConfig();
        
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        return renderer.renderSVG();
        // return '';
    }
}