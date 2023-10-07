public class MiniChartsFormulaController {
  public String idValue { 
    get; 
    set;
  }

  public String typeValue { 
    get; 
    set;
  }

  public String formulaValue { 
    get; 
    set { 
      if (idValue!= null && typeValue != null && formulaValue != null) {
        MiniChartsApexFormula.addFormula(idValue, typeValue, value);
      }
    }
  }
}