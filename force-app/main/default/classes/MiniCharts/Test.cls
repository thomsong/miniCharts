public class Test {
    public static void testMap() {
        Map<String,String> colors = new Map<String,String>();

        colors.put('--chart-black', '#181818');
        colors.put('--chart-gray', '#706e6b');
        colors.put('--chart-purple', '#9d53f2');
        colors.put('--chart-green', '#04844b');
        colors.put('--chart-red', '#aa2422');
        colors.put('--chart-yellow', '#fcc003');
        colors.put('--chart-orange', '#f38303');
        colors.put('--chart-blue', '#3296ed');
        colors.put('--chart-dark-blue', '#0176D3');

        colors.put('--icon-disabled', '#dad6d0');

        colors.put('--text-black', '#181818');
        colors.put('--text-gray', '#706e6b');
        colors.put('--text-purple', '#9d53f2');
        colors.put('--text-green', '#2e844a');
        colors.put('--text-red', '#ba0517');
        colors.put('--text-yellow', '#fcc003');
        colors.put('--text-orange', '#f38303');
        colors.put('--text-blue', '#0176D3');

        colors.put('--highlight-red', '#ffdcdb');
        colors.put('--highlight-green', '#ddf3d3');
        colors.put('--highlight-yellow', '#fff6b9');
        colors.put('--highlight-orange', '#ffe1c1');
        colors.put('--highlight-blue', '#d4e7ff');
        colors.put('--highlight-purple', '#ecdcff');
        colors.put('--highlight-gray', '#eeeded');

        colors.put('--badge-red', '#c23934');
        colors.put('--badge-green', '#05844b');
        
        List<String> svgVars = new List<String>();
        Set <String> colorSet = new Set<String>();
        colorSet = colors.keySet();
        
        System.debug(colors.keySet());
        // for(String<> : colors.keySet()){
        //     System.debug('City : '+x);
        // }
        //for (String colorName : colors.keySet()) {
        //     svgVars.add(colorName + ': ' + colors.get(colorName));
        //}
        
        // System.debug('svg {\n' + String.join(svgVars, ';\n') + '}\n');

    }
}