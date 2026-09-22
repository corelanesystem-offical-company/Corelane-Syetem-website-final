# Implementation Plan — Corelane Systems Website

**Constraint:** Implement **one phase at a time**. After each phase, report files, tests, and issues, then **stop** until the user sends `NEXT`.

**Phase 0 (this document):** Audit and documentation only. No UI code. No deletions.

---

## Ground rules

- Stack: HTML5, CSS3, vanilla ES6+, original SVG/CSS visuals.
- No React/Vue/Angular, no backend framework, no unnecessary libraries.
- Do not delete `images/corelane-logo.png` or `images/header-video.mp4`.
- Do not invent metrics, clients, testimonials, or awards.
- Adapt the suggested `/css` `/js` `/pages` `/assets` layout to this repo: **keep** `images/` as the current asset root unless a later approved phase copies files into `assets/` and updates references.
- Every header/footer href must resolve to a real file or in-page id, or be labeled as a future route in a stub page.

---

## Target tree (after later phases; not created in Phase 0)

```
/
├── index.html
├── pages/
│   ├── services.html
│   ├── solutions.html
│   ├── industries.html
│   ├── work.html
│   ├── about.html
│   ├── blog.html
│   ├── contact.html
│   ├── privacy.html
│   ├── terms.html
│   └── sitemap.html
├── css/
│   ├── variables.css
│   ├── base.css
│   ├── layout.css
│   ├── components.css
│   ├── responsive.css
│   └── animations.css
├── js/
│   ├── main.js
│   ├── navigation.js
│   ├── hero-interactions.js
│   ├── problems.js
│   ├── services.js
│   └── animations.js
├── images/                 (existing — preserve)
│   ├── corelane-logo.png
│   └── header-video.mp4
├── assets/                 (optional; only if we add new files)
│   ├── icons/
│   └── logo/
└── docs/
    ├── UI_UX_AUDIT.md
    ├── DESIGN_SYSTEM.md
    ├── IMPLEMENTATION_PLAN.md
    └── QA_REPORT.md        (Phase 9)
```

Inner pages in early phases may be **lightweight stubs** (shared header/footer + “page coming next” + relevant anchors) so navigation never 404s. Homepage is the design-complete surface for Phases 1–9.

---

## Phase 0 — Audit and documentation

**Status:** Complete (waiting for approval)

**Done**

- Inspected repository (greenfield + two assets).
- Reviewed reference layout, type, color, and interactions.
- Logged risks (logo on light UI, video, overflow, fake KPIs, a11y).
- Wrote `docs/UI_UX_AUDIT.md`, `docs/DESIGN_SYSTEM.md`, `docs/IMPLEMENTATION_PLAN.md`.

**Not done (intentionally)**

- No HTML/CSS/JS.
- No file moves or deletions.

**Exit:** User approval.

---

## Phase 1 — Design system and global layout

**Build**

- Tokenized `css/variables.css` from `DESIGN_SYSTEM.md`.
- `base.css`: reset, typography (Inter; optional Manrope for H1), focus, skip link.
- `layout.css`: container, section, header/footer **structure** (may be unstyled chrome).
- `index.html` document shell: meta, title, Open Graph placeholders, semantic `header` / `main` / `footer`.
- Link CSS in a stable order.
- Favicon placeholder if we can derive it without destroying the PNG.

**Tests**

- HTML loads with tokens applied to a simple proof block (then removed or replaced in Phase 2).
- No JS errors.
- Logo file still present.

**Stop** after tokens + document skeleton.

---

## Phase 2 — Navigation and responsive structure

**Build**

- Sticky header: logo treatment for light bg, 8 links, search control, Let’s Talk.
- Mobile hamburger, drawer, ARIA, Esc, focus, close on navigate.
- Scroll background/shadow.
- Active state (pathname + in-page section observer where applicable).
- Footer IA with working stub routes.
- `responsive.css` for header collapse.
- `js/navigation.js` + `js/main.js`.

**Tests**

- Desktop nav, keyboard, mobile drawer, no 404s, no horizontal overflow at 320 / 768 / 1024 / 1440.

**Stop.**

---

## Phase 3 — Interactive hero

**Build**

- Live HTML: badge, “Your Business Problems, Our Smart Solutions.”, supporting copy, Discuss / See Our Solutions.
- Qualitative trust line (no fake numbers).
- Original SVG/CSS architecture: Challenge → Strategy → Software → Cloud → Deploy → Growth.
- Node hover/focus, connected edges, tooltip/card.
- Scroll indicator.
- `js/hero-interactions.js`.
- Evaluate `header-video.mp4` as a **contained** optional tile; do not cover copy; respect reduced motion.

