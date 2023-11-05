@IsTest
public class MiniChartsDesignTest {
    @IsTest
    public static void svgTagsAreValid() {
        MiniChartsRenderer renderer = new MiniChartsRenderer();
        String svgCode = renderer.renderSVG();
        
        Assert.isTrue( svgCode.startsWith('<svg') );
        Assert.isTrue( svgCode.endsWith('</svg>') );
    }
}