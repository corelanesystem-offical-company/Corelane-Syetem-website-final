# Image Integration Plan — Corelane Systems

**Phase:** 0 (audit only)  
**Date:** 21 September 2026  
**Status:** No HTML, CSS, or JavaScript was modified.

This plan maps the Gemini/Canva assets in `images/` onto the **current** site and the **intended** page set. Integration cannot begin until this document is approved.

---

## 1. Current project (inspected)

```
D:\corelane-sysems-website\
├── index.html                 (only HTML page)
├── css\                       (variables, base, layout, components, animations, responsive)
├── js\                        (does not exist)
├── pages\                     (does not exist)
├── assets\logo\               (SVG lockups + favicon — already in use)
├── images\                    (logo PNG, hero video, 6 new .jfif files)
└── docs\
```

| Area | Finding |
|------|---------|
| Pages | **Home only.** No About, Services, Solutions, Industries, Work, Process, Blog, Contact, or detail templates. |
| Sections on Home | Design-system placeholder only (kicker, H1, token swatches). **No hero, problem panel, services grid, Why Corelane, case studies, or CTA band.** |
| JavaScript | None. No animation system, forms, or gallery. |
| Image usage today | CSS lockup (inline SVG). `og:image` points at `images/corelane-logo.png`. **None of the new `.jfif` files are referenced.** `header-video.mp4` is unused. |
| Responsive | `max-width: 1023px` (nav → hamburger), `max-width: 639px` (footer stack). Tokens target ~640 / 768 / 1024 / 1200. |
| Theme | Light: white, `#f4f7fb`, navy text, `#1e5aab`, cyan `#2bb8c9`, 12–16px radius. |

**Implication:** The mapping below is a **placement specification**. Phase 1 of *this* image work can only attach assets to homepage containers if those sections exist. If homepage content is still the Phase 1 foundation shell, image integration should either (a) wait for homepage sections, or (b) add reserved, empty-safe figure slots without inventing full inner-page copy. **Recommended:** after approval, integrate homepage images into the existing `index.html` using new, clearly scoped figure blocks that will become the real sections — without building every inner page in Phase 1.

---

## 2. Image inventory

| File | Size | Pixels | Ratio | Content (visual) | Quality / risk |
|------|------|--------|-------|------------------|----------------|
| `images/about-page-image.jfif` | **77 KB** | 1024 × 572 | ~16:9 | Team around a glass-wall display (cloud/architecture diagram). Left third is empty office/window. | Best-optimized file. People are AI-generated; do **not** name them as staff. Crop on mobile should prefer the **right** (people + screen), not the empty left. |
| `images/cotact.jfif` | **2.08 MB** | 2752 × 1536 | ~16:9 | Two people in a consult at a laptop (network UI on screen). Large empty wall on the left. Filename typo (`cotact`). | Too heavy for web. Same crop rule: keep faces/laptop. Do not treat as real employees. |
| `images/industry.jfif` | **2.02 MB** | 2752 × 1536 | ~16:9 | Isometric industry hub: Healthcare, Real Estate, E-commerce, Manufacturing (duplicated label), Construction, Professional Services, Startups. Labels **baked into the bitmap**. | Decorative illustration with on-image text — poor for a11y/SEO/crop. Duplicate “Manufacturing”. Use as a **wide page visual**, not as the only industry IA. |
| `images/service-page-image.jfif` | **2.22 MB** | 2752 × 1536 | ~16:9 | “Corelane Systems Services Ecosystem” isometric map. Duplicate labels: Cloud Infrastructure ×2, Data Engineering ×2. Missing UI/UX, Social Media, IT Consulting. | Title and service names are **inside the image**. Do not rely on it for content. Use as a hero/supporting figure with HTML captions repeating the real service list. |
| `images/solution.jfif` | **2.04 MB** | 2752 × 1536 | ~16:9 | Challenge → Discover → Custom Solution → “AUTOMATEN” → dashboard. Typo and odd last label (“Measurable Business Workflow”). | Strong narrative visual. On-image text is imperfect — keep HTML as source of truth. |
| `images/work-page.jfif` | **2.09 MB** | 2752 × 1536 | ~16:9 | Curved monitor + laptop showing dashboards (“Our Work”, charts, cloud diagram). Fake UI numbers on screen. | Fine as a **demo/internal UI mock**. Must not be presented as a client result. |
| `images/corelane-logo.png` | 10 KB | 288 × 288 | 1:1 | Dark-square raster logo | Keep. Do not put in the light header. |
| `images/header-video.mp4` | 2.46 MB | (H.264/AAC) | — | Unused candidate hero media | Optional contained tile; never full-bleed over H1. |
| `assets/logo/*.svg` | <1 KB | vector | — | Mark + wordmark | Already used. |

