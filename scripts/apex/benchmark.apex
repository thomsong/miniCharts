long START_TIME = Datetime.now().getTime();


String output = '';


String strI = '4';
// Decimal dec = 0;
Decimal dx = 122.00;
Decimal d = 0;
Decimal d1 = 2.00;
Decimal d2 = 1.00;

// Double dx = 1.345;
// Double d = 1.345;
// Double d1 = 1.345;
// Double d2 = 1.345;

Integer i = 1345;
Integer i1 = 1345;
// Integer i2 = 1345;


String a = 'abc'.repeat(100);

// Integer x = 0;
for (Integer ix=0; ix<20000; ix++) {
    // 3040, 2970, 3381
    // String s1 = a.repeat(2);
    // String s2 = a.repeat(2);
    // String s3 = a.repeat(2);
    // String s4 = a.repeat(2);
    // String o = s1 + s2 + s3 + s4;

    // 3000ish (4)
    // 4066, 5806(400)
    // String s1 = a.repeat(400);
    // String s2 = a.repeat(400);
    // String s3 = a.repeat(400);
    // String s4 = a.repeat(400);
    // String o = s1 + s2 + s3 + s4;

    // 3926, 3345, 
    String o = '';
    // o += a;
    // o += a;
    // o += a;
    // o += a;
    // o += a;
    // o += a;
    // o += a;
    // o += a;
    // o += a;
    // o += a;

    // 1137
    // String o = '';
    o += a + a + a + a + a + a + a + a + a + a;

    // 446
    // String o = '';
    // o += a + a + a + a + a + a + a + a + a + a;

    // 2250, 2400 (400)
    // String o = '';
    // o += a.repeat(400) + a.repeat(400) + a.repeat(400) + a.repeat(400);
    

    // dx /= d2;
    // Integer i0 = i*i1;
    //d = i*i1;
    // d = dx / d2;
    // d.setScale(1);
    // Integer i1 = Integer.valueOf(dx);
    // dec = dx;
    // Integer x = 3+2;
    // d.setScale(2);
    // if (dx.scale() > 2) { // 200ms
        // ok
    // }

// 680/925

// 992/1300 stripTrailingZeros
        //strI = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' + i;//String.valueOf(dec.setScale(2));
        //output += strI; //1100/1650
        //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa - 3100
    // }
    // strI.trim();
    // strI = String.format('{0}', String.valueOf(dx));
    // i += i1;
    
    // x+=i;
    // strI = String.valueOf(i);
    // output += 'Hel' + strI + 'lo' + strI + 'Wo' + strI + 'rld';
}


// 650 - 20,000 Decimal d = decimal.divide(x,2);
// 1200 - 20,000 Decimal d = decimal / decimal + setScale(2)

// 870,895,820 - dec /= dec
// 637 - dx.divide(d2,2);

// 677,693,626 concat dec WITH String.value
// 740ms,650ms concat dec no String.value

System.debug('runTime: ' + (Datetime.now().getTime() - START_TIME));

//450
// 1500 - dbl * dbl -> dec -> scale(2) -> strI String.val()
// 1400 - dec * dec -> scale(2) -> strI String.val()



// 26ms - 1000 - Concat 'Hello World' tight loop
// 437ms - 10000 - Concat 'Hello World' tight loop
// 834ms - 20000 - Concat 'Hello World' tight loop

// 860ms - 20000 - Concat 'Hello ' + 'World' tight loop
// 1480ms - 20000 - Concat 'Hello ' + 'World' x 2 lines tight loop
// 3000ms - 20000 - Concat 'Hello', i, 'World' x 3 lines tight loop
// 1250ms - 20000 - Concat 'Hello', i, 'World' ONE LINE tight loop
// 2180ms - 20000 - Concat  'Hel' + i + 'lo' + i + 'Wo' + i + 'rld'
// 1113ms - 20000 - Concat  'Hel' + strI + 'lo' + strI + 'Wo' + strI + 'rld'

// 816 - 20,000 convert int to string + ''
// 642 - 20,000 convert int to string - String.valueOf


// 240 - 20,000 EMPTY LOOP
// 825/750/950 - 20,000 Decimal d += int
// 900/700 - 20,000 Decimal d += decimal
// 727/711 - 20,000 Decimal d = decimal * decimal
// 1055/985 - 20,000 Decimal d = decimal * decimal + setScale(2)
// 1265/1400 - 20,000 Decimal d = decimal * decimal + strI assign .setScale(2)

// 859/1050/840 - 20,000 Decimal d = double * double + strI assign 
// 3000 - 20,000 Decimal d = double * double + strI assign (round *100.0/100.0)
// 1852 - 20,000 Decimal d = double * double + strI assign (round)

// 914/1250/990 - 20,000 double d = double * double + strI assign

// 625/700/650 - 20,000 Decimal d = Decimal * Decimal
// 881/930/900 - 20,000 Decimal d = Decimal * Decimal + setScale(2)

// setScale(2, RoundingMode.CEILING);

// 950/925 - 20,000 Integer i = int * int + strI assign
// 439 - 20,000 Integer i = int * int


// 400 - 20,000 Double d += int
// 440 - 20,000 Double d += Double

// 450 - 20,000 Int int++;
// 450 - 20,000 Int int+=2;
// 478 - 20,000 Int int+=i; int