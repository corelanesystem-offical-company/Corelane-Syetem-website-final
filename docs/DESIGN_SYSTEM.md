# Design System — Corelane Systems

**Phase:** 0 (specification only; not implemented in CSS yet)  
**Theme:** Light only  
**Character:** Technology + engineering + business growth + reliability + innovation  
**Not:** Marketing-agency chrome, neon startup, freelancer portfolio, or generic template.

This document defines tokens and patterns for later CSS (`css/variables.css` and component files). Values are original tokens aligned to the approved visual direction. They are not a pixel-trace of any third-party file.

---

## 1. Brand marks

| Asset | Use |
|-------|-----|
| `images/corelane-logo.png` | Source of truth for the node mark and wordmark. Do not delete. |
| Future SVG logo | Preferred in header/footer for sharpness and light backgrounds. |
| Wordmark lockup | “Corelane” + “SYSTEMS” (small caps / tracked). |
| Icon | Four connected nodes — reuse as a **subtle** system motif (favicon, footer mark, architecture nodes), not as scattered floating blobs. |

**Light header rule:** Never place the full black PNG in the sticky bar. Use a transparent-background or CSS-masked version on white/navy.

**Favicon:** Derive from the node mark on navy or white; 32×32 and 180×180 later.

---

## 2. Color tokens

```css
:root {
  /* Surfaces */
  --color-bg: #ffffff;
  --color-bg-subtle: #f4f7fb;
  --color-bg-muted: #e8eef6;
  --color-surface: #ffffff;
  --color-inverse: #0b1f3a;

  /* Text */
  --color-text: #0b1f3a;
  --color-text-secondary: #3d5270;
  --color-text-muted: #5b6f8a;
  --color-text-on-dark: #f4f7fb;
  --color-text-on-accent: #ffffff;

  /* Brand */
  --color-primary: #1e5aab;
  --color-primary-hover: #174a8f;
  --color-primary-soft: #e7f0fa;
  --color-accent-cyan: #2bb8c9; /* logo-aligned; use sparingly */

  /* Lines and elevation */
  --color-border: #d7e0ec;
  --color-border-strong: #b7c5d8;
  --color-focus: #1e5aab;
  --color-shadow: rgba(11, 31, 58, 0.08);

  /* Feedback (forms) */
  --color-success: #1f7a4d;
  --color-error: #b42318;
  --color-warning: #9a6700;
}
```

**Usage rules**

- Primary blue is for CTAs, active states, links, and key icons — not large decorative fills except the closing CTA band and footer.
- Cyan is a **supporting** accent (logo, diagram nodes), never body text on white (contrast).
- Gradients only as a faint hero wash (`--color-bg` → `--color-bg-subtle`) or CTA band depth. No rainbow, no mesh blobs.
- No glassmorphism, blur overlays on text, or neon glow.

---

## 3. Typography

