const fs = require("fs");
const path = require("path");
const sharp = require("./node_modules/sharp");

const root = path.join(__dirname, "..");
const srcDir = path.join(root, "images", "industry-images");
const optDir = path.join(root, "images", "opt");
const photoDir = path.join(root, "images", "photo");

const MAP = [
  ["health.jfif", "ind-healthcare"],
  ["e-commecer.jfif", "ind-ecommerce"],
  ["manifacturing.jfif", "ind-manufacturing"],
  ["real.jfif", "ind-realestate"],
  ["education.jfif", "ind-education"],
  ["logistics.jfif", "ind-logistics"],
  ["professional-service.jfif", "ind-proservices"],
];

const PAGES = [
  ["healthcare.html", "ind-healthcare"],
  ["ecommerce.html", "ind-ecommerce"],
  ["manufacturing.html", "ind-manufacturing"],
  ["real-estate.html", "ind-realestate"],
  ["education.html", "ind-education"],
  ["logistics.html", "ind-logistics"],
  ["professional-services.html", "ind-proservices"],
];

async function exportStem(src, stem) {
  const cover = (w, h) => sharp(src).rotate().resize(w, h, { fit: "cover", position: "east" });
  await sharp(src).jpeg({ quality: 88, mozjpeg: true }).toFile(path.join(photoDir, stem + ".jpg"));
  await cover(1920, 1080).jpeg({ quality: 82, mozjpeg: true }).toFile(path.join(optDir, stem + ".jpg"));
  await cover(1920, 1080).webp({ quality: 76 }).toFile(path.join(optDir, stem + ".webp"));
  await cover(960, 540).jpeg({ quality: 80, mozjpeg: true }).toFile(path.join(optDir, stem + "-800.jpg"));
  await cover(960, 540).webp({ quality: 74 }).toFile(path.join(optDir, stem + "-800.webp"));
  console.log("exported", stem);
}

function heroHtml(stem, copyInner) {
  return `<section class="page-hero page-hero--photo">
        <div class="page-hero__bg" aria-hidden="true">
          <picture>
            <source type="image/webp" srcset="/images/opt/${stem}-800.webp 800w, /images/opt/${stem}.webp 1920w" sizes="100vw" />
            <img src="/images/opt/${stem}.jpg" srcset="/images/opt/${stem}-800.jpg 800w, /images/opt/${stem}.jpg 1920w" sizes="100vw" width="1920" height="1080" alt="" decoding="async" />
          </picture>
        </div>
        <div class="container page-hero__grid">
          <div>
${copyInner.trim()}
          </div>
        </div>
      </section>`;
}

function patchPage(file, stem) {
  const p = path.join(root, "pages", file);
  let html = fs.readFileSync(p, "utf8");
  html = html.replace(/href="\/css\/components\.css[^"]*"/, 'href="/css/components.css?v=ind3"');
  html = html.replace(/href="\/css\/responsive\.css[^"]*"/, 'href="/css/responsive.css?v=ind3"');
  if (html.includes("page-hero--photo")) {
    console.log("skip already photo", file);
    return;
  }
  const re =
    /<section class="page-hero">\s*<div class="container page-hero__grid">\s*<div>([\s\S]*?)<\/div>\s*<figure class="media-frame[^"]*">[\s\S]*?<\/figure>\s*<\/div>\s*<\/section>/;
  if (!re.test(html)) {
    throw new Error("hero pattern not found: " + file);
  }
  html = html.replace(re, (_, copy) => heroHtml(stem, copy));
  fs.writeFileSync(p, html);
  console.log("patched", file);
}

(async () => {
  for (const [file, stem] of MAP) {
    const src = path.join(srcDir, file);
    if (!fs.existsSync(src)) throw new Error("missing " + file);
    await exportStem(src, stem);
  }
  for (const [page, stem] of PAGES) {
    patchPage(page, stem);
  }
})().catch((err) => {
  console.error(err);
  process.exit(1);
});
