public with sharing class MiniChartsHelper {
    public static String generateLabelText(String value) {
        if (value.endsWith('%')) {
            // Percent 
            Decimal pctValue = Decimal.valueOf(value.substring(0,value.length()-1));
            return '<pct>' + pctValue.setScale(0) +'</pct>';
        } else {
            String firstCharacter = value.substring(0,1);
            if (firstCharacter == '$') {
                // Currency
                Decimal rawCurrencyValue = Decimal.valueOf(value.substring(1).replace(',', ''));
                
                List<String> denoms = new List<String>{'K','M','B','T','Q', 'A', 'B', 'C'};
                Integer denomCount = 0;
                Decimal currencyValue = Math.abs(rawCurrencyValue);
                while (currencyValue >= 1000.0) {
                    currencyValue /= 1000.0;
                    denomCount++;
                }
                
                String unit = '';
                if (denomCount > 0) {
                    String currencyDenomination = denoms[denomCount-1];
                    unit = ' u="'+ currencyDenomination +'"';
                }
        
                String displayValue = '';
                if (rawCurrencyValue == 0) {
                    displayValue = '0';
                } else if (rawCurrencyValue < 1 && rawCurrencyValue > -1) {
                    displayValue = String.valueOf(currencyValue.setScale(2));
                } else {
                    displayValue = String.valueOf(currencyValue.setScale(1));
                    
                    if (displayValue.length() > 4) {
                        displayValue = displayValue.substring(0,4);

                        if (displayValue.endsWith('.')) {
                            displayValue = displayValue.substring(0, displayValue.length()-1);
                        }
                    }
                }
                    
                String currencyClass = '';
                if (rawCurrencyValue < 0) {
                    currencyClass = ' n="1"';
                }

                String dollarSymbol = '';
                if (firstCharacter != '$') {
                    dollarSymbol = ' d="' + firstCharacter + '"';
                }

                return '<cur' + dollarSymbol + unit + currencyClass + '>' + displayValue + '</cur>';
                // return '<cur' + currencyClass + '><sup>' + firstCharacter + '</sup>' + displayValue + sub + '</cur>';
                
            }
        }
    
        // Default
        return value;
    }

    //////////////////////////
    public static Map<String, Object> getProps(Map<String, Object> props,  Map<String, Object> defaults) {
        for (String propName : defaults.keySet()) {
            if (props.get(propName) == null) {
                props.put(propName, defaults.get(propName));
            }
        }

        return props;
    }
}