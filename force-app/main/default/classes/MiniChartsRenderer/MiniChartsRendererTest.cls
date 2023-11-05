@IsTest
public class MiniChartsRendererTest {
    @IsTest
    public static void svgTagsAreValid() {
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        
        String svgCode = '';
        svgCode = renderer.renderSVG();
        
        Assert.isTrue( svgCode.startsWith('<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin slice" width="400" height="160" viewBox="0 0 400 160" style="--cw-px:400px;--ch-px:160px;">') );
        Assert.isTrue( svgCode.endsWith('</svg>') );
    }
}