**Tests**

- Headline selectable/editable in HTML.
- Keyboard through nodes.
- Reduced-motion: no parallax/autoplay.
- Hero stacks cleanly on mobile.

**Stop.**

---

## Phase 4 — Business problems

**Build**

- “Is This Your Challenge?”
- Eight problems from a JS data object (titles from the brief).
- Accessible selection; panel updates (title, description, benefits, SVG visual, CTA).
- `js/problems.js`.

**Tests**

- Click, keyboard, no duplicate markup source, transitions without CLS.

**Stop.**

---

## Phase 5 — Services

**Build**

- “End-to-End Digital Solutions”
- Eight services from JS data; icons; learn more → stub or `#` section on services page.
- `js/services.js`.

**Tests**

- Grid breakpoints, hover/focus, data-driven render.

**Stop.**

---

## Phase 6 — Why Corelane and case studies

**Build**

- “More Than Just a Service Provider” + five features (no testimonial quotes unless real; no 50+/100+/98% stack).
- Split layout + original visual (not random stock).
- Case study cards: **sample/demo** labeling; no revenue or % lifts.
- Architecture ready to swap real projects later (`js` data).

**Tests**

- Responsive split; links to work stubs; no invented metrics in DOM.

**Stop.**

---

## Phase 7 — CTA and footer

**Build**

- “Ready to Solve Your Business Challenges?” + supporting sentence.
- Start a Conversation + Contact.
- Subtle CSS pattern (not glass, not neon).
- Footer complete: social placeholders, newsletter field + validation, legal links, copyright.
- Button loading/success/error for newsletter (client-side only; honest empty-backend message).

**Tests**

- CTAs resolve; form invalid/valid states; footer columns on mobile.

**Stop.**

---

## Phase 8 — SEO, accessibility, performance

**Build**

- Final titles/descriptions, OG, Organization JSON-LD (no aggregateRating).
- Alt text, heading order, skip link, contrast pass.
- `prefers-reduced-motion` audit.
- Image dimensions, compressed assets, no layout shift from hero visual.
- Basic search UX (static index of pages/sections or honest unavailable state).

**Tests**

- Keyboard-only pass, axe-like manual checks, Lighthouse-style notes if a browser is available.

**Stop.**

---

## Phase 9 — Final browser QA

**Build**

- `docs/QA_REPORT.md` (features, files, tests, issues found/fixed, limitations, next steps).
- Fix confirmed bugs only.

**Tests (required list)**

1. HTML/CSS/JS sanity  
2. Open in browser  
3. All nav links  
4. Mobile menu  
5. Every CTA  
6. Problem cards  
7. Forms  
8. Responsive viewports  
9. Console errors  
10. Horizontal overflow  
11. Keyboard  
12. Reduced motion  
13. Visual check vs direction (not pixel clone)  
14. Fix confirmed errors  

**Stop.** Homepage v1 complete pending further inner-page work.

---

## Data objects (introduced when their phase starts)

**Problems** (Phase 4): `id`, `title`, `short`, `icon`, `solutionTitle`, `solutionDescription`, `benefits[]`, `ctaLabel`, `ctaHref`.

**Services** (Phase 5): `id`, `title`, `description`, `icon`, `href`.

**Case studies** (Phase 6): `id`, `category`, `title`, `type`, `description`, `image`, `href`, `isSample: true`.

**Nav** (Phase 2): shared array used by header and footer to avoid drift.

---

## Testing approach per phase

- Prefer a local static preview (opened `index.html` or a one-line static server).
- Browser tools: snapshot + interaction, desktop and a mobile width (~390px).
- Console must stay clean.
- If a check cannot run (no browser MCP, no linter), say so in the phase report.

---

## Risks carried into build (from audit)

1. Light-theme logo treatment.  
2. Hero video vs architecture diagram (diagram is the brief’s primary visual).  
3. Eight-up problem row overflow.  
4. Search and newsletter without a backend.  
5. Pressure to copy fake KPIs from the reference — **refuse in implementation**.

---

## After Phase 9 (out of this plan unless requested)

- Full inner pages (Services detail, Industries, Blog index).
- Real case studies and photography.
- Production search/newsletter backend.
- Git init / hosting.
- Light-theme SVG logo production file.

---

## Current ask

**Approve Phase 0.** Reply `NEXT` (or equivalent) to start **Phase 1: Design system and global layout** only.
