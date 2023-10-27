public virtual class MiniChartsDesign {
    protected Map<String, Object> params = null;

    protected Integer[] chartSize = null;

    protected String COMPILED_CSS_STYLE = '';
    protected String style = '';
    private String body = '';

    public MiniChartsDesign() {}

    public virtual String render(Map<String, Object> params, Integer[] chartSize) {
        String svgOutput = '';
        
        svgOutput += '<style>' + COMPILED_CSS_STYLE + style + '</style>\n';
        svgOutput += body;
        
        // MiniChartsLiveLogger.log('\n=========================\n  Render Finished: ' + Limits.getCPUTime() + 'ms\n=========================\n');
        return svgOutput;
    }
}