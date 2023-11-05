@IsTest
public class IconDesignTest {
    @IsTest
    public static void renderOutputsEqualsRenderTemplate() {
        IconDesign design = new IconDesign();
        
        String a = design.RENDER_TEMPLATE();
        MiniChartsRenderer.resetCmpIdx();
        String b = design.render();
        
        Assert.areEqual(a, b);
    }
}