const execSync = require("child_process").execSync;
const sass = require("sass");
const fs = require("fs");
const path = require("path");

const PRODUCTION = true;

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

      .replaceAll(", ", ",")
      .replaceAll(" )", ")")
      .replaceAll("( ", "(")

      .trim();

    if (compiledStyle.startsWith("._{")) {
      compiledStyle = compiledStyle
        .substring(3, compiledStyle.length - 1)
        .replaceAll("'", "\\'");
    }
  } else {
    compiledStyle = sass
      .compile(scssPath, PRODUCTION ? { style: "compressed" } : {})
      .css.toString();

    if (PRODUCTION) {
      compiledStyle = compiledStyle
        .replaceAll(", ", ",")
        .replaceAll(" * ", "*")
        .replaceAll(" / ", "/")
        .replace(/[\s]*:[\s]*/g, ":");
    }
  }

  const clsContents = fs.readFileSync(clsPath, "utf8");
  let newClsContent = clsContents;
  let renderCode = "";
  // console.log(clsContents);

  if (clsContents.indexOf("private String RENDER_TEMPLATE") >= 0) {
    renderCode = newClsContent.substring(
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
        .replace(/\';[\s]*output[\s]*\+\=[\s]*/g, "'+")
        .replace(/\HTML;[\s]*output[\s]*\+\=[\s]*/g, "HTML+")
        .replace(/\SVG;[\s]*output[\s]*\+\=[\s]*/g, "SVG+");

      if (renderCode.includes("return output;")) {
        renderCode = renderCode
          .replace("String output = '", "return '")
          .replace(/[\s]*return output;/, "");
      }
    }

    // .replaceAll("output\n+'", "output + '")

    // '
    // +  '
    // .replaceAll("';\n        output += '", "");

    renderCode = renderCode.replace(
      "private String RENDER_TEMPLATE(",
      "public String render("
    );
  }

  compiledStyle = compiledStyle.replaceAll("\n", "\\n");

  if (renderCode !== "") {
    // Re-map --d- vars to shorthand for production
    if (PRODUCTION) {
      const matches = [...compiledStyle.matchAll("--d-(.)*?[^-_a-zA-Z0-9]")];
      // console.log(matches);
      let varNames = [];
      matches.forEach((element) => {
        let match = element[0];
        match = match.substring(0, match.length - 1);
        varNames.push(match);
      });

      // Remove dupes and sort in reverse
      // Reverse helps not replace partial var names
      varNames = [...new Set(varNames)].sort();
      varNames.reverse();

      let idx = 0;
      varNames.forEach((element) => {
        let newVarName = "--" + idx;

        if (baseFile.includes("/Base")) {
          newVarName = "--b" + idx;
        }

        // console.log(element, newVarName);
        renderCode = renderCode.replaceAll(element, newVarName);
        compiledStyle = compiledStyle.replaceAll(element, newVarName);
        // console.log(element, newVarName);
        idx++;
      });
      // newClsContent = newClsContent.replaceAll("--d-", "--dxx-");
    }

    // Re-map _class class names to shorthand for production
    if (PRODUCTION) {
      const matches = [...compiledStyle.matchAll("._(.)*?[^-_a-zA-Z0-9]")];
      // console.log(matches);
      let classNames = [];
      matches.forEach((element) => {
        let match = element[0];
        match = match.substring(1, match.length - 1);
        classNames.push(match);
      });

      // Remove dupes and sort in reverse
      // Reverse helps not replace partial var names
      classNames = [...new Set(classNames)].sort();
      classNames.reverse();

      // console.log(classNames);
      let idx = 0;
      classNames.forEach((element) => {
        let newClassName = "z" + idx;

        if (baseFile.includes("/Base")) {
          newClassName = "bz" + idx;
        }

        // console.log(element, newClassName);

        renderCode = renderCode.replaceAll(element, newClassName);
        compiledStyle = compiledStyle.replaceAll(element, newClassName);
        idx++;
      });
      // newClsContent = newClsContent.replaceAll("--d-", "--dxx-");
    }
  }

  if (renderCode !== "") {
    if (newClsContent.includes("/* COMPRESSED STATIC RENDER */")) {
      newClsContent =
        newClsContent.split("/* COMPRESSED STATIC RENDER */")[0] +
        "/* COMPRESSED STATIC RENDER */\n" +
        renderCode.replace(
          "public String render",
          "public static String render"
        ) +
        "\n}";
    } else {
      newClsContent =
        newClsContent.split("/* COMPRESSED RENDER */")[0] +
        "/* COMPRESSED RENDER */\n" +
        renderCode +
        "\n}";
    }
  }

  newClsContent = newClsContent
    .split("\n")
    .map((line) => {
      if (line.includes("public String getStyle() {return '")) {
        return "    public String getStyle() {return '" + compiledStyle + "';}";
      }
      return line;
    })
    .map((line) => {
      if (line.includes("public static String getStyle() {return '")) {
        return (
          "    public static String getStyle() {return '" +
          compiledStyle +
          "';}"
        );
      }
      return line;
    })
    .map((line) => {
      if (line.includes("public String getStyle() {return Base")) {
        return (
          "    public String getStyle() {return BaseGraphDesign.getStyle()+'" +
          compiledStyle +
          "';}"
        );
      }
      return line;
    })
    .map((line) => {
      if (line.includes("private String GLOBAL_STYLE = '")) {
        return "    private String GLOBAL_STYLE = '" + compiledStyle + "\\n ';";
      }
      return line;
    })
    .join("\n");

  fs.writeFileSync(clsPath, newClsContent);

  // console.log(renderCode);

  // process.exit();

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
