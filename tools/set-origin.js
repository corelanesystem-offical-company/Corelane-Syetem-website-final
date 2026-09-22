const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "..");
const from = "https://corelane.netlify.app";
const to = "https://corelanesystems.com";
const skip = new Set(["node_modules", ".git", "tools/node_modules"]);
const ok = new Set([".html", ".xml", ".txt", ".js", ".ps1", ".json", ".webmanifest", ".toml", ".md"]);

let n = 0;
function walk(dir) {
  for (const name of fs.readdirSync(dir)) {
    if (name === "node_modules" || name === ".git") continue;
    const p = path.join(dir, name);
    const st = fs.statSync(p);
    if (st.isDirectory()) {
      walk(p);
      continue;
    }
    if (!ok.has(path.extname(name))) continue;
    let txt = fs.readFileSync(p, "utf8");
    if (!txt.includes(from)) continue;
    fs.writeFileSync(p, txt.split(from).join(to));
    n += 1;
    console.log(path.relative(root, p));
  }
}

walk(root);
console.log("updated", n, "files");
