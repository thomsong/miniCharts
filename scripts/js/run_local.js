var http = require("http");
var colors = require("colors");
var spawn = require("child_process").spawn;
var exec = require("child_process").exec;
var fs = require("fs");

var walk = function (dir) {
  var results = [];
  var list = fs.readdirSync(dir);
  list.forEach(function (file) {
    file = dir + "/" + file;
    var stat = fs.statSync(file);
    if (stat && stat.isDirectory()) {
      /* Recurse into a subdirectory */
      results = results.concat(walk(file));
    } else {
      /* Is a file */
      results.push(file);
    }
  });
  return results;
};

let run_mode = process.env["RUN_MODE"] == "test" ? "test" : "run";

var projectRoot = require("path").resolve("./");
var localSrcDir = projectRoot + "/force-app/main/land/classes";
var landBinDir = projectRoot + "/bin/land/";

var args = {};
for (var i = 2; i < process.argv.length; i++) {
  var argParts = process.argv[i].split("=");
  var key = argParts[0].replace(/^-*/g, "");
  if (!argParts[1]) {
    args[key] = true;
  } else {
    args[key] = argParts[1];
  }
}

args.GOPATH = "/tmp/.gocache";
args.GOCACHE = "/tmp/.gocache";

var landGoCmd = "/opt/homebrew/bin/go run .";
var landCompiledCmd = "./land";

var landExecCmd = true ? landCompiledCmd : landGoCmd;
landExecCmd += " " + run_mode;

var serverMode = args["server"] ? run_mode == "run" : false;

console.log("*************************************".green);
if (serverMode) {
  console.log("*            APEX SERVER            *".green);
} else if (run_mode == "run" && args.method) {
  console.log("*          RUN APEX METHOD          *".green);
} else if (run_mode == "run") {
  console.log("*             RUN APEX              *".green);
} else {
  console.log("*             RUN TESTS             *".green);
}
console.log("*************************************\n".green);

if (run_mode == "run") {
  landExecCmd += " -d " + localSrcDir;

  let methodName = args.method ? args.method : "LocalChartHarness.renderSVG";
  let landClass =
    `public class Land {
  public static void run() {
    try {
      ` +
    methodName +
    `();
    } catch (Exception e) {
      System.debug(LoggingLevel.ERROR, '\\n' + e.getMessage());
    }
  }
}`;

  fs.writeFileSync(localSrcDir + "/System/Land.cls", landClass);

  landExecCmd += " -a Land#run";
} else {
  if (process.argv[2]) {
    const parts = process.argv[2].split(".");
    const filename = parts[0].toLowerCase() + ".cls";

    let files = walk(localSrcDir);
    let foundFile = false;
    for (const file of files) {
      // console.log(file);
      if (file.toLowerCase().endsWith("/" + filename)) {
        landExecCmd += " -f " + file;
        foundFile = true;

        console.error("Test Class: ".brightBlue + parts[0].yellow);
      }
    }

    if (parts.length == 2) {
      const method = parts[1].toLowerCase();
      landExecCmd += " -a " + method;
      console.error("Test Method: ".brightBlue + parts[1].yellow);
    }

    if (!foundFile) {
      console.error("Class not found: ".brightRed + parts[0].yellow);
      process.exit();
    }
  } else {
    landExecCmd += " -d " + localSrcDir;
  }
}

(async () => {
  // console.log(landExecCmd);
  const params = landExecCmd.split(" ");
  const cmd = params.shift();

  let output = "";
  function run() {
    output = "";

    return new Promise((resolve) => {
      land = spawn(cmd, params, { cwd: landBinDir, env: args });

      land.stdout.on("data", function (data) {
        const strData = data.toString();

        if (serverMode) {
          output += strData;
        } else {
          process.stdout.write(strData);
        }
      });

      land.stderr.on("data", function (data) {
        if (data.toString().startsWith("exit status")) {
          return;
        }

        process.stderr.write(data.toString().brightRed);
      });

      land.on("exit", function (code) {
        resolve();
      });
    });
  }

  if (serverMode) {
    var PORT = 8080;

    http
      .createServer(async function (req, res) {
        if (req.url != "/") {
          res.writeHead(404);
          res.end();
          return;
        }

        console.log("Refresh...");

        await run();
        res.writeHead(200, { "Content-Type": "image/svg+xml" });
        res.write(output); //write a response to the client
        res.end(); //end the response
      })
      .listen(PORT); //the server object listens on port 8080

    console.log("Listening at http://localhost:" + PORT);
    return;
  }

  await run();

  try {
    fs.rmSync(localSrcDir + "/System/Land.cls");
  } catch (e) {}

  console.log("\n*************************************".green);
})();
