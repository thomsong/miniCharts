public with sharing class MiniChartsRenderer {
    public class RenderException extends Exception {}

    private String GLOBAL_STYLE = '@-moz-document url-prefix(){:root:not(:is(.interactive)){--vw-100:50vw !important}}:root{--vw-100:100vw;--max-vw:min(var(--cw-px),var(--vw-100));--c-bg:#fff;--c-bg-empty-fill:#ddd;--c-txt:#181818;--c-txt-lbl:#5c5c5c;--c-txt-ico:#747474;--c-txt-success:#2e844a;--c-txt-warning:#fe9339;--c-txt-error:#ea001e;--c-t1:#3296ed;--c-t2:#77b9f2;--c-t3:#9d53f2;--c-t4:#c398f5;--c-t5:#26aba4;--c-t6:#4ed4cd;--vgap:clamp(5px,calc(var(--max-vw)*0.05),20px);--hgap:10px;--t:var(--t);color:var(--t);font-size:12px;line-height:1;font-family:-apple-system,system-ui,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"}*,*::before,*::after{box-sizing:border-box;margin:0;padding:0;-webkit-print-color-adjust:exact;print-color-adjust:exact}l{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;max-width:100%;width:max-content}.sz1{--bdy-h:20px}.sz2{--bdy-h:40px}.sz3{--bdy-h:60px}.sz1 .h-sz1,.sz2 .h-sz2,.sz3 .h-sz3{display:none !important}t,.fx,.fxc,.fxr{display:flex}.fxc{flex-direction:column}.fxr{flex-direction:row}.fg{flex-grow:1}.fwnw{flex-wrap:nowrap}t,.jcsb{justify-content:space-between}.vatb{vertical-align:text-bottom}.vatt{vertical-align:text-top}.tac{text-align:center}.tar{text-align:right}.wsnp{white-space:nowrap}.w1,.w1h1{width:100%}.h1,.w1h1{height:100%}b[hpx],.hpx{height:var(--h-px)}.chpx{height:var(--ch-px)}.ctis{container-type:inline-size}.pr{position:relative}.pa,.pal,.pat,.pab{position:absolute}.pal,.pat{left:0}.pat,.patl{top:0}.pab{bottom:0}.jcfs,.tl,.tm,.tr{justify-content:flex-start}.jcc,.ml,.mm,.mr{justify-content:center}.jcfe,.bl,.bm,.br{justify-content:flex-end}t,.aifs,.tl,.ml,.bl{align-items:flex-start}.aic,.tm,.mm,.bm,:is(.tm,.mm,.bm) .b.aa{align-items:center}.aife,.tr,.mr,.br,:is(.tr,.mr,.br) .b.aa{align-items:flex-end}svg>foreignObject{width:var(--max-vw)}svg>foreignObject>div{row-gap:var(--hgap);width:var(--max-vw)}l{margin:0;padding:0;display:inline-block}d{display:block}l[fs0],.fs0{flex-shrink:0}r{display:flex;flex-wrap:nowrap;container-type:inline-size;height:var(--h-px)}c{display:flex;flex-direction:column;overflow:hidden;flex:1 1 0;height:100%;min-width:max(20px,var(--mw,20px))}c:not(:last-of-type){margin-right:var(--gap,var(--vgap))}c.wk{max-width:max-content}c>b{font-weight:400;max-width:100%;container-type:normal;display:block}l{color:var(--c-txt);line-height:1.15}t{max-width:100%}t l{font-size:12px;margin-top:-2px;flex-shrink:1;flex-grow:1}t l:has(cur,pct){flex-shrink:0}t[s=sm] l{font-size:10px}.wk t{max-width:fit-content}cur::before,sup{font-size:.8em;line-height:1.4;vertical-align:text-top;margin-right:-0.1em}cur[d]{--d:attr(d)}cur[n]::before{--n:"-"}cur::before{content:var(--n,"") var(--d,"$")}cur[u]::after{content:attr(u)}pct::after,cur::after,sub{font-size:.7em;vertical-align:baseline}pct::after{content:"%";margin-left:.05em}i{font-style:normal;display:block;width:var(--wh,1em);height:var(--wh,1em);background-color:var(--c,black);-webkit-mask-image:var(--_);mask-image:var(--_);-webkit-mask-repeat:no-repeat;mask-repeat:no-repeat;--cc:center center;-webkit-mask-position:var(--cc);mask-position:var(--cc)}\n ';

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
        component.put('t', 'UserPhotoDesign');
        // component.put('wk', true);
        // component.put('gap', 5);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'BarGraphDesign');
        // component.put('wk', true);
        // component.put('gap', 5);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'LineGraphDesign');
        // component.put('wk', false);
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);

        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 40);
      
        // component = new Map<String, Object>(); 
        // component.put('t', 'TextDesign');
        // component.put('wk', false);
        // // component.put('gap', 5);
        // rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'UserPhotoDesign');
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'BarGraphDesign');
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'LineGraphDesign');
        rowComponents.add(component);
        
        row.put('cmps', rowComponents);
        canvasRows.add(row);


        row = new Map<String, Object>(); 
        rowComponents = new List<Map<String, Object>>();

        row.put('h', 60);
      
        // component = new Map<String, Object>(); 
        // component.put('t', 'IconProgressDesign');
        // component.put('wk', true);
        // rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'UserPhotoDesign');
        // component.put('wk', true);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'LineGraphDesign');
        // component.put('wk', false);
        // rowComponents.add(component);

        
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
        Integer cmpIdx = 0;
        for ( Map<String, Object> canvasRow: canvasRows) {
            Integer rowHeight = (Integer)canvasRow.get('h');
            List<Map<String, Object>> rowComponents = (List<Map<String, Object>>)canvasRow.get('cmps');

            if (rowComponents == null) {
                // Row Space
                svgCharts += '  <d style="height:' + rowHeight + 'px"/>\n';
                continue;
            }

            svgCharts += '  <r style="--c-cnt:' + rowComponents.size() + ';--h:' + rowHeight + ';--h-px:' + rowHeight + 'px">\n';
            for ( Map<String, Object> component: rowComponents) {
                String chartType = (String)component.get('t');

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
                    chartStyle += ' ._' + designIndex + '{' + design.getStyle() + '}\n';
                    
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

                String wkClass = weak ? ' wk ' : ' ';
                String strMaxWidth = maxWidth > 0 ? '--mw:' + maxWidth + 'px;' : '';
                String strComponentGap = componentGap >= 0 ? '--gap:' + componentGap + 'px;' : '';
                String style = '';
                if (strMaxWidth != '' || strComponentGap != '') {
                    style = 'style="' + strMaxWidth + strComponentGap +'" ';
                }
                component.put('__cmpIdx', cmpIdx);
                component.put('__height', rowHeight);
                component.put('__sz', componentSize);
                
                svgCharts += '   <c ' + style + 'class="_' + designIndex + wkClass + alignment + ' sz' + componentSize + '">\n    '
                    + design.render(component)
                + '\n   </c>\n';

                cmpIdx++;
            }
            
            svgCharts += '  </r>\n';
        }

        return '<svg id="_mc" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="' + canvasWidth + '" height="' + canvasHeight + '" viewBox="0 0 ' + canvasWidth + ' ' + canvasHeight +'" style="--cw-px:' + canvasWidth + 'px;--ch-px:' + canvasHeight + 'px">\n'
                // Enable mode/interactive detection
                + '<script>document.getElementById("_mc").classList.add("interactive");</script>\n'

                // All required styles/css icons will be embedded here
                + '<style>/* <![CDATA[ */\n '
                    + GLOBAL_STYLE
                    // + MiniChartsFillPatterns.getPatternVars()
                    // SVG Icons + Patterns based on usage
                    + MiniChartsIcons.getUsedIconSymbols()
                    + chartStyle
                + '/* ]]> */</style>'

                // Component html that was generated earlier
                + '\n<foreignObject class="chpx">\n <div class="wmvw fxc" xmlns="http://www.w3.org/1999/xhtml">\n'
                    + svgCharts
                + ' </div>\n</foreignObject>\n</svg>';
    }
}