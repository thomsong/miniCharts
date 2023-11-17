// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';

Long START_TIME = Datetime.now().getTime();

// 472340 6875
// 479720 5832/5180/7858/5227
// 479720 3000

// 365
Decimal j = 0;
Integer x = 230;
for (Integer i=0; i< 10000; i++) {
    j = 1384.2323;

// 65
    // if (x > 100) { // 189, 161
        j = 19;
    // }

// .01 / if


    // j = j * 0.17; // 310 vs 1680
    // j = j / 6; // 310 vs 1680
    // String x = 'x' + j.intValue() + 'y'; //1355 / 2288
//displayY.intValue()
    // j = j * 8;
    // j = j / 8;
    // for (Integer j=0; j<738; j++) {
    //     String o = 'hello' + 10 + 'world ';
    //     tempvar += o;
    // }
}
System.debug('j: ' + j);

// for (Integer i=0; i< 50; i++) {
//     for (Integer j=0; j<738; j++) {
//         String o = 'hello' + 10 + 'world ';
//         tempvar += o;
//     }
// }
// x = '';
// for (let i=0; i< 10000; i++) {
//     x += " + 'hello' + " + i + " + 'world '";
// }


// tempvar = 'Enter_your_name_here';

Long runTime = Datetime.now().getTime() - START_TIME;

// System.debug('DONE: ' + tempvar.length());
System.debug('runTime: ' + runTime);
// System.debug('My name is ' + tempvar);