# Solutions page update

The Solutions page was rebuilt as a problem-first B2B technology page. Header, footer, routing, and other pages were not redesigned.

GSAP, Lenis, ScrollTrigger, and Framer Motion are not in this project. Motion uses the existing CSS `.reveal` system and IntersectionObserver.

## Sections

1. Hero
2. Eight business-challenge cards
3. Eight solution-path cards (existing service URLs)
4. Six-step process
5. Built around your business
6. Who we help (chips; only existing industry pages are linked)
7. Connected technology flow
8. FAQ (`details`/`summary`)
9. Final CTA

## Files

- `pages/solutions.html`
- `css/components.css`, `css/responsive.css`
- `js/animations.js` (reveal grids + tech-flow lighting)
- `js/data.js` (search blurb)
- `tools/generate-pages.ps1` (no longer overwrites Solutions)

## Analytics

No event utility exists. CTAs remain ordinary links.

## Build

There is no site-level `npm run build`. Verification is in the browser.
