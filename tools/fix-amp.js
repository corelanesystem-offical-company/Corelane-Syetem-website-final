const fs = require("fs");
const path = require("path");

function fix(s) {
  return s.replace(/&(?!amp;|lt;|gt;|quot;|apos;|#)/g, "&amp;");
}

const root = path.join(__dirname, "..");
const files = ["index.html"].concat(
  fs.readdirSync(path.join(root, "pages")).filter((f) => f.endsWith(".html")).map((f) => path.join("pages", f))
);

for (const rel of files) {
  const file = path.join(root, rel);
  let h = fs.readFileSync(file, "utf8");
  const n = h
    .replace(/<title>([^<]*)<\/title>/, (_, t) => "<title>" + fix(t) + "</title>")
    .replace(/(<meta property="og:title" content=")([^"]*)(")/g, (_, a, b, c) => a + fix(b) + c)
    .replace(/(<meta name="twitter:title" content=")([^"]*)(")/g, (_, a, b, c) => a + fix(b) + c);
  if (n !== h) {
    fs.writeFileSync(file, n);
    console.log("amp", rel);
  }
}