**Formats:** All photos/illustrations are **JPEG in `.jfif` wrappers** (24-bit RGB). No WebP/AVIF exists yet.

**Not in the folder (gaps vs. your page list):**

- Dedicated homepage hero (unless `about`, `work`, `solution`, or the video is reused)
- Process / SDLC visual
- Blog featured images / thumbnails
- Per-service detail heroes (software, cloud, DevOps, data, automation, UI/UX, …)
- Per-industry detail photos (healthcare, e-commerce, manufacturing, …)
- Why Corelane / CTA-specific stills

Do **not** invent extra stock. Reuse the six stills with a documented hierarchy; leave missing pages with SVG/CSS placeholders until you supply more files.

---

## 3. Page-to-image mapping (after approval)

### 3.1 Homepage (`index.html`) — Image Phase 1

| Slot | Recommended asset | Role | HTML vs CSS | Aspect / crop | Overlay |
|------|-------------------|------|-------------|---------------|---------|
| Hero **right-side** visual (preferred) | `work-page.jfif` *or* `header-video.mp4` (muted, contained) | Product/engineering atmosphere | `<img>` (or `<video>`) in a framed figure, **not** a full-bleed background behind the H1 | 16:9, `object-fit: cover`, focal point center | None if image is beside copy. If video, no text baked in. |
| Alternate: do **not** use `service-page-image.jfif` as a hero background | — | On-image “Corelane Systems…” title would fight the live H1 | — | — | — |
| Business problem / solution panel visual | `solution.jfif` | Challenge → solution story | `<img>` in the solution panel | 16:9, contain on desktop so the flow stays readable; cover + center on small screens | No dark overlay; light scene |
| Services supporting visual | `service-page-image.jfif` | One ecosystem figure **above or beside** the grid — not inside every card | `<img>` + HTML caption | 16:9, `object-fit: contain` on white/subtle bg so nodes are not cropped | None |
| Why Corelane supporting image | `about-page-image.jfif` | Collaboration | `<img>` in split layout | 16:9, `object-position: 70% 50%` to keep people in frame | None |
| CTA band | **No photographic background** (default) | Keep contrast on solid primary blue | CSS only | — | Images behind the blue CTA would hurt contrast and feel like a template |

**Homepage rules**

- Keep heading, body, and CTAs as HTML.
- Do not stretch `.jfif` files under the sticky header as a wallpaper.
- `loading` eager for the hero still/poster; `lazy` for solution / services / why.
- Width/height attributes from source (e.g. 2752×1536 or 1024×572) plus CSS `aspect-ratio: 16 / 9`.

### 3.2 About — Image Phase 2

| Slot | Asset | Notes |
|------|--------|--------|
| Primary split image | `about-page-image.jfif` | Alt describes the *scene*, not named people. Copy must not say “our team in our HQ.” |
| Supporting | none extra (only one about still). Optional: small use of `cotact.jfif` if a second band is designed — still unlabeled people. |

### 3.3 Services index — Image Phase 2

| Slot | Asset | Notes |
|------|--------|--------|
| Page visual | `service-page-image.jfif` | One figure. Repeat real services in HTML (including UI/UX, Social, Consulting — which are **missing** from the bitmap). |
| Cards | **No photos** | Icons only, per the design system. |

### 3.4 Service detail pages — Image Phase 4

**Blocked until pages exist and more art is supplied.** Interim:

