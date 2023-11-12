const execSync = require("child_process").execSync;
const sass = require("sass");
const fs = require("fs");
const path = require("path");

const PRODUCTION = false;

const getAllFiles = function (dirPath, arrayOfFiles) {
  files = fs.readdirSync(dirPath);

  arrayOfFiles = arrayOfFiles || [];

  files.forEach(function (file) {
    if (fs.statSync(dirPath + "/" + file).isDirectory()) {
      arrayOfFiles = getAllFiles(dirPath + "/" + file, arrayOfFiles);
    } else {
      arrayOfFiles.push(path.join(__dirname, "/../../", dirPath, "/", file));
    }
  });

  return arrayOfFiles;
};

const processClass = (savedFile) => {
  let baseFile = savedFile.replace(/\.[^/.]+$/, "");

  if (savedFile.endsWith("scss")) {
    if (path.join(baseFile, "/..").endsWith("/style")) {
      baseFile =
        path.join(baseFile, "/../../") +
        path.join(baseFile, "/../..").split("/").pop();
    }
  }

  const scssPath = baseFile + ".scss";
  const clsPath = baseFile + ".cls";
  const className = baseFile.split("/").pop();

  console.log("scssPath", scssPath);
  if (fs.existsSync(scssPath) && fs.existsSync(clsPath)) {
    // Both exist, so we need to compile
  } else {
    // No need to compile. Skip
    process.exit();
  }

  let compiledStyle = "";
  if (baseFile.endsWith("Design")) {
    // Design Style
    compiledStyle = fs.readFileSync(scssPath).toString();
    compiledStyle = compiledStyle
      .split("\n")
      .map((line) => {
        if (line.trim().startsWith("//")) {
          return null;
        }
        return line;
      })
      .join("")
      .replace(/[\s]+/g, " ")
      .replace(/[\s]*:[\s]*/g, ":")
      .replace(/[\s]*}[\s]*/g, "}")
      .replace(/[\s]*{[\s]*/g, "{")
      .replace(/[\s]*{[\s]*/g, "{")
      .replace(/[\s]*;[\s]*/g, ";")
      .replace(/[\s]*,[\s]+/g, ", ")
      .replace(/[\s]*&[\s]+/g, "& ")
      .replaceAll(", ", ",")
      .replaceAll(";}", "}")
      .replaceAll(" * ", "*")
      .replaceAll(" / ", "/")
      .replaceAll(", calc", ",calc")
      .replaceAll("-0.", "-.")

      .replaceAll(":0.", ":.")
      .replaceAll(" 0.", " .")
      .replaceAll(",0.", ",.")

      .replaceAll(" #", "#")

      .trim();

    if (compiledStyle.startsWith("._{")) {
      compiledStyle = compiledStyle.substring(3, compiledStyle.length - 1);
    }
  } else {
    compiledStyle = sass
      .compile(scssPath, { style: "compressed" })
      .css.toString()
      .replaceAll(": ", ":");
  }

  const clsContents = fs.readFileSync(clsPath, "utf8");

  // console.log(clsContents);

  let newClsContent = clsContents
    .split("\n")
    .map((line) => {
      if (line.includes("public string getStyle() {return '")) {
        return "    public string getStyle() {return '" + compiledStyle + "';}";
      }
      return line;
    })
    .map((line) => {
      if (line.includes("private String GLOBAL_STYLE = '")) {
        return "    private String GLOBAL_STYLE = '" + compiledStyle + "';";
      }
      return line;
    })
    .join("\n");

  if (newClsContent.indexOf("private String RENDER_TEMPLATE") >= 0) {
    let renderCode = newClsContent.substring(
      newClsContent.indexOf("    private String RENDER_TEMPLATE("),
      newClsContent.lastIndexOf(" /* END RENDER_TEMPLATE */")
    );

    renderCode = renderCode
      .split("\n")
      .map((line) => {
        if (line.trim().startsWith("//")) {
          return null;
        }

        if (line.trim().startsWith("'")) {
          return "'" + line.trim().substring(1).trim();
        }

        if (line.trim().startsWith("+ '")) {
          return "+'" + line.trim().substring(3).trim();
        }

        return line.trimEnd();
      })
      .filter((line) => {
        return line ? line.trim() != "" : false;
      })
      .join("\n");

    renderCode = renderCode
      .replace(/\'[\s]*\+[\s]*\'/g, "")
      .replace(/\'[\s]{1,}/g, "' ")
      .replace(/[\s]{1,}\'/g, " '")
      .replace(/[\s]*\+/g, " +")
      .replace(/[\s]*\+[\s]*\'/g, "+'")
      .replace(/\'[\s]*\+[\s]*/g, "'+");

    if (PRODUCTION) {
      renderCode = renderCode
        .replace(/\';[\s]*output[\s]*\+\=[\s]*\'/g, "")
        .replace(/\';[\s]*output[\s]*\+\=[\s]*/g, "' + ")
        .replace(/\HTML;[\s]*output[\s]*\+\=[\s]*/g, "HTML + ")
        .replace("String output = '", "return '")
        .replace(/[\s]*return output;/, "");
    }

    // .replaceAll("output\n+'", "output + '")

    // '
    // +  '
    // .replaceAll("';\n        output += '", "");

    newClsContent =
      newClsContent.split("/* COMPRESSED RENDER */")[0] +
      "/* COMPRESSED RENDER */\n" +
      renderCode.replace(
        "private String RENDER_TEMPLATE(",
        "public String render("
      ) +
      "\n}";
  }

  // console.log(renderCode);

  // process.exit();
  fs.writeFileSync(clsPath, newClsContent);

  return clsPath;
};

const savedFile = process.argv[process.argv.length - 1];

let deployCMD =
  "sfdx force:source:deploy -p " +
  path.join(__dirname, "/../../force-app/main/default/classes");

if (savedFile.endsWith("Harness.cls")) {
  execSync("osascript scripts/refresh_chrome.scpt");
  return;
}

// if (savedFile.includes("/common/")) {
//   // Get all scss files that need to be recompiled
//   const allFiles = getAllFiles("force-app/main/default/classes/").filter(
//     (filePath) => filePath.endsWith(".scss") && !filePath.includes("/common/")
//   );

//   for (let i = 0; i < allFiles.length; i++) {
//     processClass(allFiles[i]);
//   }
// } else {
const clsPath = processClass(savedFile);
// deployCMD = "sf force:source:deploy -p " + clsPath;
// }

// console.log("Deploying...");
// execSync(deployCMD);
console.log("Done. Refreshing Browser...");
execSync("osascript scripts/refresh_chrome.scpt");
