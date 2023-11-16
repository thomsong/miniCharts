public with sharing class MiniChartsRenderer {
    public class RenderException extends Exception {}

    private String GLOBAL_STYLE = '@-moz-document url-prefix() {\n  :root:not(:is(.interactive)) {\n    --vw-100: 50vw !important;\n  }\n}\n:root {\n  --vw-100: 100vw;\n  --max-vw: min(var(--cw-px), var(--vw-100));\n  --c-bg:#fff;\n  --c-bg-empty-fill:#ddd;\n  --c-txt:#181818;\n  --c-txt-lbl:#5c5c5c;\n  --c-txt-ico:#747474;\n  --c-txt-success:#2e844a;\n  --c-txt-warning:#fe9339;\n  --c-txt-error:#ea001e;\n  --c-t1:#3296ed;\n  --c-t2:#77b9f2;\n  --c-t3:#9d53f2;\n  --c-t4:#c398f5;\n  --c-t5:#26aba4;\n  --c-t6:#4ed4cd;\n  --vgap: clamp(5px, calc(var(--max-vw) * 0.05), 20px);\n  --hgap: 10px;\n  --t: var(--t);\n  color: var(--t);\n  font-size: 12px;\n  line-height: 1;\n  font-family: -apple-system, system-ui, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";\n}\n\n*,\n*::before,\n*::after {\n  box-sizing: border-box;\n  margin: 0;\n  padding: 0;\n  -webkit-print-color-adjust: exact;\n  print-color-adjust: exact;\n}\n\nl {\n  overflow: hidden;\n  text-overflow: ellipsis;\n  white-space: nowrap;\n  max-width: 100%;\n  width: max-content;\n}\n\n.sz1 {\n  --bdy-h: 20px;\n}\n\n.sz2 {\n  --bdy-h: 40px;\n}\n\n.sz3 {\n  --bdy-h: 60px;\n}\n\n.sz1 .h-sz1,\n.sz2 .h-sz2,\n.sz3 .h-sz3 {\n  display: none !important;\n}\n\nt,\n.fx,\n.fxc,\n.fxr {\n  display: flex;\n}\n\n.fxc {\n  flex-direction: column;\n}\n\n.fxr {\n  flex-direction: row;\n}\n\n.fg {\n  flex-grow: 1;\n}\n\n.fwnw {\n  flex-wrap: nowrap;\n}\n\nt,\n.jcsb {\n  justify-content: space-between;\n}\n\n.vatb {\n  vertical-align: text-bottom;\n}\n\n.vatt {\n  vertical-align: text-top;\n}\n\n.tac {\n  text-align: center;\n}\n\n.tar {\n  text-align: right;\n}\n\n.wsnp {\n  white-space: nowrap;\n}\n\n.w1,\n.w1h1 {\n  width: 100%;\n}\n\n.h1,\n.w1h1 {\n  height: 100%;\n}\n\nb[hpx],\n.hpx {\n  height: var(--h-px);\n}\n\n.chpx {\n  height: var(--ch-px);\n}\n\n.ctis {\n  container-type: inline-size;\n}\n\n.pr {\n  position: relative;\n}\n\n.pa,\n.pal,\n.pat,\n.pab {\n  position: absolute;\n}\n\n.pal,\n.pat {\n  left: 0;\n}\n\n.pat,\n.patl {\n  top: 0;\n}\n\n.pab {\n  bottom: 0;\n}\n\n.jcfs,\n.tl,\n.tm,\n.tr {\n  justify-content: flex-start;\n}\n\n.jcc,\n.ml,\n.mm,\n.mr {\n  justify-content: center;\n}\n\n.jcfe,\n.bl,\n.bm,\n.br {\n  justify-content: flex-end;\n}\n\nt,\n.aifs,\n.tl,\n.ml,\n.bl {\n  align-items: flex-start;\n}\n\n.aic,\n.tm,\n.mm,\n.bm,\n:is(.tm, .mm, .bm) .b.aa {\n  align-items: center;\n}\n\n.aife,\n.tr,\n.mr,\n.br,\n:is(.tr, .mr, .br) .b.aa {\n  align-items: flex-end;\n}\n\nsvg > foreignObject {\n  width: var(--max-vw);\n}\nsvg > foreignObject > div {\n  row-gap: var(--hgap);\n  width: var(--max-vw);\n}\n\nl {\n  margin: 0;\n  padding: 0;\n  display: inline-block;\n}\n\nd {\n  display: block;\n}\n\nl[fs0],\n.fs0 {\n  flex-shrink: 0;\n}\n\nr {\n  display: flex;\n  flex-wrap: nowrap;\n  container-type: inline-size;\n  height: var(--h-px);\n}\n\nc {\n  display: flex;\n  flex-direction: column;\n  overflow: hidden;\n  flex: 1 1 0;\n  height: 100%;\n  min-width: max(20px, var(--mw, 20px));\n}\nc:not(:last-of-type) {\n  margin-right: var(--gap, var(--vgap));\n}\nc.wk {\n  max-width: max-content;\n}\nc > b {\n  font-weight: 400;\n  max-width: 100%;\n  container-type: normal;\n  display: block;\n}\n\nl {\n  color: #5c5c5c;\n  line-height: 1.15;\n}\n\nt {\n  max-width: 100%;\n}\nt l {\n  margin-top: -2px;\n  flex-shrink: 1;\n  flex-grow: 1;\n}\nt lpct {\n  flex-shrink: 0;\n}\n\n.wk t {\n  max-width: fit-content;\n}\n\ncur::before,\nsup {\n  font-size: 0.8em;\n  line-height: 1.4;\n  vertical-align: text-top;\n  margin-right: -0.1em;\n}\n\ncur[d] {\n  --d: attr(d);\n}\ncur[n]::before {\n  --n: "-";\n}\ncur::before {\n  content: var(--n, "") var(--d, "$");\n}\ncur[u]::after {\n  content: attr(u);\n}\n\npct::after,\ncur::after,\nsub {\n  font-size: 0.7em;\n  vertical-align: baseline;\n}\n\npct::after {\n  content: "%";\n  margin-left: 0.05em;\n}\n\ni {\n  font-style: normal;\n  display: block;\n  width: var(--wh, 1em);\n  height: var(--wh, 1em);\n  background-color: var(--c, black);\n  -webkit-mask-image: var(--_);\n  mask-image: var(--_);\n  -webkit-mask-repeat: no-repeat;\n  mask-repeat: no-repeat;\n  --cc: center center;\n  -webkit-mask-position: var(--cc);\n  mask-position: var(--cc);\n}\n ';

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
        component.put('t', 'LineGraphDesign');
        // component.put('wk', true);
        // component.put('gap', 5);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'LineGraphDesign');
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
        component.put('t', 'LineGraphDesign');
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'LineGraphDesign');
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
        component.put('t', 'LineGraphDesign');
        // component.put('wk', true);
        rowComponents.add(component);

        component = new Map<String, Object>(); 
        component.put('t', 'LineGraphDesign');
        // component.put('wk', false);
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