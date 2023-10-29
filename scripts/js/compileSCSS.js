const execSync = require("child_process").execSync;
const sass = require("sass");
const fs = require("fs");
const path = require("path");

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
  const baseFile = savedFile.replace(/\.[^/.]+$/, "");
  const scssPath = baseFile + ".scss";
  const clsPath = baseFile + ".cls";
  const className = baseFile.split("/").pop();

  if (fs.existsSync(scssPath) && fs.existsSync(clsPath)) {
    // Both exist, so we need to compile
  } else {
    // No need to compile. Skip
    process.exit();
  }

  const compiledStyle = sass
    .compile(scssPath, { style: "compressed" })
    .css.toString();

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
    .join("\n");

  let renderCode = newClsContent.substring(
    newClsContent.indexOf("    private String RENDER_TEMPLATE() {"),
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
    .join("\n")
    .replaceAll("'\n+'", "")
    .replaceAll("output\n+'", "output + '")
    .replaceAll("=\n'", "= '")

    .replaceAll("';\n        output += '", "");

  newClsContent =
    newClsContent.split("/* COMPRESSED RENDER */")[0] +
    "/* COMPRESSED RENDER */\n" +
    renderCode.replace(
      "private String RENDER_TEMPLATE()",
      "public String render()"
    ) +
    "\n}";

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
