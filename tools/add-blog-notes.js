const fs = require("fs");
const path = require("path");

const root = path.join(__dirname, "..", "pages");
const tpl = fs.readFileSync(path.join(root, "note-keep-wrap-replace.html"), "utf8");

const notes = [
  {
    file: "note-website-benefits.html",
    title: "Most Important Benefits of a Business Website | Corelane Systems",
    meta: "The practical benefits of a business website: a place people can find you, a clear offer, a destination for social and WhatsApp, and a foundation for later software. Editorial note — no invented traffic claims.",
    crumb: "Website benefits",
    kicker: "Websites",
    h1: "The Most Important Benefits of a Business Website",
    lead: "A website will not run your warehouse or your HR file. It will give customers, partners, and your own team a place that explains the offer and how to start — on a surface you control.",
    stem: "svc-web",
    alt: "Monitors showing a website layout. Not a live client site.",
    date: "2026-09-22",
    body: `<p>Businesses still ask whether a website is worth the work when WhatsApp, Instagram, and a marketplace already exist. Those channels matter. They are also rented. A website is the surface you own: the URL you print on a card, the page a referral can open, and the destination every other channel should point to.</p>
          <p>These are the benefits that actually show up in delivery. They are not ranking guarantees, lead-volume promises, or invented conversion rates.</p>
          <h2>1. People can find a stable address</h2>
          <p>When someone hears the company name, they need a place that still exists next month. A social profile can change layout, hide posts, or disappear from a search. A website with a clear domain is the address you can put on email signatures, proposals, and packaging.</p>
          <h2>2. You control the explanation of the offer</h2>
          <p>The first job of a business website is not animation. It is to say what you sell, who it is for, and how a conversation starts. If that explanation only lives in a salesperson&rsquo;s head or a PDF that nobody updates, the public story drifts. A site with a maintainable content structure lets the team change services, locations, and contact paths without waiting on a designer for every sentence.</p>
          <h2>3. Other channels have somewhere to land</h2>
          <p>Social posts, WhatsApp replies, and ads need a page that does more than repeat a caption. The site is where hours, services, process, and contact details can sit together. Without it, every enquiry restarts from zero in chat.</p>
          <h2>4. Trust has a place to live</h2>
          <p>A serious buyer looks for who you are, how you work, and how to reach you. That does not require fake testimonials or invented client logos. It does require a readable About, a real contact path, and copy that matches the work you actually take on. Empty hype is easy to spot. Clear process is not.</p>
          <h2>5. Later systems have a public front door</h2>
          <p>HRM platforms, education portals, and inventory systems are authenticated work. They still need a public face: login links, programme information, or a way to request access. Building the brochure after the portal is possible. Building a site that can grow into an application is cheaper than stretching a social page into software.</p>
          <h2>What a website is not</h2>
          <p>It is not an operations system. It will not track stock, calculate leave, or enrol learners by itself. If the pain is inside the building, you need software. If the pain is that nobody can explain the offer, you need a site. Mixing those two jobs in one brief is how projects stall.</p>
          <p>We do not claim a website will produce a stated number of leads. Search visibility takes structure, time, and honest pages. The benefit you can count on from day one is a clear, owned explanation of the business.</p>
          <p><a href="/pages/web-development.html">Website development</a> &middot; <a href="/pages/contact.html">Talk about a site</a> &middot; <a href="/pages/blog.html">All notes</a></p>`,
  },
  {
    file: "note-website-first-screen.html",
    title: "What a Business Website Must Explain First | Corelane Systems",
    meta: "What belongs on the first screen of a business website: the offer, who it is for, and how to start. Editorial note from Corelane Systems — not a ranking promise.",
    crumb: "First screen",
    kicker: "Websites",
    h1: "What a Business Website Must Explain First",
    lead: "If a first-time visitor cannot tell what you do, who it is for, and how to start, the rest of the site will not save the visit. That is an information problem, not a colour-palette problem.",
    stem: "svc-uiux",
    alt: "Desk with sketches and a tablet. Workplace atmosphere, not a shipped UI.",
    date: "2026-09-20",
    body: `<p>Teams often start a website project with a mood board. Useful, later. The first screen has three jobs: name the offer, name the audience, and name the next step. If those three sentences are missing, no amount of motion design will fix the bounce.</p>
          <p><strong>The offer.</strong> Write the work you actually take on, not a slogan that could belong to any firm. &ldquo;Digital transformation partner&rdquo; explains nothing. &ldquo;Custom software, websites, and operational systems for growing businesses&rdquo; at least points at a door.</p>
          <p><strong>Who it is for.</strong> A clinic administrator, a warehouse manager, and a school office do not need the same first paragraph. You can serve more than one audience. You cannot hide all of them behind a vague we.</p>
          <p><strong>How to start.</strong> A visible contact path beats a form buried under five sections. Email, phone, WhatsApp, or a form &mdash; pick what you will actually answer. A button that goes nowhere is worse than a plain address.</p>
          <p>Everything else &mdash; case studies, blog posts, service catalogues &mdash; supports those three lines. If you cannot publish named clients, say so and describe project types instead. Honesty on the first screen is a benefit. Invented logos are a liability.</p>
          <p><a href="/pages/note-website-benefits.html">Benefits of a business website</a> &middot; <a href="/pages/web-development.html">Website development</a> &middot; <a href="/pages/blog.html">All notes</a></p>`,
  },
  {
    file: "note-website-not-software.html",
    title: "A Website Is Not an Operations System | Corelane Systems",
    meta: "When you need a website versus HRM, inventory, or a portal. Corelane’s editorial note on keeping public pages and operational software as separate jobs.",
    crumb: "Website vs software",
    kicker: "Websites",
    h1: "A Website Is Not an Operations System",
    lead: "A public site explains the offer. HRM, inventory, and education portals run the work. Mixing those jobs in one brief is how a brochure turns into an unfinished product.",
    stem: "svc-webapps",
    alt: "Someone using a laptop in a meeting room. Screen content is not a named product.",
    date: "2026-09-18",
    body: `<p>A business website and a business system share a browser. That is where the similarity should stop. Visitors do not log in to read opening hours. Operators should not manage stock from a marketing theme.</p>
          <p>Use a <strong>website</strong> when the constraint is explanation: the offer is unclear, contact paths are scattered, or social channels have nowhere to land. Use <strong>software</strong> when the constraint is work: leave requests, stock counts, enrolment, or permissions that cannot live in a shared spreadsheet.</p>
          <p>We have built both. Stretching a public site into an HRM or inventory tool usually produces a login nobody trusts and a homepage nobody can edit. Building an operations system with no public front door leaves customers guessing how to reach you.</p>
          <p>The practical sequence is often: a clear site first if the offer cannot be stated; a system of record when the files inside the building are already failing. Those can ship in phases. They should not share a single vague sentence in the contract.</p>
          <p><a href="/pages/web-development.html">Websites</a> &middot; <a href="/pages/web-applications.html">Web applications</a> &middot; <a href="/pages/software-development.html">Custom software</a> &middot; <a href="/pages/blog.html">All notes</a></p>`,
  },
  {
    file: "note-inventory-without-spreadsheets.html",
    title: "When Inventory Leaves the Spreadsheet | Corelane Systems",
    meta: "Why inventory work outgrows spreadsheets: conflicting files, missed hand-offs, and no system of record. Editorial note — not a warehouse case study.",
    crumb: "Inventory systems",
    kicker: "Operations",
    h1: "When Inventory Leaves the Spreadsheet",
    lead: "A spreadsheet is a fine list. It is a poor system of record once more than one person must trust the same number on the same day.",
    stem: "svc-bizauto",
    alt: "Warehouse scanning used as atmosphere. Not a named client site.",
    date: "2026-09-15",
    body: `<p>Inventory problems rarely start as a software request. They start as two files that disagree, an order promised against stock that was already sold, or a warehouse count that only one person knows how to interpret.</p>
          <p>A dedicated inventory system does not magically create accuracy. It creates a <strong>place the number is supposed to live</strong>: item records, receiving, fulfilment, and a visible trail when something is adjusted. Integrations with orders or accounting matter only after that place exists.</p>
          <p>If the process is still changing every week, encode less, not more. Map the hand-offs first. Automate the stable steps. Leave exception paths in view. That is slower to advertise than a dashboard screenshot. It is closer to how stock actually moves.</p>
          <p>We do not publish SKU counts, throughput, or named warehouses here. The benefit you can discuss in a first conversation is whether the current file is still a list or already a liability.</p>
          <p><a href="/pages/work.html#inventory-management">Our inventory work</a> &middot; <a href="/pages/business-automation.html">Business automation</a> &middot; <a href="/pages/blog.html">All notes</a></p>`,
  },
  {
    file: "note-website-pages.html",
    title: "Pages a Business Website Actually Needs | Corelane Systems",
    meta: "Home, services, about, contact, and a few honest extras. What to publish first on a small business site — not a 40-page catalogue.",
    crumb: "Essential pages",
    kicker: "Websites",
    h1: "Pages a Business Website Actually Needs",
    lead: "A useful site is a short set of pages you can keep true. A long catalogue nobody updates is a liability.",
    stem: "svc-software",
    alt: "Hands at a workstation. Screen content is not a client product.",
    date: "2026-09-14",
    body: `<p>When a business asks for a website, the brief often arrives as a list of twenty pages. Most of those pages will not be maintained. Start with the pages that answer a real question, then add only what you will staff.</p>
          <p><strong>Home.</strong> The offer, who it is for, and how to start. That is the whole job of the first screen.</p>
          <p><strong>What you do.</strong> Services or products in language an operator would recognise. Separate pages help search and sales only if the copy is distinct. Duplicate paragraphs with swapped headings waste the crawl and the reader.</p>
          <p><strong>Who you are.</strong> An About that names how you work. No invented awards. If you cannot name clients, describe project types.</p>
          <p><strong>How to reach you.</strong> Email, phone, WhatsApp, hours, and a form you actually read. A map if people visit. Privacy and terms if you collect anything.</p>
          <p>Add a journal, work samples, or industry pages when the team can keep them current. Empty blog indexes and &ldquo;coming soon&rdquo; galleries train people to ignore the rest of the site.</p>
          <p><a href="/pages/note-website-benefits.html">Why a website still matters</a> &middot; <a href="/pages/web-development.html">Website development</a> &middot; <a href="/pages/blog.html">All notes</a></p>`,
  },
  {
    file: "note-website-contact.html",
    title: "A Contact Path People Will Actually Use | Corelane Systems",
    meta: "What belongs on a business contact page: channels you answer, honest hours, and a form that does not pretend to store mail it cannot send.",
    crumb: "Contact pages",
    kicker: "Websites",
    h1: "A Contact Path People Will Actually Use",
    lead: "A contact page is not a decoration. It is the last honest step after someone decided the offer might fit.",
    stem: "svc-consulting",
    alt: "A person at a glass whiteboard. Illustrative, not named staff.",
    date: "2026-09-13",
    body: `<p>Forms that vanish into a void, buttons that open the wrong app, and &ldquo;24/7 support&rdquo; copy on a five-person firm all do the same damage: the visitor stops trusting the rest of the site.</p>
          <p>Publish the channels you will answer this month. Email and WhatsApp are enough for many operations. Phone if someone will pick up. A form is useful when the question needs a written brief &mdash; if the form cannot be stored or emailed yet, say so on the page instead of showing a fake success state.</p>
          <p>Hours, city, and a named inbox beat a rotating carousel of stock photos. If you serve more than one country, say how you work across time zones. If you do not, do not imply a global floor you do not have.</p>
          <p>This site&rsquo;s contact form validates what you typed. It does not claim a ticket was filed until a backend exists. That is the standard we recommend for any brochure site: honest about the pipe, clear about the next human step.</p>
          <p><a href="/pages/contact.html">Contact Corelane</a> &middot; <a href="/pages/note-website-first-screen.html">First-screen copy</a> &middot; <a href="/pages/blog.html">All notes</a></p>`,
  },
];

