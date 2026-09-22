const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "..");
const brand = "Corelane Systems";

const pages = {
  "index.html": {
    title: "Custom Software, Cloud & Digital Systems | Corelane Systems",
    meta: "Corelane Systems builds custom software, web and mobile apps, cloud infrastructure, data platforms, and business automation for growing companies. Talk to us about your operation.",
    h1: "Custom Software and Digital Systems for Real Business Problems",
    lead: "We design, build, and support software that matches how your teams work — custom development, cloud, data, automation, and integrations, with a long-term engineering mindset.",
  },
  "pages/about.html": {
    title: "About Corelane Systems | Software Engineering Company",
    meta: "Corelane Systems is a software engineering company. We design and build custom software, cloud, DevOps, data, and automation around how your business actually operates.",
    h1: "Software Engineering Built Around Your Business",
    lead: "Corelane Systems helps companies turn operational requirements into practical digital systems. We design, build, integrate, and support software that is easier to run and ready to grow.",
  },
  "pages/services.html": {
    title: "IT & Software Services | Corelane Systems",
    meta: "Browse 14 Corelane services: custom software, websites, web apps, mobile, cloud, DevOps, data, analytics, APIs, automation, UI/UX, social, and IT consulting.",
    h1: "Software, Cloud, Data, and IT Services",
    lead: "Fourteen services covering custom software, websites and apps, cloud and DevOps, data and analytics, automation, design, social programs, and advisory. Open the page that matches the work, or start from the operation.",
  },
  "pages/solutions.html": {
    title: "Business Technology Solutions | Corelane Systems",
    meta: "Start from the business problem. Corelane maps manual work, Excel chaos, inventory, websites, social, reporting, and legacy systems to software, automation, cloud, and data solutions.",
    h1: "Technology Solutions Built Around Business Problems",
    lead: "You do not need to pick a technology first. Describe the constraint. We help identify a practical path — custom software, automation, cloud, data, integrations, or social programs — based on how the operation actually runs.",
  },
  "pages/industries.html": {
    title: "Industry Software Solutions | Corelane Systems",
    meta: "Operational software for healthcare, e-commerce, manufacturing, real estate, education, logistics, and professional services. Same engineering practice, sector-specific workflows.",
    h1: "Software for Healthcare, Commerce, Manufacturing, and More",
    lead: "We apply the same delivery practice across sectors: map the workflow, design a system operators can run, and implement in phases. Photographs on this site are environmental scenes, not named customers.",
  },
  "pages/work.html": {
    title: "Our Work | Software Engineering Samples | Corelane Systems",
    meta: "See labelled sample work from Corelane Systems. Verified case studies will be published here when they are ready. No invented clients, logos, or performance statistics.",
    h1: "Software Engineering Work and Delivery Context",
    lead: "This page currently shows labelled sample photographs. When a verified case study is ready to publish, it will replace a sample card and be marked as such.",
  },
  "pages/process.html": {
    title: "Software Delivery Process | Corelane Systems",
    meta: "How Corelane delivers software: discovery, planning, design, development, testing, deployment, and support. A visible path from the first conversation to handover.",
    h1: "Software Delivery Process from Discovery to Support",
    lead: "Seven stages we actually describe to clients: understand the operation, plan in phases, design what can be built, implement in increments, test against the constraint, release with rollback in mind, and hand over with optional ongoing support.",
  },
  "pages/blog.html": {
    title: "Software & Operations Blog | Corelane Systems",
    meta: "Notes from Corelane Systems on custom software, operations, and delivery. Editorial essays on keep/wrap/replace, discovery, and visible handover — not client case studies.",
    h1: "Notes on Software, Operations, and Delivery",
    lead: "Short essays on how we think about custom software and operations. These are editorial notes, not client results, and they do not invent metrics.",
  },
  "pages/contact.html": {
    title: "Contact Corelane Systems | Software & IT Projects",
    meta: "Contact Corelane Systems about custom software, cloud, data, or automation. Use the form, email corelanesystem@gmail.com, or WhatsApp +92 301 2756091.",
    h1: "Talk to Corelane About Your Software Project",
    lead: "Describe the operational problem. We will discuss software, cloud, data, or automation — and a realistic sequence. Use the form, email, or WhatsApp. This static site validates the form in the browser and does not store messages yet.",
  },
  "pages/software-development.html": {
    title: "Custom Software Development | Corelane Systems",
    meta: "Custom software engineered around your operations: workflows, roles, and data that do not fit a spreadsheet or generic package. Phased delivery with handover.",
    h1: "Custom Software Development",
    lead: "We design and build applications around your rules, roles, and data — not a generic template with your logo. Fit for processes that have outgrown files, inboxes, or off-the-shelf tools.",
  },
  "pages/web-development.html": {
    title: "Website Development | Corelane Systems",
    meta: "Corporate and marketing websites with clear structure, accessibility, and performance. Corelane builds sites editors can maintain — without fake ranking promises.",
    h1: "Website Development",
    lead: "Public websites that explain your offer clearly and stay maintainable after launch. Information architecture, accessible front end, and a content structure that can support search over time.",
  },
  "pages/web-applications.html": {
    title: "Web Application Development | Corelane Systems",
    meta: "Secure web applications for internal teams, customers, and partners. Permissioned data, integrations with systems you already run, and a repeatable release path.",
    h1: "Web Application Development",
    lead: "Authenticated applications for operations, customers, or partners — with roles, a system of record, and integration to CRM, ERP, or custom APIs when those already exist.",
  },
  "pages/mobile-apps.html": {
    title: "Mobile App Development | iOS & Android | Corelane Systems",
    meta: "iOS and Android applications when the work belongs on a phone: field capture, approvals, or customer flows that are weaker in the browser. API-backed, not demo-only.",
    h1: "Mobile App Development for iOS and Android",
    lead: "Native or cross-platform apps when a mobile surface is the right way to do the work — not a listing that only mirrors a website with no operational reason.",
  },
  "pages/cloud-engineering.html": {
    title: "Cloud Engineering & Migration | Corelane Systems",
    meta: "Cloud architecture, migration, and operations you can explain and recover. Environments, access, observability, and cost hygiene as part of the engineering work.",
    h1: "Cloud Engineering and Migration",
    lead: "Cloud environments that can be deployed, observed, and explained — sequenced against operational risk, without unexplained spend or lock-in theatre.",
  },
  "pages/devops.html": {
    title: "DevOps & CI/CD | Corelane Systems",
    meta: "CI/CD, environments, and release engineering so delivery is repeatable. Build, test, promote, and roll back with documentation the next engineer can follow.",
    h1: "DevOps and Release Engineering",
    lead: "Repeatable build, test, and release paths so shipping software is not a heroic weekend activity. Environments, secrets, and rollback are part of the design.",
  },
  "pages/data-engineering.html": {
    title: "Data Engineering & Pipelines | Corelane Systems",
    meta: "Data pipelines that move operational data between systems of record, warehouses, and tools. Mappings you can audit, failures that surface instead of going silent.",
    h1: "Data Engineering",
    lead: "Reliable movement of data between the systems you already run, warehouses, and operational tools — with mappings you can audit and pipelines that fail loudly.",
  },
  "pages/data-analytics.html": {
    title: "Data Analytics & Reporting | Corelane Systems",
    meta: "Management reporting and dashboards with agreed metric definitions. Role-appropriate views and scheduled or live reporting — we do not invent historical KPIs on this site.",
    h1: "Data Analytics and Reporting",
    lead: "Defined metrics and dashboards managers can use. We agree definitions before charts, and we do not fabricate historical KPIs on this website.",
  },
  "pages/business-automation.html": {
    title: "Business Process Automation | Corelane Systems",
    meta: "Workflow automation for repetitive operations: process mapping, stable high-volume steps, human exception paths, and integrations so work does not bounce through email.",
    h1: "Business Process Automation",
    lead: "Remove copy-paste work where the process is stable enough to encode. We map the workflow first, then automate the steps that actually repeat.",
  },
  "pages/api-integration.html": {
    title: "API Integration Services | Corelane Systems",
    meta: "Connect the systems you already use with documented, monitored APIs. Contracts you can test, visible errors, and mapping between systems of record.",
    h1: "API Integration",
    lead: "Documented, monitored connections between the tools you already pay for — instead of fragile spreadsheet bridges and silent failure.",
  },
  "pages/ui-ux-design.html": {
    title: "UI/UX Design for Business Software | Corelane Systems",
    meta: "Interface and experience design for complex operational software. Flows for real exception cases, dense data, and handover to engineering — not a throwaway prototype.",
    h1: "UI/UX Design for Operational Software",
    lead: "Screens and flows that operators can learn. Design for exception cases and dense operational data, meant to be built — not a trend deck.",
  },
  "pages/ai-automation.html": {
    title: "AI and Workflow Automation | Corelane Systems",
    meta: "Practical automation and applied AI where the work is repetitive and checkable. Human review where risk is high. No claims of autonomous business miracles.",
    h1: "AI and Workflow Automation",
    lead: "We use automation and, where it is justified, applied AI on a specific workload. Human review stays where the risk is high. We do not claim autonomous business miracles.",
  },
  "pages/social-media.html": {
    title: "Social Media Management | Corelane Systems",
    meta: "Structured social media programs aligned to your website and offer. Publishing cadence, channel-appropriate creative, and simple activity reporting — not invented reach.",
    h1: "Social Media Management",
    lead: "A publishing plan that supports the brand and the website — cadence you can keep, channel-appropriate direction, and simple reporting on activity, not invented reach.",
  },
  "pages/it-consulting.html": {
    title: "IT Consulting & Architecture Advice | Corelane Systems",
    meta: "Independent IT consulting on build vs buy, keep/wrap/replace, vendor sequencing, and architecture operators can understand. Written advice you can take to another team.",
    h1: "IT Consulting",
    lead: "Independent guidance before you commit to a build: keep, wrap, or replace; vendor and sequencing advice; architecture that can be explained to the people who will run it.",
  },
  "pages/healthcare.html": {
    title: "Healthcare Software & Operations Systems | Corelane Systems",
    meta: "Operational software for healthcare organisations: scheduling, hand-offs, permissioned data, and integrations. Phased change that does not freeze the floor.",
    h1: "Healthcare Software and Operational Systems",
    lead: "Software for healthcare operations that are workflow-heavy and intolerant of silent failure: referral and scheduling, permissioned records, and integrations with systems already in use.",
    extra: "Healthcare work at Corelane starts from how the floor actually runs. We map hand-offs, design a system operators can use, and implement in phases so change does not freeze clinics or wards.",
  },
  "pages/ecommerce.html": {
    title: "E-Commerce Software & Order Operations | Corelane Systems",
    meta: "Catalog, order, stock, and integration software behind a storefront. Connect sales channels, fulfilment, and reporting purchasing can actually use.",
    h1: "E-Commerce Software and Order Operations",
    lead: "Storefronts fail in operations as often as they fail in design. We work on catalog, stock, orders, and the tools behind the website — including payment, fulfilment, or ERP connections when those already exist.",
    extra: "Typical work includes catalog and order flows, stock visibility across channels, integrations, and reporting purchasing can use. Photographs are fulfilment atmosphere, not a named warehouse.",
  },
  "pages/manufacturing.html": {
    title: "Manufacturing Software & Inventory Systems | Corelane Systems",
    meta: "Production, inventory, and plant-adjacent software. Work-order visibility, ERP integrations, and phased delivery that protects the floor.",
    h1: "Manufacturing Software and Inventory Systems",
    lead: "Plant-adjacent software has to respect the floor, the warehouse, and the systems that already record production. We build around inventory, work orders, and integrations you already run.",
    extra: "Typical themes: inventory and work-order visibility, integrations with plant or ERP tools, fewer spreadsheet control points, and phased delivery that protects production.",
  },
  "pages/real-estate.html": {
    title: "Real Estate Software & Property Operations | Corelane Systems",
    meta: "Software for property operations: listings, internal tools, and workflows for teams that manage inventory, enquiries, and delivery — not invented listing results.",
    h1: "Real Estate Software and Property Operations",
    lead: "Internal tools and operational software for property businesses: listings, enquiries, and the work behind the public site. Settings shown are illustrative, not live listings.",
    extra: "We map how listings, operations, and internal hand-offs actually run, then design a system the team can operate — including integrations with tools already in use.",
  },
  "pages/education.html": {
    title: "Education Software & Administration Systems | Corelane Systems",
    meta: "Program, learner, and administration systems for education providers. Operational software for enrolment, scheduling, and internal workflows.",
    h1: "Education Software and Administration Systems",
    lead: "Software for education operations: programs, learners, and administration. We start from how enrolment, scheduling, and internal hand-offs actually work.",
    extra: "Typical themes include programme and learner records, administration workflows, permissioned data, and integrations with systems the organisation already runs.",
  },
  "pages/logistics.html": {
    title: "Logistics Software & Tracking Systems | Corelane Systems",
    meta: "Software for movement, tracking, and partner integration in logistics operations. Visibility for shipments, docks, and the systems partners already use.",
    h1: "Logistics Software and Tracking Systems",
    lead: "Software for movement, tracking, and partner integration. We design around how goods, documents, and exceptions actually move — not a generic tracking widget.",
    extra: "Typical work: tracking and status visibility, partner integrations, operational hand-offs, and phased change that does not freeze the dock.",
  },
  "pages/professional-services.html": {
    title: "Professional Services Software | Corelane Systems",
    meta: "Delivery, resourcing, and client-operations software for firms that sell expertise. Tools for the work behind proposals, projects, and handover.",
    h1: "Software for Professional Services Firms",
    lead: "Operational software for firms that sell expertise and delivery: resourcing, client operations, and the systems behind proposals and projects.",
    extra: "We map how delivery, resourcing, and client work actually run, then build or integrate tools the practice can operate — without inventing named firm case studies here.",
  },
  "pages/note-keep-wrap-replace.html": {
    title: "Keep, Wrap, or Replace Legacy Software | Corelane Systems",
    meta: "How Corelane decides whether an ageing system should stay, be wrapped, or be retired. An editorial note on software modernisation — not a client case study.",
    h1: "Keep, Wrap, or Replace",
    lead: "The first decision on an ageing system is not which framework to buy. It is whether the current system should stay, be wrapped, or be retired.",
  },
  "pages/note-start-from-the-operation.html": {
    title: "Start Software Projects from Operations | Corelane Systems",
    meta: "Why Corelane starts software conversations from workflow and constraints, not from a technology shopping list. Editorial note on discovery.",
    h1: "Start from the Operation",
    lead: "A stack conversation without a map of the work is a shopping list. We start from the hand-offs, exceptions, and systems already in the building.",
  },
  "pages/note-visible-delivery.html": {
    title: "Visible Software Delivery | Corelane Systems",
    meta: "Why Corelane treats status, rollback, and handover as part of software delivery, not a slide after go-live. Editorial note on process.",
    h1: "Delivery You Can Explain",
    lead: "Status that only lives in a slide deck is not status. Phased work needs a path operators can follow when something fails.",
  },
  "pages/privacy.html": {
    title: "Privacy Policy | Corelane Systems",
    meta: "Privacy policy for the Corelane Systems website. How this static site treats contact details, cookies, and information you send by email or WhatsApp.",
  },
  "pages/terms.html": {
    title: "Terms of Service | Corelane Systems",
    meta: "Terms of use for the Corelane Systems website, including how service descriptions, sample photographs, and contact channels may be used.",
  },
  "pages/sitemap.html": {
    title: "Sitemap | Corelane Systems",
    meta: "HTML sitemap of Corelane Systems: services, industries, process, notes, and contact pages.",
  },
};

