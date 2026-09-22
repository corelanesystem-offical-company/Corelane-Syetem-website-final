# UI/UX Audit — Corelane Systems Website

**Phase:** 0 (audit and documentation only)  
**Date:** 21 September 2026  
**Scope:** Existing repository, attached homepage reference, brand and technical constraints  
**Status:** No production HTML, CSS, or JavaScript exists. No files were redesigned, moved, or deleted.

---

## 1. Project structure (inspected)

Workspace root: `D:\corelane-sysems-website`

```
D:\corelane-sysems-website\
├── images\
│   ├── corelane-logo.png      (10,427 bytes)
│   └── header-video.mp4       (2,575,398 bytes)
└── docs\                      (created in Phase 0)
    ├── UI_UX_AUDIT.md
    ├── DESIGN_SYSTEM.md
    └── IMPLEMENTATION_PLAN.md
```

**Not present:** `index.html`, `pages/`, `css/`, `js/`, `assets/`, fonts, favicon, `package.json`, README, sitemap, robots.txt, or a Git repository.

The folder name `corelane-sysems-website` is missing a “t” in “systems”. That is noted only; renaming is out of scope unless requested.

---

## 2. Existing assets

### 2.1 Logo — `images/corelane-logo.png`

- Square raster mark on a **solid black** background.
- Icon: four connected nodes in cyan/teal (network / systems metaphor).
- Wordmark: “Corelane” in white; “SYSTEMS” in cyan, smaller, tracked out.
- Suitable as a brand source, **not** as a drop-in header logo on a light site (black box will look like a sticker).
- **Preserve as-is.** Later phases should derive a light-theme header treatment (crop/mask, SVG redraw, or CSS-contained mark) without deleting this file.

### 2.2 Hero / header video — `images/header-video.mp4`

- ISO Base Media (`ftyp` / `isom`), H.264 (`avc1`) + AAC (`mp4a`).
- Size ~2.46 MB — acceptable for a muted looping hero background if compressed further and never autoplaying with sound.
- **Preserve as-is.** Do not assume it is the final hero visual until it is reviewed in context (motion, faces, on-screen text, licensing).
- If the clip contains people, overlaid marketing copy, or third-party UI, treat it as a candidate asset, not a copyright-cleared stock plate.

### 2.3 Fonts, icons, photos, CSS, JS

None in the repository. All typography, icons, and section visuals must be introduced in later phases using original SVG/CSS or clearly licensed files.

---

## 3. Existing pages and functionality

| Area | Finding |
|------|---------|
| Pages | None. No homepage or inner routes. |
| Navigation | None. |
| Forms | None (no contact, search, or newsletter). |
| Interactions | None. |
| SEO | No title, meta, Open Graph, or structured data. |
| Accessibility | No document to evaluate. |
| Backend | None (matches the vanilla-static requirement). |
| Dependencies | None. |

**Content to preserve:** only the two files under `images/`. There is no copy, IA, or working UI to carry forward.

---

## 4. Reference screenshot — layout analysis

The attached frame is a **full-page light B2B marketing homepage**. It is used as **visual direction** (hierarchy, spacing, section order), not as a source of branding files, photography, dashboard art, handwriting, or verbatim marketing claims.

### 4.1 Page architecture (top to bottom)

1. **Utility header** — logo left; primary nav center; search + filled CTA right.
2. **Hero** — two columns: copy + dual CTAs + trust chips (left); person-at-laptop photo, quote overlay, stats card, video card (right).
3. **Problem selector** — “Is This Your Challenge?” with a row of problem tiles; first tile active (filled blue).
4. **Recommended solution panel** — dashboard mock, title, benefits, primary CTA, secondary consult strip.
5. **Services grid** — eight services, icon + title + one-line description; “View All Services” at right.
6. **Why choose** — heading, five feature items, photo + quote, numeric stat stack.
7. **Case studies** — three cards with metric overlays and “Read Case Study”.
8. **CTA band** — full-width blue bar, two actions, decorative script on the right.
9. **Footer** — dark navy; brand column, Company / Services / Industries, newsletter, legal row.

