public with sharing class MiniChartsApexFormula {
    public static Map<String,String> formulaValues = new Map<String,String>();
    
    // Formula Data Types
    // Text
    // Number
    // Currency
    // Boolean
    // Date
    // Date/Time

    public static void addFormula(String name, String type, String value) {
        formulaValues.put(name, value);
    }

    // Default Get
    public static Object get(String name) {
        return get(name, null);
    }

    public static Object get(String name, Object defaultValue) {
        Object calculatedValue = formulaValues.get(name);

        if (calculatedValue == null && defaultValue != null) {
            return defaultValue;
        }

        return calculatedValue;
    }

     // Text Get
     public static String getText(String name) {
        return getText(name);
    }

    public static String getText(String name, String defaultValue) {
        return (String)get(name, defaultValue);
    }

    // Number Get
    public static Decimal getNumber(String name) {
        return getNumber(name, null);
    }

    public static Decimal getNumber(String name, Decimal defaultValue) {
        return Decimal.valueOf((String)get(name, defaultValue));
    }

}