# About page update

Content on `/pages/about.html` was replaced to match the Corelane Systems About brief. Header, footer, search, routing, and other pages were not redesigned.

## Sections updated

1. **Hero** — eyebrow, heading, description, Let’s Talk, Explore Our Services
2. **Who we are** — split copy + workstation photograph
3. **What we do** — problem-to-system copy + seven-point list
4. **Technology approach** — seven capability cards (including Social Media Management)
5. **How we think** — split copy + boardroom atmosphere photograph
6. **Principles** — six principle cards
7. **Client approach** — partner copy + meeting photograph
8. **Process** — six-step timeline (Discover → Improve)
9. **Final CTA** — Start a Conversation + Explore Our Services

## Content added

- Business-first company narrative (who, what, how we think, principles, client approach, process)
- Capability cards linked to existing service pages
- Honest image captions (illustrative people / atmospheric rooms, not named staff or offices)
- No client counts, awards, testimonials, office claims, or performance percentages

## Files modified

- `pages/about.html` — page body, title, description, Open Graph, JSON-LD
- `css/components.css` — `.process-steps--6`, `.about-points`
- `css/responsive.css` — stack those layouts at 1200 / 992 / 768
- `js/data.js` — About search blurb/keywords
- `tools/generate-pages.ps1` — About body + title handling so a future generate does not revert this page
- `docs/ABOUT_PAGE_UPDATE.md` — this note

## Images used

Existing optimized assets only:

- `/images/opt/about.jpg` (+ 800 / webp) — hero
- `/images/opt/work.jpg` — who we are
- `/images/opt/solution.jpg` — how we think
- `/images/opt/contact.jpg` — client approach

## Responsive testing

Checked About in the local browser:

- **1440** — two-column hero and splits, no overflow
- **768** — cards and process steps in two columns, no overflow
- **360** — stacked hero, full-width buttons, single-column lists, no overflow

Also opened Contact, Services, and Software Development from the About destinations.

## Issues found

- Timeline used the seven-column process grid; six steps would have looked sparse on desktop.
- Capability list in the brief is labelled “six cards” but includes a seventh (Social Media Management).
- Playwright-style accessibility clicks in the agent browser often do not follow `<a href>`; destinations were verified by opening the URLs directly.

## Issues fixed

- Added `.process-steps--6` and matching breakpoints.
- Rendered all seven capability cards and linked them to catalog pages already on the site.
