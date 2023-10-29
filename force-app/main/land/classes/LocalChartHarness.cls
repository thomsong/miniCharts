public class LocalChartHarness {
    // String chartType = Env.get('chart') + 'Design';

    // if (chartType == '') {
    //     System.debug('Missing Chart Type Argument: npm run land -- chart=name');
    //     return '';
    // }

    private  Map<String, Object> getConfig() {
        Map<String, Object> config = new Map<String, Object>();
        config.put('w', 400);
        config.put('h', 50);

        List<Map<String, Object>> canvasRows = new List<Map<String, Object>>();
        
        Map<String, Object> row;
        List<Map<String, Object>> rowComponents;
        Map<String, Object> component;

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

        // ProgressBarDesign
        component = new Map<String, Object>(); 
        component.put('t', 'ProgressBarDesign');
        rowComponents.add(component);

        row.put('cmps', rowComponents);
        canvasRows.add(row);

        /* **************** */
        // Spacer
        /* **************** */
        row = new Map<String, Object>(); 
        row.put('h', 10);
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
        
        Integer canvasWidth = (Integer)chartConfig.get('w');
        Integer canvasHeight =(Integer)chartConfig.get('h');

        String svgIconStyle = '';

        String themeVars = '--theme-1:#3296ED;'
                         + '--theme-2:#77B9F2;'
                         + '--theme-3:#9D53F2;'
                         + '--theme-4:#C398F5;'
                         + '--theme-5:#26ABA4;'
                         + '--theme-6:#4ED4CD;'
                         + '--white:white;\n';

        svgIconStyle += '--svg-battery-rounded:url("data:image/svg+xml,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2217%22%20height%3D%2216%22%20viewBox%3D%220%200%2017%2016%22%3E%0A%3Crect%20x%3D%2210%22%20y%3D%227.1%22%20fill%3D%22none%22%20width%3D%222%22%20height%3D%221.6%22%2F%3E%0A%3Cpath%20d%3D%22M8.9%2C3H5.1C4.5%2C3%2C4%2C3.5%2C4%2C4.1v7.8C4%2C12.5%2C4.5%2C13%2C5.1%2C13h3.8c0.6%2C0%2C1.1-0.5%2C1.1-1.1V4.1C10%2C3.5%2C9.5%2C3%2C8.9%2C3z%22%2F%3E%0A%3Cpath%20d%3D%22M0%2C1.2v13.7C0%2C15.5%2C0.5%2C16%2C1.2%2C16h11.7c0.6%2C0%2C1.2-0.5%2C1.2-1.2v-3.3h2.2c0.5%2C0%2C0.8-0.4%2C0.8-0.8V5.3c0-0.5-0.4-0.8-0.8-0.8%0A%09l-2.2%2C0V2.1V1.2C14%2C0.5%2C13.5%2C0%2C12.8%2C0H1.2C0.5%2C0%2C0%2C0.5%2C0%2C1.2z%20M12%2C2v12H2V2H12z%22%2F%3E%0A%3C%2Fsvg%3E%0A");\n';
        
        String svgCode = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="' + canvasWidth + '" height="' + canvasHeight + '" viewBox="0 0 ' + canvasWidth + ' ' + canvasHeight +'">\n'
                + '<style>:root{--cw-px:' + canvasWidth + 'px;--ch-px:' + canvasHeight + 'px;--vw-100:100vw;--max-vw:min(var(--cw-px), var(--vw-100));color:#181818;font-size:12px;font-family:-apple-system,"system-ui","Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"}@-moz-document url-prefix(){:root{--vw-100:50vw}}'
                
                // Salesforce Font
                // + '@font-face { font-family: "Salesforce Sans"; font-weight: bold; font-style: normal; font-display: swap; src:url("data:font/woff2;charset=utf-8;base64,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") format("woff2");}'
                // + '@font-face { font-family: "Salesforce Sans"; font-weight: normal; font-style: normal; font-display: swap; src:url("data:font/woff2;charset=utf-8;base64,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") format("woff2");}'
                
                // Shared Helpers
                + '.tcd,div.tc span,span.tc{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.sz1{--bdy-h: 20px}.sz1 .h-sz1{display:none !important}.sz2{--bdy-h: 40px}.sz2 .h-sz2{display:none !important}.sz3{--bdy-h: 60px}.sz3 .h-sz3{display:none !important}.fx,.fxc,.fxr{display:flex}.fxc{flex-direction:column}.fxr{flex-direction:row}.fg{flex-grow:1}.fwnw{flex-wrap:nowrap}.aife{align-items:flex-end}.jcsb{justify-content:space-between}.jcc{justify-content:center}.vatb{vertical-align:text-bottom}.vatt{vertical-align:text-top}.tac{text-align:center}.tar{text-align:right}.wsnp{white-space:nowrap}.w1,.w1h1{width:100%}.h1,.w1h1{height:100%}.wmvw{width:var(--max-vw)}.bdyh{height:var(--bdy-h)}.hpx{height:var(--h-px)}.chpx{height:var(--ch-px)}.fslh75{font-size:.75rem;line-height:.75rem}.b{font-weight:500}.b6{font-weight:600}'

                // Shared Component Styles
                + '.c{min-width:20px;container-type:inline-size}.r{height:var(--h-px);gap:5px;}'

                // Theme + Icons
                + '\n:root{\n'
                + themeVars
                + svgIconStyle
                + '}</style>\n'

                + '<foreignObject x="0" y="0" class="w1 chpx"><div class="wmvw fxc" style="gap:0px;" xmlns="http://www.w3.org/1999/xhtml">';
        
        List<String> usedStyles = new List<String>();

        List<Map<String, Object>> canvasRows = (List<Map<String, Object>>)chartConfig.get('rows');
        for ( Map<String, Object> canvasRow: canvasRows) {
            Integer rowHeight = (Integer)canvasRow.get('h');
            List<Map<String, Object>> rowComponents = (List<Map<String, Object>>)canvasRow.get('cmps');

            if (rowComponents == null) {
                // RowSpaceDesign
                Map<String, Object> spaceComponent = new Map<String, Object>();
                spaceComponent.put('t', 'RowSpaceDesign');
                rowComponents = new List<Map<String, Object>>{ spaceComponent };
            }

            svgCode += '<div style="--h-px:' + rowHeight + 'px;" class="r fxr fwnw">';
            for ( Map<String, Object> component: rowComponents) {
                String chartType = (String)component.get('t');

                if (chartType == 'RowSpaceDesign') {
                    svgCode += '<div class="RowSpaceDesign c fxc w1h1 fg"></div>';
                    continue;
                }

                Type t = Type.forName( chartType);
                if (t == null) {
                    System.debug( 'Invalid Chart Class: ' + chartType);    
                    return '';
                }

                MiniChartsDesign design = (MiniChartsDesign)t.newInstance();

                if (usedStyles.contains(chartType) == false) {
                    svgCode += '<style>' + design.getStyle()+ '</style>';
                    usedStyles.add(chartType);
                }

                svgCode += '<div class="' + chartType + ' c fxc w1h1 fg sz' + (rowHeight/20) + '">'
                + design.render()
                + '</div>';
            }

            svgCode += '</div>';
        }

        return svgCode + '</div></foreignObject>\n</svg>';
    }
}