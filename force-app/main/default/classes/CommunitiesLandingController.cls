

public class CommunitiesLandingController implements Callable {
    public virtual class BaseException extends Exception {}

    // Actual method
    String concatStrings(String stringValue) {
      return stringValue + stringValue;
    }
 
    // Actual method
    Decimal multiplyNumbers(Decimal decimalValue) {
      return decimalValue * decimalValue;
    }
 
    // Dispatch actual methods
    public Object call(String action, Map<String, Object> args) {
      // switch on action {
      //   when 'concatStrings' {
      //     return this.concatStrings((String)args.get('stringValue'));
      //   }
      //   when 'multiplyNumbers' {
      //     return this.multiplyNumbers((Decimal)args.get('decimalValue'));
      //   }
      // }

      // try {
        if (true) {
          throw new BaseException('Method not implemented');
          // return;
        }
      // } finally {
        // return 34;
      // }
      return 10;
    }
 
    
 }