function firstReplace(html, re, repl) {
  return html.replace(re, repl);
}

function jsonEscape(s) {
  return s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');
}

function patch(file, cfg) {
  const p = path.join(root, file);
  let html = fs.readFileSync(p, "utf8");
  const title = cfg.title;
  const meta = cfg.meta;

  html = firstReplace(html, /<title>[\s\S]*?<\/title>/, `<title>${title}</title>`);
  html = firstReplace(
    html,
    /<meta\s+name="description"\s+content="[^"]*"\s*\/>/,
    `<meta name="description" content="${meta.replace(/"/g, "&quot;")}" />`
  );
  html = firstReplace(
    html,
    /<meta\s+property="og:title"\s+content="[^"]*"\s*\/>/,
    `<meta property="og:title" content="${title.replace(/"/g, "&quot;")}" />`
  );
  html = firstReplace(
    html,
    /<meta\s+property="og:description"\s+content="[^"]*"\s*\/>/,
    `<meta property="og:description" content="${meta.replace(/"/g, "&quot;")}" />`
  );

  const canon = html.match(/rel="canonical" href="([^"]+)"/);
  const url = canon ? canon[1] : "https://corelanesystems.com/";
  if (!html.includes('property="og:url"')) {
    html = html.replace(
      '<meta property="og:image" content="/images/opt/og.jpg" />',
      `<meta property="og:image" content="/images/opt/og.jpg" />
    <meta property="og:url" content="${url}" />
    <meta property="og:locale" content="en_US" />
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="${title.replace(/"/g, "&quot;")}" />
    <meta name="twitter:description" content="${meta.replace(/"/g, "&quot;")}" />`
    );
  }

  if (html.includes('"@graph"')) {
    html = html.replace(/"description":"[^"]*"/, `"description":"${jsonEscape(meta)}"`);
    html = html.replace(/"name":"[^"]*"/, `"name":"${jsonEscape(title)}"`);
  }

  if (cfg.h1) {
    html = firstReplace(html, /<h1>[\s\S]*?<\/h1>/, `<h1>${cfg.h1}</h1>`);
  }
  if (cfg.lead) {
    html = firstReplace(
      html,
      /(<h1>[\s\S]*?<\/h1>\s*)<p class="lead">[\s\S]*?<\/p>/,
      `$1<p class="lead">${cfg.lead}</p>`
    );
  }
  if (cfg.extra) {
    html = html.replace(
      /<p>We do not list invented customers, deployments, or outcomes here\.<\/p>/,
      `<p>${cfg.extra}</p>`
    );
  }

  fs.writeFileSync(p, html);
  console.log("seo", file);
}

for (const [file, cfg] of Object.entries(pages)) {
  patch(file, cfg);
}

console.log("done", Object.keys(pages).length);