### 4.2 Spacing and grid (inferred)

- Wide content column (~1120–1200px) with generous side gutters on large screens.
- Consistent vertical rhythm: section padding roughly 72–96px desktop, tighter on small screens.
- Cards use modest radius (≈12–16px), 1px cool-gray borders, and **soft** elevation — not heavy drop shadows.
- Hero and problem rows are 8-up on desktop; they will not fit that way on tablet/phone without wrapping or a scroller.

### 4.3 Typography (inferred)

- Modern geometric/humanist sans (Inter/Manrope class).
- Hero display: large, tight leading, navy; second line accented in brand blue.
- Section kicker in small caps / tracked uppercase + muted blue.
- Body ~16px, comfortable line length, gray-blue secondary text.
- Numerals in stats are heavy weight; labels are small and muted.

### 4.4 Color system (inferred from the frame)

| Role | Direction | Notes |
|------|-----------|--------|
| Page ground | Near-white | Clean, high key |
| Alternate sections | Soft blue-gray | Very low saturation |
| Text | Deep navy | Not pure black |
| Primary accent | Professional mid blue | Filled buttons, active problem tile |
| Secondary surfaces | White cards | Border + light shadow |
| Inverse | Deep navy footer | White type, blue links/CTA |
| Logo cyan | Teal node color | Use sparingly so the site stays “engineering,” not “SaaS neon” |

Exact tokens are specified in `DESIGN_SYSTEM.md` as a **new** palette inspired by this direction, not sampled pixel-for-pixel from a third-party file.

### 4.5 Interaction cues in the frame

- Selected problem tile: inverted (blue fill, white type).
- Arrow annotation: “Choose your problem and see the solution.”
- Solution panel updates with the selected problem (implied JS state).
- Search icon and “Let’s Talk” as persistent conversion paths.
- Service cards look hoverable (icon color + elevation).
- Video card suggests a modal or inline player (“Watch 2 Min Video”).

### 4.6 What we will **not** copy from the frame

- Photography of people, dashboards, or product UI.
- Handwritten overlays (“Focus on your business…”, “Let’s Build a Smarter Tomorrow”).
- Unverified metrics: 60% / 3x / 50% / 100%, 50+ clients, 100+ projects, 98% satisfaction, +300% sales, 70% time saved, 2x engagement.
- Named “satisfied client” quotes without a real attribution.
- Any implied third-party brand marks in social or product icons beyond generic SVG.

---

## 5. Brand-fit assessment

**Fits Corelane (keep as direction)**

- Light enterprise aesthetic, navy + blue, high contrast.
- Problem-led conversion (challenge → recommended solution → talk).
- Service breadth presented as engineering + operations, not “growth hacking.”
- Sticky, complete IA: Home, Services, Solutions, Industries, Our Work, About, Blog, Contact.

**Does not fit / must be redesigned in implementation**

- Agency-style lifestyle hero as the *only* right-column story. Brief asks for an **interactive architecture / workflow** (Challenge → Strategy → Software → Cloud → Deploy → Growth).
- Fake social proof and percentage callouts.
- Marketing-agency density of social icons inside the services grid (Instagram/TikTok cluster) — keep Social Media Management as a service, but visually subordinate to engineering.
- Black logo tile on white chrome.

**Positioning filter (avoid)**

- Rainbow palettes, blob illustrations, glassmorphism, neon, freelancer “I build websites” hero, template-looking 4-card service rows with stock isometric PNGs.

---

## 6. Information architecture gaps vs. the brief

The homepage brief is complete. Inner pages are named in nav/footer but **do not exist** yet:

| Route (planned) | Linked from | Phase 0 status |
|-----------------|-------------|----------------|
| `/` or `index.html` | Logo, Home | To build after approval |
| Services | Header, footer, “View All” | Placeholder page or section anchors first |
| Solutions | Header | Needs a page or dedicated section |
| Industries | Header, footer | Healthcare / manufacturing / etc. only as IA, no fake clients |
| Our Work | Header, case studies | Demo/internal case cards only |
| About | Header, footer | Not in homepage-only phases |
| Blog | Header | Future; link can be `pages/blog.html` stub |
| Contact | Header, CTA, footer | Form required for conversion |
| Privacy, Terms, Sitemap | Footer | Legal stubs |
| Search | Header icon | Overlay or dedicated page; no backend search |

