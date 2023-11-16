public with sharing class LineGraphDesign implements MiniChartsDesign {
    @TestVisible
    private String RENDER_TEMPLATE(Map<String, Object> props) {
        ///////////////////////////////////////////////////////
        // Start Building Output - This Should Always Be Last
        // Do not use if / conditionals
        // APEX will use StringBuilder on SFDC when Compressed
        ///////////////////////////////////////////////////////
        
        String output = '';
        // <d class="_graph fg">
            output += '__GRAPH_HTMLX__';
        // </d>
        
        return BaseGraphDesign.render(props, output);
    } /* END RENDER_TEMPLATE */
    
    public String getStyle() {return BaseGraphDesign.getStyle()+'.graph{background:blue}';}
    
    /* COMPRESSED RENDER */
    public String render(Map<String, Object> props) {
        String output = '__GRAPH_HTMLX__';
        return BaseGraphDesign.render(props, output);
    }
}