| Page | Interim visual | Why |
|------|----------------|-----|
| Software / Web / Mobile | Crop of `service-page-image.jfif` is **not** recommended (text + duplicates) | Prefer CSS/SVG architecture until a dedicated still exists |
| Cloud / DevOps | Same | — |
| Data / Automation | `solution.jfif` (automation conveyor) only if the page is about workflow | Honest “illustration” caption |
| UI/UX | `work-page.jfif` (UI on screens) | Demo UI, not a shipped product claim |

Do not reuse one image on every detail page unless labeled as a shared brand illustration.

### 3.5 Solutions — Image Phase 3

| Slot | Asset |
|------|--------|
| Primary narrative visual | `solution.jfif` |
| Architecture support | Original SVG/CSS (already specified for the homepage hero). Do not duplicate `service-page-image` unless the page needs a second band. |

### 3.6 Industries index — Image Phase 3

| Slot | Asset |
|------|--------|
| Ecosystem visual | `industry.jfif` as a single hero/figure (`object-fit: contain`) |
| Cards | Text + icon; **do not** slice the isometric into six poor crops |

HTML must list industries; do not depend on bitmap labels (duplicate Manufacturing, no Education/Finance/Logistics from the footer IA).

### 3.7 Industry details — Image Phase 4

No per-industry photos. Until you add files: shared `industry.jfif` **once** as a muted banner, plus industry-specific copy. Do not claim client work.

### 3.8 Our Work — Image Phase 5

| Slot | Asset |
|------|--------|
| Intro / mock dashboard | `work-page.jfif` |
| Cards | Same file only if clearly **“Sample / demonstration UI”**. No fake % lifts. |

### 3.9 Process — Image Phase 5

No SDLC image in the folder. Use `solution.jfif` only if the page can say it is a **simplified challenge-to-delivery illustration**, and keep Discovery → … → Support as **HTML steps**. Prefer an SVG timeline if the bitmap labels (AUTOMATEN) conflict.

### 3.10 Blog — Image Phase 5

**No article images.** Do not stretch industry/service illustrations as generic thumbnails. Use a solid navy/cyan placeholder or omit images until blog art exists.

### 3.11 Contact — Image Phase 5

| Slot | Asset |
|------|--------|
| Secondary column (desktop) | `cotact.jfif` |
| Form | Remains primary; image stacks **below** or hides on small screens if it pushes the form down |

Rename in a later optimize step to `contact.jfif` or `.jpg` **without deleting** the original until references are updated.

---

## 4. Responsive behavior

| Viewport | Behavior |
|----------|----------|
| ≥1200px | 16:9 figures in split layouts (~560–640px wide). `object-fit: cover` for photos; `contain` for labeled isometrics. |
| 768–1023px | Stack: copy then image. Max height ~360px for photos so they do not dwarf copy. |
| ≤640px | Full-bleed within container gutters. **Focal points:** about/contact `object-position: 80% 50%`; isometrics `contain` (never cover-crop labels off). |
| Overflow | Images `max-width: 100%`; no `100vw` backgrounds that include scrollbar width. |

Shared class proposal (implementation, not done yet):

```css
.media-frame { border-radius: var(--radius-md); overflow: hidden; border: 1px solid var(--color-border); }
.media-frame img { width: 100%; height: 100%; object-fit: cover; aspect-ratio: 16 / 9; }
.media-frame--contain img { object-fit: contain; background: var(--color-bg-subtle); }
```

---

## 5. Accessibility

| Rule | Application |
|------|-------------|
| Informative `<img>` | Required `alt` describing the scene or diagram purpose |
| Decorative | `alt=""` only if a caption already duplicates the meaning |
| Do not | Use images as the only source of service/industry names |
| Captions | `<figure>` + `<figcaption>` for ecosystem and solution diagrams |
| Contrast | No light type on these photos; they stay beside text, not under it |
| Reduced motion | Images static; any reveal uses existing `prefers-reduced-motion` CSS |
| People | Alt like “Professionals reviewing a cloud architecture diagram in an office” — not “The Corelane team” |

**Suggested alt text (draft)**

