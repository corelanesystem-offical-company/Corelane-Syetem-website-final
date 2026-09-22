# QA Report — Corelane Systems website

**Date:** 21 September 2026  
**Stack:** HTML5, CSS3, vanilla JS, compressed local images  
**Preview:** http://localhost:8080/

## Features implemented

- Sticky header, search dialog (title index), Let’s Talk CTA, mobile drawer markup
- Homepage: hero (live H1 + image + SVG architecture), problem selector, services grid, why Corelane, sample work, CTA, footer + newsletter validation
- Inner pages for services, solutions, industries, work, process, blog, contact, legal, 14 service details, 7 industry details
- No invented KPIs, clients, or testimonials
- Organization JSON-LD on the homepage (no aggregateRating)
- `prefers-reduced-motion` support, skip link, focus styles, form validation

## Files changed (high level)

- `index.html`
- `css/*`
- `js/*`
- `pages/*.html` (32 files)
- `images/opt/*` (new)
- `docs/IMAGE_INTEGRATION_PLAN.md`, `IMAGE_INTEGRATION_QA.md`, this file
- `tools/generate-pages.ps1`

## Tests performed

1. Static server: `npx serve` on port 8080 (Python launcher is not available on this machine).
2. HTTP 200: `/`, about, services, solutions, industries, work, process, blog, contact, software-development, healthcare, privacy, CSS/JS, optimized image.
3. Homepage accessibility snapshot: nav, CTAs, problem tabs, service cards, work samples, forms present.
4. Visual check of hero: text not embedded in the photo; overlay not required.
5. Confirmed original `images/corelane-logo.png` and `header-video.mp4` still served.

Not fully exercised in the flaky browser tool: mobile drawer animation, keyboard-only pass, reduced-motion live toggle, newsletter invalid-state click.

## Issues discovered / fixed

- Black PNG logo in header → CSS lockup
- 2 MB JPEGs → `images/opt` (~60–150 KB)
- Architecture labels unreadable → moved below nodes
- Dead hash nav → real `pages/` routes

- Production hosting config: `netlify.toml`, `vercel.json` (security + cache headers)
- Inner-page canonical URLs, BreadcrumbList + page-type JSON-LD, visible breadcrumbs
- 404 `noindex`

## Remaining limitations

- Search is a client-side title list, not full-text
- Forms do not persist (honest status message)
- Blog is a placeholder
- Shared industry illustration on every industry detail page until more art exists
- Root-relative URLs (`/css/...`) need a static server (not `file://`)
- Folder name still `corelane-sysems-website`

## Recommended next steps

- Real case studies and blog posts
- Production domain in canonical/sitemap (currently root-relative)
- A real form endpoint
- Light-theme SVG export of the original PNG mark