**Recommendation:** Phase 1–9 deliver a production-quality **homepage** plus **functional stubs** for every header/footer URL so links never 404. Full inner-page design is a later approval cycle.

---

## 7. Technical risks

| Risk | Impact | Mitigation in later phases |
|------|--------|----------------------------|
| Greenfield build | Entire UI must be created | Follow the agreed file structure; ship homepage first |
| Dark raster logo | Ugly header, poor contrast on sticky white bar | SVG redraw or masked light variant; keep original PNG |
| Hero video weight & motion | Autoplay, data cost, vestibular issues, LCP | Poster frame, `muted` `playsinline` `loop`, `prefers-reduced-motion` → static poster; consider architecture SVG as primary visual |
| 8 problem tiles in one row | Horizontal overflow on tablet/phone | Wrap to 2×4 / 1×n, or accessible horizontal scroll with snap |
| Architecture diagram + parallax | Jank, layout shift, inaccessible hover-only info | CSS/SVG first; JS enhancement; keyboard focus on nodes; reduced-motion kill switch |
| Fake metrics temptation | Trust and legal risk | Placeholders labeled “Sample — replace with verified data” |
| No image pipeline | Large assets, CLS | Explicit width/height, local optimized files, SVG diagrams |
| Search without a backend | Dead control | Client-side filter of a small page index, or “coming soon” dialog that is honest |
| Newsletter without backend | Broken submit | Front-end validation + success message stating submissions are not stored yet, or `mailto:` fallback documented |
| Windows local workflow | Path/sandbox limits | Static files; open `index.html` or a simple static server for QA |
| Folder typo in path | Confusion in deploys | Document; rename only if requested |
| No Git | No history | Initialize only if requested |

---

## 8. Responsive and interaction risks (from the reference layout)

- **Hero:** Two-column + overlapping cards will stack; floating stats must not cover CTA tap targets.
- **Header:** Eight nav items + search + CTA will not fit below ~1100px → hamburger + drawer (required).
- **Problem row:** Active state + solution panel must remain usable with keyboard and on a single column.
- **Services:** 8-column desktop → 4 / 2 / 1.
- **Why + case studies:** Split layouts become stacked; avoid oversized photos pushing CTAs below the fold on mobile without a clear next action.
- **Footer:** Four columns collapse to accordion or stacked lists; newsletter field + button must stay 44px+ tall.
- **Touch:** Hover-only architecture highlights need a tap/selected equivalent.
- **Overflow:** Watch 100vw + scrollbar, full-bleed blue CTA, and absolutely positioned hero cards.

---

## 9. Accessibility and SEO baseline (target, not current)

Current score: **N/A** (no pages).

Targets for implementation:

- One `h1` (hero); sequential `h2` per section.
- Contrast: navy on white and white on blue meeting WCAG AA.
- Focus rings on nav, cards, nodes, form fields.
- `prefers-reduced-motion` disables parallax, looping video, and non-essential SVG dash animation.
- Descriptive alt text; decorative SVGs `aria-hidden`.
- Organization JSON-LD with name, URL, logo (no invented reviews/ratings).

---

## 10. Audit conclusions

1. This is a **greenfield** static site with two brand assets to keep.
2. The reference is a strong **enterprise light-theme** direction; implementation must replace stock-photo + fake-KPI storytelling with an **original interactive systems visual** and honest copy.
3. Highest product risks: header density, problem-selector responsiveness, hero performance, and unverifiable claims.
4. Highest brand risks: looking like a marketing template, or pasting the black logo onto a white bar.
5. **No application code should be written until this audit, the design system, and the implementation plan are approved.**

**Phase 0 complete. Waiting for approval before Phase 1.**
