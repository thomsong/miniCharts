public virtual class MiniChartsDesignX {
    protected Map<String, Object> params = null;

    protected Integer[] chartSize = null;

    protected String COMPILED_CSS_STYLE = '';
    protected String style = '';
    protected String body = '';


    public virtual String render(Map<String, Object> params, Integer[] chartSize) {
        String svgOutput = '';
        
        svgOutput += '<style>' + COMPILED_CSS_STYLE + style + '</style>\n';
        svgOutput += body;
        
        // MiniChartsLiveLogger.log('\n=========================\n  Render Finished: ' + Limits.getCPUTime() + 'ms\n=========================\n');
        return svgOutput;
    }
}