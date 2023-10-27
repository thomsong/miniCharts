const colors = require("colors");
const spawn = require("child_process").spawn;
const exec = require("child_process").exec;
const fs = require("fs");

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
  args[argParts[0]] = argParts[1];
}

args.GOPATH = "/tmp/.gocache";
args.GOCACHE = "/tmp/.gocache";

var landGoCmd = "/opt/homebrew/bin/go run .";
var landCompiledCmd = "land";

var landExecCmd = false ? landCompiledCmd : landGoCmd;
landExecCmd += " " + run_mode;

console.log("*************************************".green);
if (run_mode == "run") {
  console.log("*             RUN APEX             *".green);
} else {
  console.log("*             RUN TESTS             *".green);
}
console.log("*************************************".green);

if (run_mode == "run") {
  landExecCmd += " -d " + localSrcDir;
  landExecCmd += ' -a "Land#run"';
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
  // new Promise((resolve) => setTimeout(resolve, 1000));

  const params = landExecCmd.split(" ");
  const cmd = params.shift();

  console.log();
  await new Promise((resolve) => {
    land = spawn(cmd, params, { cwd: landBinDir, env: args });

    land.stdout.on("data", function (data) {
      const strData = data.toString();
      process.stdout.write(strData);
    });

    land.stderr.on("data", function (data) {
      if (data.toString().startsWith("exit status")) {
        return;
      }

      process.stderr.write(data.toString().brightRed);
    });

    land.on("exit", function (code) {
      // if (code) {
      //   console.error(
      //     ("child process exited with code " + code.toString()).brightRed
      //   );
      // }

      resolve();
    });
  });

  console.log("*************************************".green);
})();
