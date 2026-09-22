# Image Integration QA

**Date:** 21 September 2026  
**Scope:** Full site (homepage + inner pages) using compressed derivatives in `images/opt/`

## Images integrated

| Derivative | Source | Used on |
|------------|--------|---------|
| `/images/opt/work.jpg` (114 KB) | `work-page.jfif` | Homepage hero, Our Work, several service pages |
| `/images/opt/solution.jpg` (97 KB) | `solution.jfif` | Homepage problem panel, Solutions, Process, automation-related services |
| `/images/opt/services.jpg` (152 KB) | `service-page-image.jfif` | Homepage services figure, Services index, selected service details |
| `/images/opt/about.jpg` (63 KB) | `about-page-image.jfif` | Why Corelane, About, consulting/social pages |
| `/images/opt/industry.jpg` (90 KB) | `industry.jfif` | Industries index and industry detail pages |
| `/images/opt/contact.jpg` (82 KB) | `cotact.jfif` | Contact page |
| `/images/opt/og.jpg` (77 KB) | crop of work | Open Graph |

Original `.jfif` files and `header-video.mp4` were **not deleted**. Video remains unused (contained photo used for LCP instead).

## Pages updated / created

- `index.html` (hero, problems, services, why, work, CTA)
- `pages/about.html`, `services.html`, `solutions.html`, `industries.html`, `work.html`, `process.html`, `blog.html`, `contact.html`
- Service details (14) and industry details (7)
- Legal: privacy, terms, sitemap

## Files modified

CSS (`components`, `layout`, `responsive`, `animations`), JS (`data`, `navigation`, `hero-interactions`, `problems`, `services`, `animations`, `forms`, `main`), HTML as above, `images/opt/*`.

## Tests completed

- HTTP 200 for homepage, key inner pages, CSS, JS, and `work.jpg`
- Homepage snapshot: heading live in HTML, hero image beside copy, architecture nodes present, problem tabs render from JS
- Cards do not embed photos; diagrams use `object-fit: contain` and captions
- Blog has **no** filler thumbnails
- CTA band is CSS-only (no photo overlay)
- Alt text + figcaptions on informative figures; sample work labelled

## Issues found

| Issue | Status |
|-------|--------|
| Five source stills ~2 MB | Fixed via 1600px JPEG derivatives |
| `.jfif` / `cotact` typo | Originals kept; served as `contact.jpg` |
| On-image typos (AUTOMATEN, duplicate labels) | Not copied into HTML; captions warn artwork is decorative |
| Architecture node labels cramped inside circles | Fixed: labels under nodes |
| Browser MCP intermittently unavailable | Partial visual pass; HTTP checks complete |
| `header-video.mp4` not in hero | Intentional (LCP + reduced-motion) |

## Remaining recommendations

1. Supply dedicated stills for Process, Blog, and per-industry photography.
2. Add WebP/`srcset` when a build step exists.
3. Replace sample work with verified case studies.
4. Optionally add a muted poster + video tile later.
5. Official social profile URLs when they exist.
