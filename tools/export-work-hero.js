const path = require("path");
const fs = require("fs");
const sharp = require("./node_modules/sharp");

const root = path.join(__dirname, "..");
const src = path.join(
  process.env.USERPROFILE || "",
  ".cursor",
  "projects",
  "d-corelane-sysems-website",
  "assets",
  "c__Users_zaida_AppData_Roaming_Cursor_User_workspaceStorage_069eae2c219e36e6f314e3048602b738_images_image-4bbfc0ae-165a-4f84-bed4-95406f70922b.jpg"
);
const stem = "work-hero";
const optDir = path.join(root, "images", "opt");
const photoDir = path.join(root, "images", "photo");

if (!fs.existsSync(src)) {
  console.error("missing source", src);
  process.exit(1);
}

async function run() {
  fs.mkdirSync(photoDir, { recursive: true });
  const cover = (w, h) => sharp(src).rotate().resize(w, h, { fit: "cover", position: "east" });
  await sharp(src).jpeg({ quality: 88, mozjpeg: true }).toFile(path.join(photoDir, stem + ".jpg"));
  await cover(1920, 1080).jpeg({ quality: 82, mozjpeg: true }).toFile(path.join(optDir, stem + ".jpg"));
  await cover(1920, 1080).webp({ quality: 76 }).toFile(path.join(optDir, stem + ".webp"));
  await cover(960, 540).jpeg({ quality: 80, mozjpeg: true }).toFile(path.join(optDir, stem + "-800.jpg"));
  await cover(960, 540).webp({ quality: 74 }).toFile(path.join(optDir, stem + "-800.webp"));
  console.log("exported", stem);
}

run().catch((err) => {
  console.error(err);
  process.exit(1);
});
