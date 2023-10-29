public class Land {
    public static void run() {
        LocalChartHarness h = new LocalChartHarness();
        System.debug(h.renderSVG());
    }
}
        
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