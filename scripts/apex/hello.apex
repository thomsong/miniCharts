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

for (Integer i=0; i< 50; i++) {
    for (Integer j=0; j<738; j++) {
        String o = 'hello' + 10 + 'world ';
        tempvar += o;
    }
}
// x = '';
// for (let i=0; i< 10000; i++) {
//     x += " + 'hello' + " + i + " + 'world '";
// }


// tempvar = 'Enter_your_name_here';

Long runTime = Datetime.now().getTime() - START_TIME;

System.debug('DONE: ' + tempvar.length());
System.debug('runTime: ' + runTime);
// System.debug('My name is ' + tempvar);