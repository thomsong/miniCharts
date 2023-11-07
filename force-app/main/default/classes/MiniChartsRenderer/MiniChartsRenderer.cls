public with sharing class MiniChartsRenderer {
    public class RenderException extends Exception {}

    private String GLOBAL_STYLE = '@-moz-document url-prefix(){:root{--vw-100: 50vw !important}}:root{--vw-100: 100vw;--max-vw: min(var(--cw-px), var(--vw-100));--c-bg: var(--c-bg-drk);--c-bg-empty-fill: #ddd;--c-txt: #181818;--c-txt-lbl: #444444;--c-txt-ico: #747474;--c-txt-success: #2e844a;--c-txt-warning: #fe9339;--c-txt-error: #ea001e;--c-t1: #3296ed;--c-t2: #77b9f2;--c-t3: #9d53f2;--c-t4: #c398f5;--c-t5: #26aba4;--c-t6: #4ed4cd;color:var(--c-txt);font-size:13px;line-height:1.3;font-family:-apple-system,"system-ui","Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"}b{font-weight:600}.tcd{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}div.tc span{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}span.tc{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.sz1{--bdy-h: 20px}.sz1 .h-sz1{display:none !important}.sz2{--bdy-h: 40px}.sz2 .h-sz2{display:none !important}.sz3{--bdy-h: 60px}.sz3 .h-sz3{display:none !important}.fx{display:flex}.fxc{display:flex;flex-direction:column}.fxr{display:flex;flex-direction:row}.fg{flex-grow:1}.fwnw{flex-wrap:nowrap}.aife{align-items:flex-end}.jcsb{justify-content:space-between}.jcc{justify-content:center}.vatb{vertical-align:text-bottom}.vatt{vertical-align:text-top}.tac{text-align:center}.tar{text-align:right}.wsnp{white-space:nowrap}.w1{width:100%}.w1h1{width:100%;height:100%}.h1{height:100%}.wmvw{width:var(--max-vw)}.bdyh{height:var(--bdy-h)}.hpx{height:var(--h-px)}.chpx{height:var(--ch-px)}.fslh75{font-size:.75rem;line-height:.75rem}.b{font-weight:500}.b6{font-weight:600}.tl{justify-content:flex-start;align-items:flex-start}.tm{justify-content:flex-start;align-items:center}.tr{justify-content:flex-start;align-items:flex-end}.ml{justify-content:center;align-items:flex-start}.mm{justify-content:center;align-items:center}.mr{justify-content:center;align-items:flex-end}.bl{justify-content:flex-end;align-items:flex-start}.bm{justify-content:flex-end;align-items:center}.br{justify-content:flex-end;align-items:flex-end}.r{container-type:inline-size;height:var(--h-px);background:var(--c-bg)}.c{flex-grow:1;height:100%;min-width:20px;display:flex;flex-direction:column;margin-right:5px}.c:last-of-type{margin-right:0}.c .body{max-width:100%}.cfill{flex-grow:9999}';

    public static Integer cmpIdx = 0;
    public static Integer getCmpIdx() {
        MiniChartsRenderer.cmpIdx++;
        return MiniChartsRenderer.cmpIdx;
    }

    public static void resetCmpIdx() {
        MiniChartsRenderer.cmpIdx = 0;
    }
    
    private Map<String, Object> getConfig() {
        Map<String, Object> config = new Map<String, Object>();
        config.put('w', 400);
        config.put('h', 140);

        List<Map<String, Object>> canvasRows = new List<Map<String, Object>>();
        
        Map<String, Object> row;
        List<Map<String, Object>> rowComponents;
        Map<String, Object> component;

        // TextDesign
        // component = new Map<String, Object>(); 
        // component.put('t', 'TextDesign');
        // component.put('algn', 'ml');
        // rowComponents.add(component);

        // TextDesign
        // component = new Map<String, Object>(); 
        // component.put('t', 'TextDesign');
        // component.put('algn', 'mr');
        // rowComponents.add(component);

        // ProgressBarDesign
        // component = new Map<String, Object>(); 
        // component.put('t', 'ProgressBarDesign');
        // rowComponents.add(component);

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 20);
        
        component = new Map<String, Object>(); 
        component.put('t', 'GaugeDesign');
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);

        
        /////////
        row = new Map<String, Object>(); 
        row.put('h', 10);
        canvasRows.add(row);
        /////////

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 40);
        
        component = new Map<String, Object>(); 
        component.put('t', 'GaugeDesign'); //
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /////////
        row = new Map<String, Object>(); 
        row.put('h', 10);
        canvasRows.add(row);
        /////////

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 60);
        
        component = new Map<String, Object>(); 
        component.put('t', 'GaugeDesign');
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);

    

        // throw new MiniChartsRenderer.RenderException('Icon dddd 2222');

        /* **************** */
        config.put('rows', canvasRows);

        return config;
    }

    public String renderSVG() {
        Map<String, Object> chartConfig;
        chartConfig = this.getConfig();
        
        // try {
        //     chartConfig = this.getConfig();
        // } catch (MiniChartsRenderer.RenderException e) {
        //     system.debug('caught 1');
        // } catch (Exception e) {
        //     system.debug('caught 2');
        // } finally {
        //     system.debug('finally 2');
        // }
        

        Integer canvasWidth = (Integer)chartConfig.get('w');
        Integer canvasHeight =(Integer)chartConfig.get('h');

        List<String> usedStyles = new List<String>();
        List<Map<String, Object>> canvasRows = (List<Map<String, Object>>)chartConfig.get('rows');

        String svgCharts = '';
        String chartStyle = '';
        for ( Map<String, Object> canvasRow: canvasRows) {
            Integer rowHeight = (Integer)canvasRow.get('h');
            List<Map<String, Object>> rowComponents = (List<Map<String, Object>>)canvasRow.get('cmps');

            if (rowComponents == null) {
                // Row Space
                svgCharts += '<div style="height:' + rowHeight + 'px;" class="r space"></div>\n';
                continue;
            }

            svgCharts += '<div style="--h-px:' + rowHeight + 'px;" class="r fxr fwnw">\n';
            for ( Map<String, Object> component: rowComponents) {
                String chartType = (String)component.get('t');

                if (chartType == 'SpaceFiller') {
                    svgCharts += '\n<div class="cfill"></div>\n';
                    continue;
                }

                Type t = Type.forName( chartType);
                if (t == null) {
                    System.debug('Invalid Chart Class: ' + chartType);    
                    return '';
                }

                MiniChartsDesign design = (MiniChartsDesign)t.newInstance();

                // Add component style if neeeded
                if (usedStyles.contains(chartType) == false) {
                    chartStyle += design.getStyle();
                    usedStyles.add(chartType);
                }

                String alignment = (String)component.get('algn');
                if (alignment == null) {
                    alignment = 'ml';
                }
                
                svgCharts += '<div class="' + chartType + ' c ' + alignment + ' sz' + (rowHeight/20) + '">'
                    + design.render()
                + '</div>\n';
            }

            svgCharts += '</div>\n';
        }

        return '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="' + canvasWidth + '" height="' + canvasHeight + '" viewBox="0 0 ' + canvasWidth + ' ' + canvasHeight +'" style="--cw-px:' + canvasWidth + 'px;--ch-px:' + canvasHeight + 'px;">\n'
                + '<style>/* <![CDATA[ */'
                    + GLOBAL_STYLE
                    + MiniChartsFillPatterns.getPatternVars()
                    + chartStyle
                + '/* ]]> */</style>'

                

                // SVG Symbol Defs
                + MiniChartsIcons.getUsedIconSymbols()

                // Render Components
                + '<foreignObject x="0" y="0" class="w1 chpx"><div class="ctn wmvw fxc" xmlns="http://www.w3.org/1999/xhtml">'
                    + svgCharts
                + '</div></foreignObject>\n</svg>';
    }
}