@IsTest
public class MiniChartsRendererTest {
    class applicationException extends Exception {}

    public static void svgTagsAreValid() {
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        String svgCode = renderer.renderSVG();
        
        // System.debug(svgCode);
        // Assert.isTrue( svgCode.startsWith('<sxvg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="400" height="160" viewBox="0 0 400 160" style="--cw-px:400px;--ch-px:160px;">') );
        // Assert.isTrue( svgCode.endsWith('</svg>') );

        // try {
            MiniChartsRendererTest.x();
        // } catch (Exception e) {
            // System.debug(e.getMessage());
        // } finally {}
        
        System.debug('DONE');
    }

    public static string x() {
        throw new applicationException('Your Message');
        // return 'x';
    }
}