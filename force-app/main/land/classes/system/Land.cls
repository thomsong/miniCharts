public class Land {
  public static void run() {
    try {
      LocalChartHarness.renderSVG();
    } catch (Exception e) {
      System.debug(LoggingLevel.ERROR, '\n' + e.getMessage());
    }
  }
}