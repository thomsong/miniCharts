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

ConnectApi.Photo photo = ConnectApi.UserProfiles.getPhoto(null, userinfo.getUserId());

System.debug(photo);
// 50ms / photo
for (Integer i=0; i< 1; i++) {

// String URL = 'https://minicharts-dev-ed--mc-dev.develop.vf.force.com/apex/minicharts_Test_Chart?id=001Hs00002vtXNe&debug=0&isdtp=p1&oauth_token=00DHs000001xXNl!AQcAQGsQWbs4NUnOj0A828AhsO.JAI3W0suwfSJ5yYqy55Pv5iVcNuWCzfo3to378Rvx2LGWASZiYLdm6F200E8jyV2WrkAR&theme=Theme4d.1699883117';//'/profilephoto/729Hs000000sow9/T';
// String URL = 'https://minicharts-dev-ed.develop.file.force.com/profilephoto/729Hs000000sow9/T';

// Http h = new Http();
// // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint

// HttpRequest req = new HttpRequest();
// req.setEndpoint(URL);
// req.setTimeout(60000);//sets maximum timeout
// req.setMethod('GET');
// req.setHeader('Authorization', 'OAuth ' + UserInfo.getSessionId());
// // req.setHeader('Content-Type', 'application/json'); HttpResponse res = h.send(req); system.debug(res.getBody());
// // Send the request, and return a response
// HttpResponse res = h.send(req);

// // System.debug(res.getBody());
// Blob body = res.getBodyAsBlob();

// System.debug(EncodingUtil.base64Encode(body));

//then you can attach this body wherever you want
// Attachment att = new Attachment(Name = 'SET A NAME', Body = body, ContentType = 'SET A VALID CONTENT TYPE', ParentId='PARENT_OBJ_ID');
// insert att;


}


    // j = 1384.2323;

// 65
    // if (x > 100) { // 189, 161
        // j = 19;
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
// }
// System.debug('j: ' + j);

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