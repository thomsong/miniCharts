public class Land {
    // @IsTest
    // public static void testClassHereNow() {
    //     System.debug('test.test');
    //     // for(Integer i=0; i<2000; i++) {
    //         // String x = 'abc' + 5;
    //     // }
    //     Assert.areEqual(true, false);
    // }

    // @IsTest
    // public static void testClassHereNow2() {
    //     System.debug('Wait long time...');
    //     // for(Integer i=0; i<500000; i++) {
    //     //     String x = 'abc' + 5;
    //     // }
    //     // Assert.areNotEqual(true, false, 'asset msg');
    // }

    public static void run() {
        // long START_TIME = Datetime.now().getTime();

        String chartType = Env.get('chart') + 'Design';

        if (chartType == '') {
            System.debug('Missing Chart Type Argument: npm run land -- chart=name');
            return;
        }
        
        // System.debug('------------------------------------------------');

        String componentStyle = '';
        List<String> stylesAdded = new List<String>();
        
        List<MiniChartsDesign> renderDesigns = new List<MiniChartsDesign>();
        
        // for (Integer i=0; i<3; i++) {
            Type t = Type.forName( chartType);
            if (t == null) {
                System.debug( 'Invalid Chart Class: ' + chartType);    
                return;
            }
            
            MiniChartsDesign design = (MiniChartsDesign)t.newInstance();
            renderDesigns.add(design);
            
            String designName = t.getName();
            if (stylesAdded.contains(designName) == false) {
                componentStyle += design.getStyle();
                stylesAdded.add(designName);
            }
        // }

        Integer canvasWidth = 400;
        Integer height = 40;
        
        String svgCode = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="' + canvasWidth + '" height="' + height + '" viewBox="0 0 ' + canvasWidth + ' ' + height +'">\n'
                + '<style>:root{--w-px:' + canvasWidth + 'px;--h-px:' + height + 'px;}:root{--vw-100:100vw;--max-vw: min(var(--w-px), var(--vw-100));color:#181818;font-size:12px;font-family:-apple-system,"system-ui","Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol"}@-moz-document url-prefix(){:root{--vw-100:50vw}}:root{--white: white}.c{min-width:20px;container-type:inline-size}svg .dot{stroke:red;stroke-width:min(5px,1px + 1.5cqw);vector-effect:non-scaling-stroke;stroke-linecap:round}.tcd,div.tc span,span.tc{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.sz1{--bdy-h: 20px}.sz1 .h-sz1{display:none !important}.sz2{--bdy-h: 40px}.sz2 .h-sz2{display:none !important}.sz3{--bdy-h: 60px}.sz3 .h-sz3{display:none !important}.fx,.fxc,.fxr{display:flex}.fxc{flex-direction:column}.fxr{flex-direction:row}.fg{flex-grow:1}.fwnw{flex-wrap:nowrap}.aife{align-items:flex-end}.jcsb{justify-content:space-between}.jcc{justify-content:center}.vatb{vertical-align:text-bottom}.vatt{vertical-align:text-top}.tac{text-align:center}.tar{text-align:right}.wsnp{white-space:nowrap}.w1,.w1h1{width:100%}.h1,.w1h1{height:100%}.wmvw{width:var(--max-vw)}.bdyh{height:var(--bdy-h)}.hpx{height:var(--h-px)}.fslh75{font-size:.75rem;line-height:.75rem}.b{font-weight:500}.b6{font-weight:600}.debug .c{background:rgba(255,0,0,.2)}\n'
                + componentStyle
                + '\n</style>\n';

        // Loop for each component
        for(MiniChartsDesign renderDesign: renderDesigns) {
            svgCode += '<foreignObject x="0" y="0" class="w1 hpx"><div class="wmvw fxc" xmlns="http://www.w3.org/1999/xhtml"><div style="height:var(--h-px)" class="r fxr fwnw"><div class="c ' + chartType + ' fxc w1h1 fg sz' + (height/20) + '">'
                + renderDesign.render()
                + '</div></div></div></foreignObject>\n';
        }
    
        svgCode += '</svg>';
        
        System.debug(svgCode);

        
        // // List<ApexTypeImplementor> interfaceImpls = [
        // //     SELECT ApexClassId, InterfaceApexClassId, ClassName, InterfaceName, ClassNamespacePrefix, InterfaceNamespacePrefix, DurableId
        // //     FROM ApexTypeImplementor 
        // //     WHERE InterfaceName = 'Callable' and IsConcrete=true];

        // //     system.debug(interfaceImpls);

        // Object result = null;

        // try {
        //     result = c.call('qqqqq', args);
        // } catch (Exception e) {
        //     System.debug(e.getMessage());
        // } finally {
        //     result = null;
        // }

        // if (result == null) {
        //     return;
        // }

        // System.debug('result');
        // System.debug(result);
        // if (result == null) {
        //     System.debug('null');
        // }
        // try {
        //     result = c.call('method', args);
        // } catch (Exception e) {
        //     e.getCause()
        //     This gets executed after the exception is handled
        //     System.debug('xxxClosing the stream writer in the finally block.');
        //     Close the stream writer
            
        // }
        
        // System.debug( result );
        // System.debug( new BarChart() );
        
        // System.debug('x: ' + String.valueOf(MiniChartsBaseChartDesign.renderChartx()));
        // Callable extension = (Callable) Type.forName('BarChart').newInstance();

        // MiniChartsBaseChartDesign m = new MiniChartsBaseChartDesign();
        // System.debug('m: ' + m.addLabelsx());
        // Map<String,String> colors = new Map<String,String>();

        // colors.put('--chart-black', '#181818');
        // colors.put('--chart-gray', '#706e6b');
        // colors.put('--chart-purple', '#9d53f2');
        // colors.put('--chart-green', '#04844b');
        // colors.put('--chart-red', '#aa2422');
        // colors.put('--chart-yellow', '#fcc003');
        // colors.put('--chart-orange', '#f38303');
        // colors.put('--chart-blue', '#3296ed');
        // colors.put('--chart-dark-blue', '#0176D3');
        
        // for(String x : colors.keySet()){
        //     System.debug('Color : '+x + ' / ' + colors.get(x));
        // }

        // System.debug('------------------------------------------------');
        // System.debug('CPU Time: ' + (Datetime.now().getTime() - START_TIME));
    }
}