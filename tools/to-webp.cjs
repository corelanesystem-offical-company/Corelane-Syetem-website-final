const fs = require("fs");
const path = require("path");
const sharp = require("sharp");

const dir = path.join(__dirname, "..", "images", "opt");

async function run() {
  const files = fs.readdirSync(dir).filter((f) => f.toLowerCase().endsWith(".jpg"));
  for (const file of files) {
    const input = path.join(dir, file);
    const output = path.join(dir, file.replace(/\.jpg$/i, ".webp"));
    await sharp(input).webp({ quality: 78 }).toFile(output);
    console.log(file, "->", path.basename(output));
  }
}

run().catch((err) => {
  console.error(err);
  process.exit(1);
});
