public with sharing class MiniChartsRenderer {
    public class RenderException extends Exception {}

    private String GLOBAL_STYLE = '@-moz-document url-prefix(){:root{--vw-100: 50vw !important}}:root{--vw-100: 100vw;--max-vw: min(var(--cw-px), var(--vw-100));--c-bg:#fff;--c-bg-empty-fill:#ddd;--c-txt:#181818;--c-txt-lbl:#5c5c5c;--c-txt-ico:#747474;--c-txt-success:#2e844a;--c-txt-warning:#fe9339;--c-txt-error:#ea001e;--c-t1:#3296ed;--c-t2:#77b9f2;--c-t3:#9d53f2;--c-t4:#c398f5;--c-t5:#26aba4;--c-t6:#4ed4cd;--vgap: clamp(5px, calc(var(--max-vw) * 0.05), 20px);--hgap: 10px;color:var(--c, var(--c-txt));font-size:var(--fs, 12px);line-height:1;font-family:-apple-system,system-ui,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"}svg>foreignObject{width:var(--max-vw)}svg>foreignObject>div{width:var(--max-vw)}*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;-webkit-print-color-adjust:exact;print-color-adjust:exact}.tcd,div.tc span,span.tc{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;max-width:100%;width:max-content}.sz1{--bdy-h:20px}.sz2{--bdy-h:40px}.sz3{--bdy-h:60px}.sz1 .h-sz1,.sz2 .h-sz2,.sz3 .h-sz3{display:none !important}.fx,.fxc,.fxr{display:flex}.fxc{flex-direction:column}.fxr{flex-direction:row}.fg{flex-grow:1}.fwnw{flex-wrap:nowrap}.aifs{align-items:flex-start}.aic{align-items:center}.aife{align-items:flex-end}.jcsb{justify-content:space-between}.jcc{justify-content:center}.vatb{vertical-align:text-bottom}.vatt{vertical-align:text-top}.tac{text-align:center}.tar{text-align:right}.wsnp{white-space:nowrap}.w1,.w1h1{width:100%}.h1,.w1h1{height:100%}.hpx{height:var(--h-px)}.chpx{height:var(--ch-px)}.ctis{container-type:inline-size}.pa,.pal,.pat,.pab{position:absolute}.pal,.pat{left:0}.pat,.patl{top:0}.pab{bottom:0}.tl,.tm,.tr{justify-content:flex-start}.ml,.mm,.mr{justify-content:center}.bl,.bm,.br{justify-content:flex-end}.tl,.ml,.bl{align-items:flex-start}.tm,.mm,.bm{align-items:center}.tb,.mb,.br{align-items:flex-end}foreignObject>div.ctn{row-gap:var(--hgap)}:is(.tm,.mm,.bm) .b.aa{align-items:center}:is(.tr,.mr,.br) .b.aa{align-items:flex-end}.r{display:flex;flex-wrap:nowrap;container-type:inline-size;height:var(--h-px)}.c{container-name:c;display:flex;flex-direction:column;overflow:hidden;flex:1 1 0;height:100%;min-width:max(20px,var(--mw, 20px));margin-right:var(--gap, var(--vgap))}.c:last-of-type{margin:0}.c.wk{max-width:max-content}.c>.body,.c>.b{max-width:100%;container-type:normal}.cfill{flex-grow:9999}.lbl{color:#5c5c5c;line-height:1.15}.title{max-width:100%}.title .lbl{margin-top:-2px;flex-shrink:1;flex-grow:1}.title .lbl.pct{flex-shrink:0}.wk .title{width:fit-content}sup{font-size:.8em;line-height:1.4;vertical-align:text-top;margin-right:-0.1em}sub{font-size:.7em;vertical-align:baseline}.pct sub{margin-left:.05em}';

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
        config.put('w', 500);
        config.put('h', 140);//120 + ((3 - 1) * 10)); // 140

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
        component.put('t', 'TextDesign');
        component.put('wk', true);
        // component.put('gap', 5);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', true);
        // component.put('gap', 5);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', false);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', false);
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 40);
      
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', false);
        // component.put('gap', 5);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', true);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);


        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 60);
      
        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', true);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', true);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', false);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'TextDesign');
        component.put('wk', false);
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);
        
        /////////
        row = new Map<String, Object>(); 
        row.put('h', 10);
        // canvasRows.add(row);
        /////////

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 50);
        
        component = new Map<String, Object>(); 
        component.put('t', 'GaugeDesign'); //
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        // canvasRows.add(row);

        /////////
        row = new Map<String, Object>(); 
        row.put('h', 10);
        // canvasRows.add(row);
        /////////

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 60);
        
        component = new Map<String, Object>(); 
        component.put('t', 'GaugeDesign');
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        // canvasRows.add(row);

    

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
                svgCharts += '<div style="height:' + rowHeight + 'px"></div>\n';
                continue;
            }

            svgCharts += '<div style="--c-cnt:' + rowComponents.size() + ';--h:' + rowHeight + ';--h-px:' + rowHeight + 'px" class="r">\n';
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

                Integer designIndex = usedStyles.indexOf(chartType);
                // Add component style if neeeded
                if (designIndex == -1) {
                    designIndex = usedStyles.size();
                    chartStyle += design.getStyle().replace('.' + chartType,'._' + designIndex);
                    
                    usedStyles.add(chartType);
                }

                /////////////////////////
                String alignment = (String)component.get('algn');
                if (alignment == null) {
                    alignment = 'ml';
                    component.put('algn', alignment);
                }

                Integer maxWidth = (Integer)component.get('mw');
                if (maxWidth == null) {
                    maxWidth = 0;
                    component.put('mw', maxWidth);
                }

                Boolean weak = (Boolean)component.get('wk');
                if (weak == null) {
                    weak = false;
                    component.put('wk', weak);
                }

                Integer componentGap = (Integer)component.get('gap');
                if (componentGap == null) {
                    componentGap = -1;
                    component.put('gap', componentGap);
                }

                /////////////////////////
                Integer componentSize = Math.floor(rowHeight/20.0).intValue();

                String weakClass = weak ? ' wk' : '';
                String strMaxWidth = maxWidth > 0 ? '--mw:' + maxWidth + 'px;' : '';
                String strComponentGap = componentGap >= 0 ? '--gap:' + componentGap + 'px;' : '';

                Map<String, Object> designProps = new Map<String, Object>();
                component.put('__height', rowHeight);
                component.put('__sz', componentSize);

                svgCharts += '<div style="' + strMaxWidth + strComponentGap +'" class="_' + designIndex + weakClass + ' c ' + alignment + ' sz' + componentSize + '">'
                    + design.render(component)
                + '</div>\n';
            }
            // svgCharts += '<div style="flex: 500 500 0"></div>';
            svgCharts += '</div>\n';
        }

        return '<svg id="_mc" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="' + canvasWidth + '" height="' + canvasHeight + '" viewBox="0 0 ' + canvasWidth + ' ' + canvasHeight +'" style="--cw-px:' + canvasWidth + 'px;--ch-px:' + canvasHeight + 'px">\n'
                // + '<script>document.getElementById("_mc").classList.add("int");</script>'
                + '<style>/* <![CDATA[ */'
                    + GLOBAL_STYLE
                    + MiniChartsFillPatterns.getPatternVars()
                    + chartStyle
                + '/* ]]> */</style>'

                // SVG Symbol Defs
                + MiniChartsIcons.getUsedIconSymbols()

                // Render Components
                + '<foreignObject class="chpx"><div class="ctn wmvw fxc" xmlns="http://www.w3.org/1999/xhtml">'
                    + svgCharts
                + '</div></foreignObject>\n</svg>';
    }
}