- about: `Colleagues reviewing a cloud architecture diagram on a wall display in a modern office.`
- contact: `Two professionals discussing a system diagram on a laptop in a bright meeting space.`
- industry: `Illustration of connected industry platforms including healthcare, commerce, manufacturing, and professional services.`
- services: `Isometric diagram of Corelane Systems services including software, applications, cloud, data, automation, and APIs.`
- solution: `Illustrated path from a business challenge through discovery, a custom solution, automation, and operational dashboards.`
- work: `Demonstration dashboards for operations, automation, and cloud systems shown on a desktop and laptop.`

---

## 6. Performance optimization (do in implementation, keep originals)

| Issue | Plan |
|-------|------|
| Five stills ≈ 2 MB each | Export **derived** WebP (and JPEG fallback) at ~1600px wide, quality ~70–75, target **150–250 KB**. Keep originals in `images/` or `images/originals/`. |
| `.jfif` | Serve as `.jpg` or `.webp` for broader MIME/CDN friendliness; keep the source files. |
| No `srcset` yet | Add `srcset`/`sizes` when derivatives exist (800 / 1600). |
| CLS | Always set `width` `height` or `aspect-ratio`. |
| LCP | Homepage hero: one optimized still, `fetchpriority="high"`, not lazy. Video: poster = still frame or `work-page` derivative; `preload="none"`. |
| OG image | Do not use 288px dark logo. Prefer a 1200×630 crop of a light product visual **after** derivatives exist. Do not change OG in Image Phase 1 unless a sized file is ready. |

If the environment has no image encoder, Phase 1 may reference originals with `width`/`height` and document compression as a follow-up — still wrap in the media-frame so layout is safe.

---

## 7. Files expected to change (after approval, by image phase)

**Image Phase 1 — Homepage**

- `index.html` — add `<figure>` slots (hero, solution, services, why)
- `css/components.css` or `layout.css` — `.media-frame`, object-position utilities
- `css/responsive.css` — stack/crop rules
- `css/animations.css` — optional fade-in tied to reduced-motion (only if a reveal is added)

**Image Phase 2+** — new `pages/*.html` **only if those pages are created**; otherwise skip. This audit does not create them.

**Not to change in image work unless required**

- Token values in `variables.css`
- Existing SVG logo markup
- Deleting `images/corelane-logo.png` or `header-video.mp4`
- Inventing testimonials, metrics, or client names visible in `work-page.jfif` UI

---

## 8. Risks

1. **Site is still a foundation shell.** Dropping six huge images onto the token-preview page would look unfinished. Homepage image Phase 1 should introduce **section-shaped figures** or wait until homepage sections are built.
2. **On-image typography** (services, industries, solutions) will go blurry on retina and fail screen readers — HTML must duplicate meaning.
3. **Typos in art** (“AUTOMATEN”, `cotact`, duplicate Manufacturing/Cloud/Data) — do not repeat those strings in copy.
4. **AI people** can be read as “our staff” — captions must stay generic.
5. **2 MB LCP** will fail performance budgets until derivatives exist.
6. **Mobile crop** of about/contact will hide people if default `object-position: center` is used (empty left side).
7. **Scope creep:** service/industry/blog/process detail art is missing; do not fill with unrelated repeats.

---

## 9. Proposed integration sequence (after `NEXT`)

Aligned with your requested phases:

| Image phase | Work | Stop after |
|-------------|------|------------|
| **0** | This audit | Approval |
| **1** | Homepage slots + media-frame CSS; wire `work-page`, `solution`, `service-page-image`, `about-page-image`; optional video as contained media | Tests + wait |
| **2** | About + Services pages **if they exist**; else only homepage About/Services bands | wait |
| **3** | Solutions + Industries bands/pages with `solution.jfif` and `industry.jfif` | wait |
| **4** | Detail pages only with available art + captions; no fake uniqueness | wait |
| **5** | Work, Process (HTML steps + cautious reuse), Blog (no fake thumbs), Contact (`cotact.jfif`) | wait |
| **6** | Responsive, alt, OG, compression QA → `docs/IMAGE_INTEGRATION_QA.md` | wait |

---

## 10. Approval checkpoint

No website files were modified in this phase.

**Ask:** Approve this mapping (especially homepage hero = `work-page.jfif` beside copy, CTA = no photo, cards = no photos, missing pages = no invented art).

Reply **NEXT** to start **Image Phase 1: Homepage image integration** only.