**Primary stack (implementation):** [Inter](https://fonts.google.com/specimen/Inter) via Google Fonts or self-hosted files.

```css
:root {
  --font-sans: "Inter", system-ui, -apple-system, "Segoe UI", sans-serif;
  --font-display: "Manrope", "Inter", system-ui, sans-serif; /* optional for H1 only */

  --fs-kicker: 0.75rem;    /* 12px */
  --fs-caption: 0.8125rem; /* 13px */
  --fs-body: 1rem;         /* 16px */
  --fs-lead: 1.125rem;     /* 18px */
  --fs-h3: 1.25rem;        /* 20px */
  --fs-h2: clamp(1.75rem, 2vw + 1rem, 2.25rem);
  --fs-h1: clamp(2.25rem, 4vw + 1rem, 3.5rem);

  --lh-tight: 1.15;
  --lh-heading: 1.25;
  --lh-body: 1.65;

  --fw-regular: 400;
  --fw-medium: 500;
  --fw-semibold: 600;
  --fw-bold: 700;

  --ls-kicker: 0.08em;
}
```

**Hierarchy**

| Role | Treatment |
|------|-----------|
| Kicker | Uppercase, medium, primary or muted, tracked |
| H1 | Display, bold, navy; optional blue emphasis on a second line |
| H2 | Semibold navy |
| Lead / body | Regular, secondary color for supporting copy |
| Button | Semibold 0.9375–1rem |
| Footer | Slightly smaller body on inverse |

Do not set type as images. Hero headline is live HTML.

---

## 4. Spacing, radius, elevation, breakpoints

```css
:root {
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-5: 1.5rem;
  --space-6: 2rem;
  --space-8: 3rem;
  --space-10: 4rem;
  --space-12: 5.5rem;

  --radius-sm: 8px;
  --radius-md: 12px;
  --radius-lg: 16px;
  --radius-pill: 999px;

  --shadow-sm: 0 1px 2px var(--color-shadow);
  --shadow-md: 0 8px 24px var(--color-shadow);
  --header-h: 4.5rem;

  --container: 72rem; /* 1152px */
  --gutter: clamp(1rem, 4vw, 2rem);
}

/* Breakpoints (min-width) */
/* sm 640 | md 768 | lg 1024 | xl 1200 | 2xl 1400 */
```

**Radius:** Cards 12–16px. Buttons 8–10px or slight rounding — not fully pill except small chips. Avoid “bubble” UI.

**Elevation:** One or two shadow steps only.

---

## 5. Components (spec)

### 5.1 Header

- Sticky, `z-index` above overlays except mobile drawer.
- At rest: white/translucent with 1px bottom border.
- Scrolled: opaque white + `--shadow-sm`.
- Logo, 8 links, search control, “Let’s Talk” solid button.
- Active link: navy + 2px primary underline or bar.
- Mobile: hamburger → right drawer, focus trap, Esc to close, close on link activate.
- Search: button with `aria-label="Search"`; panel or page stub.

### 5.2 Buttons

| Variant | Look | Use |
|---------|------|-----|
| Primary | Filled `--color-primary`, white text | Let’s Talk, Discuss, Start a Conversation |
| Secondary | White, navy text, `--color-border` | See Our Solutions, Contact |
| Ghost / text | Primary text + arrow | Learn more, Read case study |
| Inverse | White fill on blue/navy bands | CTA on accent sections |

States: hover (darken/translate-y 0), focus-visible ring, active press, `aria-busy` loading, success/error for forms. Min height 44px.

### 5.3 Problem cards

- Rendered from a JS data array (one source of truth).
- Role `button` or `tab` pattern with `aria-selected` / `aria-controls`.
- Default: white, icon, title, one-line hint.
- Selected: primary fill, white text, no extra bounce animation.
- Panel: title, description, benefit list, visual (SVG/CSS dashboard), CTA.

### 5.4 Service cards

- Data-driven grid.
- Icon (SVG), title, 1–2 line description, “Learn more”.
- Hover: border-color primary-soft, `--shadow-sm`, icon color shift. No scale > 1.02.

### 5.5 Hero architecture visual (original, not a photo collage)

Communicate:

`Business Challenge → Strategy → Software Development → Cloud Infrastructure → Deployment → Business Growth`

- SVG nodes + paths; dashed stroke animation only if motion is allowed.
- Hover/focus node: highlight node + connected edges + tooltip/card.
- Optional very slight parallax on pointer (desktop only, `matchMedia` hover + no reduced motion).
- Optional use of `images/header-video.mp4` as a **contained** muted media tile if the clip is appropriate — never as a full-bleed autoplay wall covering copy.

### 5.6 Forms

- Visible `<label>` (not placeholder-only).
- Newsletter: email + submit; validation for empty and invalid email.
- Inline error text associated with `aria-describedby`.
- Do not pretend a server saved the address unless a backend exists.

### 5.7 Footer

- Inverse navy.
- Brand blurb, social (placeholder URLs until official profiles exist), Company / Services / Industries, newsletter, legal.
- Copyright: `© 2026 Corelane Systems. All rights reserved.`

---

## 6. Motion

```css
:root {
  --ease-out: cubic-bezier(0.22, 1, 0.36, 1);
  --dur-fast: 150ms;
  --dur-med: 280ms;
}

@media (prefers-reduced-motion: reduce) {
  /* disable parallax, SVG dash, scroll-reveal transforms, video autoplay */
}
```

Allowed: opacity/transform reveals via Intersection Observer, header background change, drawer slide, node highlight, button state.

Forbidden: scroll hijacking, marquee noise, infinite attention-seeking pulses, layout-shifting animations.

---

## 7. Iconography and imagery

- Stroke SVG, 1.75–2px, 24px viewport, navy/primary.
- No random stock photography. Prefer CSS/SVG diagrams, dashboard wireframes we draw, and the existing local video/logo after review.
- If photography is added later, it must be licensed, on-message (engineering, operations, B2B), and free of embedded marketing text.
- Case study images: labeled placeholders until real projects exist.

---

## 8. Copy and honesty rules

- Editable HTML/JSON for all marketing strings.
- No invented clients, awards, certifications, or performance percentages.
- Demo case studies: prefix with “Sample project” or “Internal demonstration”.
- Trust chips under the hero: qualitative (“On-time delivery”, “Long-term support”) — not fake counts.
- Video CTA: only if a real video exists; do not claim “Watch 2 Min Video” unless the file is ~2 minutes and approved.

---

## 9. Accessibility

- Skip link to `#main`.
- `:focus-visible` outline 2px `--color-focus` offset 2px.
- Contrast AA for text and UI components.
- Cards and architecture nodes in tab order.
- `aria-expanded` on menu and accordion; `aria-controls` on problem tabs.
- `color-scheme: light` only.

---

## 10. CSS / JS architecture (to implement in later phases)

**CSS**

- `css/variables.css` — tokens  
- `css/base.css` — reset, type, links  
- `css/layout.css` — header, footer, containers, sections  
- `css/components.css` — buttons, cards, forms, hero visual  
- `css/animations.css` — keyframes; empty rules under reduced motion  
- `css/responsive.css` — breakpoint overrides  

**JS**

- `js/main.js` — boot  
- `js/navigation.js` — sticky, drawer, active states  
- `js/hero-interactions.js` — nodes, parallax  
- `js/problems.js` — data + selector  
- `js/services.js` — data + render  
- `js/animations.js` — IO reveals, reduced-motion check  
- Optional later: `js/forms.js`, `js/search.js`

Content objects live in JS modules (or a `js/data/` file) so HTML is not duplicated for each card.

Keep existing `images/` path unless a later phase explicitly migrates to `assets/images/` **without deleting** current files (copy first).
