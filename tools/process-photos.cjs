const fs = require("fs");
const path = require("path");
const sharp = require("sharp");

const srcDir = "C:\\Users\\zaida\\.cursor\\projects\\d-corelane-sysems-website\\assets";
const outDir = path.join(__dirname, "..", "images", "opt");
const photoDir = path.join(__dirname, "..", "images", "photo");

async function writeSet(input, stem, width, height) {
  const full = sharp(input).resize(width, height, { fit: "cover", position: "centre" });
  await full.clone().jpeg({ quality: 84, mozjpeg: true }).toFile(path.join(outDir, `${stem}.jpg`));
  await full.clone().webp({ quality: 78 }).toFile(path.join(outDir, `${stem}.webp`));
  const small = sharp(input).resize(Math.round(width / 2), Math.round(height / 2), {
    fit: "cover",
    position: "centre",
  });
  await small.clone().jpeg({ quality: 80, mozjpeg: true }).toFile(path.join(outDir, `${stem}-800.jpg`));
  await small.clone().webp({ quality: 76 }).toFile(path.join(outDir, `${stem}-800.webp`));
}

async function run() {
  fs.mkdirSync(outDir, { recursive: true });
  fs.mkdirSync(photoDir, { recursive: true });
  const files = fs.readdirSync(srcDir).filter((f) => /^(ind|svc)-.+\.jpg$/i.test(f));
  if (!files.length) throw new Error("No ind-/svc- source photos in " + srcDir);
  for (const file of files) {
    const input = path.join(srcDir, file);
    const stem = path.basename(file, ".jpg");
    fs.copyFileSync(input, path.join(photoDir, file));
    await writeSet(input, stem, 1600, 894);
    console.log("wrote", stem);
  }
}

run().catch((err) => {
  console.error(err);
  process.exit(1);
});