function jsonEscape(s) {
  return s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');
}

function emit(note) {
  const url = "https://corelanesystems.com/pages/" + note.file;
  const json = JSON.stringify({
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "BlogPosting",
        url,
        headline: note.h1,
        description: note.meta,
        name: note.title,
        datePublished: note.date,
        inLanguage: "en",
        author: { "@type": "Organization", name: "Corelane Systems" },
        publisher: { "@type": "Organization", name: "Corelane Systems", url: "https://corelanesystems.com/" },
      },
      {
        "@type": "BreadcrumbList",
        itemListElement: [
          { position: 1, name: "Home", item: "https://corelanesystems.com/index.html", "@type": "ListItem" },
          { position: 2, name: "Blog", item: "https://corelanesystems.com/pages/blog.html", "@type": "ListItem" },
          { position: 3, name: note.crumb, item: url, "@type": "ListItem" },
        ],
      },
    ],
  });

  let h = tpl;
  h = h.replace(/<title>[\s\S]*?<\/title>/, "<title>" + note.title.replace(/&/g, "&amp;") + "</title>");
  h = h.replace(/<meta name="description" content="[^"]*" \/>/, '<meta name="description" content="' + note.meta.replace(/"/g, "&quot;") + '" />');
  h = h.replace(/<meta property="og:title" content="[^"]*" \/>/, '<meta property="og:title" content="' + note.title.replace(/&/g, "&amp;").replace(/"/g, "&quot;") + '" />');
  h = h.replace(/<meta property="og:description" content="[^"]*" \/>/, '<meta property="og:description" content="' + note.meta.replace(/"/g, "&quot;") + '" />');
  h = h.replace(/<meta property="og:url" content="[^"]*" \/>/, '<meta property="og:url" content="' + url + '" />');
  h = h.replace(/<meta name="twitter:title" content="[^"]*" \/>/, '<meta name="twitter:title" content="' + note.title.replace(/&/g, "&amp;").replace(/"/g, "&quot;") + '" />');
  h = h.replace(/<meta name="twitter:description" content="[^"]*" \/>/, '<meta name="twitter:description" content="' + note.meta.replace(/"/g, "&quot;") + '" />');
  h = h.replace(/<link rel="canonical" href="[^"]*" \/>/, '<link rel="canonical" href="' + url + '" />');
  h = h.replace(/<script type="application\/ld\+json">[\s\S]*?<\/script>/, '<script type="application/ld+json">' + json + "</script>");
  h = h.replace(/<meta property="og:type" content="website" \/>/, '<meta property="og:type" content="article" />');
  h = h.replace(
    /<li aria-current="page"><span>Keep, wrap, or replace<\/span><\/li>/,
    "<li aria-current=\"page\"><span>" + note.crumb + "</span></li>"
  );
  h = h.replace(/<p class="kicker">Delivery<\/p>/, '<p class="kicker">' + note.kicker + "</p>");
  h = h.replace(/<h1>Keep, Wrap, or Replace<\/h1>/, "<h1>" + note.h1 + "</h1>");
  h = h.replace(
    /<p class="lead">The first decision on an ageing system[\s\S]*?<\/p>/,
    '<p class="lead">' + note.lead + "</p>"
  );
  h = h.replace(/svc-consulting/g, note.stem);
  h = h.replace(/A person at a glass whiteboard\. Illustrative, not named staff\./g, note.alt);
  h = h.replace(/media-frame media-frame--people/g, "media-frame");
  h = h.replace(
    /<div class="container prose article-prose">[\s\S]*?<\/div>\s*<\/section>\s*<\/main>/,
    '<div class="container prose article-prose">\n          ' + note.body + "\n        </div>\n      </section>    </main>"
  );
  fs.writeFileSync(path.join(root, note.file), h);
  console.log("wrote", note.file);
}

notes.forEach(emit);
