global with sharing class MiniChartsFormulaController {
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
      if (idValue!= null && typeValue != null) {
        MiniChartsApexFormula.addFormula(idValue, typeValue, value);
      }
    }
  }
}