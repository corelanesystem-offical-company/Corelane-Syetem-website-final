$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$pages = Join-Path $root 'pages'
New-Item -ItemType Directory -Force -Path $pages | Out-Null
$utf8 = New-Object System.Text.UTF8Encoding $false
$origin = 'https://corelanesystems.com'

$head = @'
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
    <title>TITLE_TEXT | Corelane Systems</title>
    <meta name="description" content="META_TEXT" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="TITLE_TEXT | Corelane Systems" />
    <meta property="og:description" content="META_TEXT" />
    <meta property="og:image" content="/images/opt/og.jpg" />
    <meta name="theme-color" content="#ffffff" />
    <link rel="icon" href="/assets/logo/favicon.svg" type="image/svg+xml" />
    <link rel="apple-touch-icon" href="/images/opt/corelane-logo.png" />
    <link rel="manifest" href="/site.webmanifest" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Manrope:wght@700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/variables.css" />
    <link rel="stylesheet" href="/css/base.css" />
    <link rel="stylesheet" href="/css/layout.css" />
    <link rel="stylesheet" href="/css/components.css" />
    <link rel="stylesheet" href="/css/animations.css" />
    <link rel="stylesheet" href="/css/responsive.css?v=nav6" />
    <link rel="canonical" href="CANONICAL_PATH" />
    SCHEMA_BLOCK
  </head>
  <body>
    <a class="skip-link" href="#main">Skip to main content</a>
    <div class="nav-overlay"></div>
    <header class="site-header">
      <div class="site-header__inner">
        <a class="logo" href="/index.html">
          <img class="logo__img" src="/images/opt/corelane-logo.png" width="220" height="220" alt="Corelane Systems" />
        </a>
        <nav class="site-nav" id="primary-nav" aria-label="Primary">
          <ul class="site-nav__list">
            <li><a href="/index.html">Home</a></li>
            <li><a href="/pages/services.html">Services</a></li>
            <li><a href="/pages/solutions.html">Solutions</a></li>
            <li><a href="/pages/industries.html">Industries</a></li>
            <li><a href="/pages/work.html">Our Work</a></li>
            <li><a href="/pages/about.html">About</a></li>
            <li><a href="/pages/blog.html">Blog</a></li>
            <li><a href="/pages/contact.html">Contact</a></li>
          </ul>
        </nav>
        <div class="site-header__actions">
          <button class="icon-btn" type="button" data-search-open aria-label="Search">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><circle cx="11" cy="11" r="7" /><path d="M20 20l-3.2-3.2" stroke-linecap="round" /></svg>
          </button>
          <a class="btn btn--primary header-cta" href="/pages/contact.html">Let&rsquo;s Talk</a>
          <button class="icon-btn menu-toggle" type="button" aria-label="Open menu" aria-expanded="false" aria-controls="primary-nav">
            <span class="menu-toggle__box" aria-hidden="true"><span></span><span></span><span></span></span>
          </button>
        </div>
      </div>
    </header>
    <main id="main" class="site-main">
'@

$foot = @'
    </main>
    <footer class="site-footer">
      <div class="container site-footer__grid">
        <div class="site-footer__brand">
          <a class="logo" href="/index.html">
            <img class="logo__img" src="/images/opt/corelane-logo-white.png" width="220" height="220" alt="Corelane Systems" />
          </a>
          <p>Building digital systems for a clearer operation &mdash; software, cloud, data, and long-term support.</p>
          <ul class="social-chips">
            <li><a href="https://www.linkedin.com/company/corelane-system/" rel="noopener noreferrer" target="_blank">LinkedIn</a></li>
            <li><a href="https://www.instagram.com/corelanesystem/" rel="noopener noreferrer" target="_blank">Instagram</a></li>
            <li><a href="https://www.facebook.com/people/Corelane-Offical/61593068332489/" rel="noopener noreferrer" target="_blank">Facebook</a></li>
            <li><a href="https://wa.me/923012756091" rel="noopener noreferrer" target="_blank">WhatsApp</a></li>
            <li><a href="mailto:corelanesystem@gmail.com">Email</a></li>
          </ul>
        </div>
        <div>
          <h2 class="site-footer__heading">Company</h2>
          <ul class="site-footer__links">
            <li><a href="/pages/about.html">About Us</a></li>
            <li><a href="/pages/process.html">Process</a></li>
            <li><a href="/pages/blog.html">Blog</a></li>
            <li><a href="/pages/contact.html">Contact</a></li>
          </ul>
        </div>
        <div>
          <h2 class="site-footer__heading">Services</h2>
          <ul class="site-footer__links">
            <li><a href="/pages/software-development.html">Software Development</a></li>
            <li><a href="/pages/cloud-engineering.html">Cloud Engineering</a></li>
            <li><a href="/pages/devops.html">DevOps</a></li>
            <li><a href="/pages/it-consulting.html">IT Consulting</a></li>
          </ul>
        </div>
        <div>
          <h2 class="site-footer__heading">Industries</h2>
          <ul class="site-footer__links">
            <li><a href="/pages/healthcare.html">Healthcare</a></li>
            <li><a href="/pages/ecommerce.html">E-Commerce</a></li>
            <li><a href="/pages/manufacturing.html">Manufacturing</a></li>
            <li><a href="/pages/real-estate.html">Real Estate</a></li>
          </ul>
        </div>
      </div>
      <div class="container site-footer__legal">
        <p>&copy; 2026 Corelane Systems. All rights reserved.</p>
        <ul class="site-footer__legal-links">
          <li><a href="/pages/privacy.html">Privacy Policy</a></li>
          <li><a href="/pages/terms.html">Terms of Service</a></li>
          <li><a href="/pages/sitemap.html">Sitemap</a></li>
        </ul>
      </div>
    </footer>
    <div id="search-dialog" class="search-dialog" aria-hidden="true">
      <div class="search-dialog__panel" role="dialog" aria-labelledby="search-title">
        <div class="search-dialog__head">
          <h2 id="search-title">Search this site</h2>
          <span class="search-dialog__hint">Ctrl K</span>
          <button class="icon-btn" type="button" data-search-close aria-label="Close search">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18" stroke-linecap="round" /></svg>
          </button>
        </div>
        <label class="visually-hidden" for="site-search">Search pages</label>
        <input id="site-search" type="search" placeholder="Search services, industries, or notes" autocomplete="off" />
        <p class="search-dialog__note">Looks at this website only &mdash; not the open web.</p>
        <ul id="search-results"></ul>
      </div>
    </div>
    <script src="/js/data.js"></script>
    <script src="/js/navigation.js?v=nav6"></script>
    <script src="/js/services.js"></script>
    <script src="/js/animations.js"></script>
    <script src="/js/forms.js"></script>
    <script src="/js/main.js"></script>
  </body>
</html>
'@

function Crumbs($items) {
  if (-not $items -or $items.Count -lt 1) { return '' }
  $lis = for ($i = 0; $i -lt $items.Count; $i++) {
    $it = $items[$i]
    if ($i -eq $items.Count - 1) {
      "<li aria-current=`"page`"><span>$($it.n)</span></li>"
    } else {
      "<li><a href=`"$($it.h)`">$($it.n)</a></li>"
    }
  }
  return "<nav class=`"breadcrumbs`" aria-label=`"Breadcrumb`"><ol>$($lis -join '')</ol></nav>"
}

function PageCrumbs($file, $title) {
  $rootCrumb = @{ h = '/index.html'; n = 'Home' }
  $serviceFiles = @('software-development.html','web-development.html','web-applications.html','mobile-apps.html','cloud-engineering.html','devops.html','data-engineering.html','data-analytics.html','business-automation.html','api-integration.html','ui-ux-design.html','ai-automation.html','social-media.html','it-consulting.html')
  $industryFiles = @('healthcare.html','ecommerce.html','manufacturing.html','education.html','logistics.html','real-estate.html','professional-services.html')
  if ($serviceFiles -contains $file) {
    return @($rootCrumb, @{ h = '/pages/services.html'; n = 'Services' }, @{ n = $title })
  }
  if ($industryFiles -contains $file) {
    return @($rootCrumb, @{ h = '/pages/industries.html'; n = 'Industries' }, @{ n = $title })
  }
  if ($file.StartsWith('note-')) {
    return @($rootCrumb, @{ h = '/pages/blog.html'; n = 'Blog' }, @{ n = $title })
  }
  $map = @{
    'about.html' = @($rootCrumb, @{ n = 'About' })
    'services.html' = @($rootCrumb, @{ n = 'Services' })
    'solutions.html' = @($rootCrumb, @{ n = 'Solutions' })
    'industries.html' = @($rootCrumb, @{ n = 'Industries' })
    'work.html' = @($rootCrumb, @{ n = 'Our Work' })
    'process.html' = @($rootCrumb, @{ n = 'Process' })
    'blog.html' = @($rootCrumb, @{ n = 'Blog' })
    'contact.html' = @($rootCrumb, @{ n = 'Contact' })
    'privacy.html' = @($rootCrumb, @{ n = 'Privacy Policy' })
    'terms.html' = @($rootCrumb, @{ n = 'Terms of Service' })
    'sitemap.html' = @($rootCrumb, @{ n = 'Sitemap' })
  }
  return $map[$file]
}

function PageKind($file) {
  if ($file -eq 'contact.html') { return 'ContactPage' }
  if ($file -eq 'about.html') { return 'AboutPage' }
  $serviceFiles = @('software-development.html','web-development.html','web-applications.html','mobile-apps.html','cloud-engineering.html','devops.html','data-engineering.html','data-analytics.html','business-automation.html','api-integration.html','ui-ux-design.html','ai-automation.html','social-media.html','it-consulting.html')
  if ($serviceFiles -contains $file) { return 'Service' }
  return 'WebPage'
}

function SchemaBlock($title, $meta, $path, $crumbItems, $kind) {
  $list = @()
  $pos = 1
  foreach ($c in $crumbItems) {
    $entry = @{ '@type' = 'ListItem'; position = $pos; name = $c.n }
    if ($c.h) {
      $item = $c.h
      if ($item.StartsWith('/')) { $item = $origin + $item }
      $entry.item = $item
    } else { $entry.item = $path }
    $list += $entry
    $pos++
  }
  $page = @{
    '@type' = $kind
    name = if ($title -like 'Corelane Systems*') { $title } else { "$title | Corelane Systems" }
    description = $meta
    url = $path
  }
  if ($kind -eq 'Service') {
    $page.provider = @{ '@type' = 'Organization'; name = 'Corelane Systems' }
  }
  $graph = @{
    '@context' = 'https://schema.org'
    '@graph' = @(
      $page,
      @{ '@type' = 'BreadcrumbList'; itemListElement = $list }
    )
  }
  $json = $graph | ConvertTo-Json -Depth 8 -Compress
  return "<script type=`"application/ld+json`">$json</script>"
}

function Write-Page($file, $title, $meta, $body) {
  $path = "$origin/pages/$file"
  $crumbItems = PageCrumbs $file $title
  $crumbHtml = Crumbs $crumbItems
  if ($crumbHtml) {
    if ($body -match 'class="kicker"') {
      $body = [regex]::Replace($body, '<p class="kicker">', ($crumbHtml + '<p class="kicker">'), 1)
    } elseif ($body -match '<h1>') {
      $body = [regex]::Replace($body, '<h1>', ($crumbHtml + '<h1>'), 1)
    }
  }
  $schema = SchemaBlock $title $meta $path $crumbItems (PageKind $file)
  $html = $head.Replace('TITLE_TEXT', $title).Replace('META_TEXT', $meta).Replace('CANONICAL_PATH', $path).Replace('SCHEMA_BLOCK', $schema) + $body + $foot
  if ($file -eq 'about.html' -or $file -eq 'solutions.html') {
    $html = $html.Replace("$title | Corelane Systems", $title)
  }
  [System.IO.File]::WriteAllText((Join-Path $pages $file), $html, $utf8)
}

function MediaFigure($img, $alt, $contain, $people) {
  if (-not $img) { return '' }
  $cls = 'media-frame'
  if ($contain) { $cls += ' media-frame--contain' }
  if ($people) { $cls += ' media-frame--people' }
  $stem = [IO.Path]::GetFileNameWithoutExtension($img)
  $dir = ($img -replace '/[^/]+$', '')
  $jpg800 = "$dir/$stem-800.jpg"
  $webp = "$dir/$stem.webp"
  $webp800 = "$dir/$stem-800.webp"
  return @"
<figure class="$cls">
            <picture>
              <source type="image/webp" srcset="$webp800 800w, $webp 1600w" sizes="(max-width: 1023px) 100vw, 32rem" />
              <img src="$img" srcset="$jpg800 800w, $img 1600w" sizes="(max-width: 1023px) 100vw, 32rem" width="1600" height="894" alt="$alt" decoding="async" />
            </picture>
            <figcaption>$alt</figcaption>
          </figure>
"@
}

function Hero($kicker, $h1, $lead, $img, $alt, $contain, $people, $hideCtas) {
  $ctas = if ($hideCtas) { '' } else {
    @'
            <div class="btn-row">
              <a class="btn btn--primary" href="/pages/contact.html">Let&rsquo;s Talk</a>
              <a class="btn btn--secondary" href="/pages/services.html">View services</a>
            </div>
'@
  }
  if ($img) {
    $stem = $img -replace '\.jpg$',''
    @"
      <section class="page-hero page-hero--photo">
        <div class="page-hero__bg" aria-hidden="true">
          <picture>
            <source type="image/webp" srcset="${stem}-800.webp 800w, ${stem}.webp 1920w" sizes="100vw" />
            <img src="$img" srcset="${stem}-800.jpg 800w, $img 1920w" sizes="100vw" width="1920" height="1080" alt="" decoding="async" />
          </picture>
        </div>
        <div class="container page-hero__grid">
          <div>
            <p class="kicker">$kicker</p>
            <h1>$h1</h1>
            <p class="lead">$lead</p>
$ctas
          </div>
        </div>
      </section>
"@
  } else {
    @"
      <section class="page-hero">
        <div class="container page-hero__grid">
          <div>
            <p class="kicker">$kicker</p>
            <h1>$h1</h1>
            <p class="lead">$lead</p>
$ctas
          </div>
        </div>
      </section>
"@
  }
}

function CtaBand($title, $copy) {
  @"
      <section class="cta-band">
        <div class="container">
          <div>
            <h2>$title</h2>
            <p>$copy</p>
          </div>
          <a class="btn btn--inverse" href="/pages/contact.html">Start a conversation</a>
        </div>
      </section>
"@
}

function ServiceBody($intro, $includes, $related, $x) {
  $lis = ($includes | ForEach-Object { "<li>$_</li>" }) -join ''
  $rel = ($related | ForEach-Object {
    "<a class=`"card service-card`" href=`"$($_.href)`"><h3>$($_.t)</h3><p>$($_.d)</p><em>Learn more</em></a>"
  }) -join ''
  $who = ($x.who | ForEach-Object { "<li>$_</li>" }) -join ''
  $not = ($x.not | ForEach-Object { "<li>$_</li>" }) -join ''
  $deliver = ($x.deliver | ForEach-Object { "<li>$_</li>" }) -join ''
  $ask = ($x.ask | ForEach-Object { "<li>$_</li>" }) -join ''
  $more = $x.more
  @"
      <section class="section">
        <div class="container">
          <div class="prose service-copy">
            <p>$intro</p>
            $more
          </div>
          <div class="detail-blocks detail-blocks--3">
            <article class="card">
              <h2>This is a fit when</h2>
              <ul>$who</ul>
            </article>
            <article class="card">
              <h2>This is not</h2>
              <ul>$not</ul>
            </article>
            <article class="card">
              <h2>You typically leave with</h2>
              <ul>$deliver</ul>
            </article>
          </div>
          <div class="detail-blocks" style="margin-top: var(--space-4)">
            <article class="card">
              <h2>What the work usually covers</h2>
              <ul>$lis</ul>
            </article>
            <article class="card">
              <h2>How we start</h2>
              <p>We begin with the operational constraint, the systems you already run, and a keep / wrap / replace recommendation. Delivery follows the seven-stage path on the process page.</p>
              <p>Bring these to a first conversation:</p>
              <ul>$ask</ul>
              <p><a href="/pages/process.html">Read the delivery process</a></p>
            </article>
          </div>
        </div>
      </section>
      <section class="section section--subtle">
        <div class="container">
          <h2>Related services</h2>
          <div class="related-grid">$rel</div>
        </div>
      </section>
$(CtaBand 'Discuss this service' 'Describe the workflow that is failing. We will talk about scope, constraints, and a delivery path.')
"@
}

function IndustryBody($intro, $themes) {
  $lis = ($themes | ForEach-Object { "<li>$_</li>" }) -join ''
  @"
      <section class="section">
        <div class="container">
          <div class="prose">
            <p>$intro</p>
            <p>We do not list invented customers, deployments, or outcomes here.</p>
          </div>
          <div class="detail-blocks">
            <article class="card">
              <h2>Typical operational themes</h2>
              <ul>$lis</ul>
            </article>
            <article class="card">
              <h2>How Corelane shows up</h2>
              <p>The same engineering practice applies: map the constraint, design a system operators can run, and implement in phases. Sector language changes; the delivery path does not.</p>
              <p><a href="/pages/services.html">Browse the service catalog</a></p>
            </article>
          </div>
        </div>
      </section>
$(CtaBand 'Talk about this industry' 'Tell us how the operation actually runs today. We will discuss software, integrations, and a realistic sequence.')
"@
}

Write-Page 'about.html' 'Corelane Systems | About Our Technology &amp; Software Engineering Company' 'Learn how Corelane Systems helps businesses solve technology challenges through software engineering, cloud, DevOps, data, automation, and modern digital solutions.' @'
      <section class="page-hero page-hero--photo">
        <div class="page-hero__bg" aria-hidden="true">
          <picture>
            <source type="image/webp" srcset="/images/opt/about-hero-800.webp 800w, /images/opt/about-hero.webp 1920w" sizes="100vw" />
            <img src="/images/opt/about-hero.jpg" srcset="/images/opt/about-hero-800.jpg 800w, /images/opt/about-hero.jpg 1920w" sizes="100vw" width="1920" height="1080" alt="" decoding="async" />
          </picture>
        </div>
        <div class="container page-hero__grid">
          <div>
            <p class="kicker">About Corelane Systems</p>
            <h1>Technology Built Around Your Business.</h1>
            <p class="lead">Corelane Systems is a technology and software engineering company helping businesses turn complex requirements into practical, reliable digital solutions. We design, build, integrate, and support technology that makes businesses easier to operate and ready to grow.</p>
            <div class="btn-row">
              <a class="btn btn--primary" href="/pages/contact.html">Let&rsquo;s Talk</a>
              <a class="btn btn--secondary" href="/pages/services.html">Explore Our Services</a>
            </div>
          </div>
        </div>
      </section>
      <section class="section" id="who-we-are">
        <div class="container split">
          <div>
            <p class="kicker">Who we are</p>
            <h2>We Build Technology That Works in the Real World.</h2>
            <p>Businesses do not need more technology for the sake of technology. They need systems that solve real problems, connect the right processes, and help their teams work more effectively.</p>
            <p>At Corelane Systems, we work with businesses to understand their challenges, identify the right technology approach, and build solutions around the way they actually operate.</p>
            <p>From custom software and web applications to cloud infrastructure, DevOps, data, and automation, we bring different areas of technology together to create practical digital systems.</p>
          </div>
          <figure class="media-frame">
            <picture>
              <source type="image/webp" srcset="/images/opt/work-800.webp 800w, /images/opt/work.webp 1600w" sizes="(max-width: 1023px) 100vw, 36rem" />
              <img src="/images/opt/work.jpg" srcset="/images/opt/work-800.jpg 800w, /images/opt/work.jpg 1600w" sizes="(max-width: 1023px) 100vw, 36rem" width="1600" height="894" alt="Hands at a keyboard in front of a monitor and laptop. Screen content is not a client product." loading="lazy" decoding="async" />
            </picture>
            <figcaption>Hands at a keyboard in front of a monitor and laptop. Screen content is not a client product.</figcaption>
          </figure>
        </div>
      </section>
      <section class="section section--subtle" id="what-we-do">
        <div class="container">
          <div class="section-head">
            <div class="prose">
              <p class="kicker">What we do</p>
              <h2>From Business Problems to Working Systems.</h2>
              <p>Every project starts with understanding the problem.</p>
              <p>We look at your existing processes, systems, data, and goals before deciding what should be built. Sometimes the right answer is a new application. Sometimes it is automation, integration, modernization, better infrastructure, or a combination of technologies.</p>
              <p>Our role is to find the right approach and turn it into technology your business can actually use.</p>
            </div>
          </div>
          <ul class="about-points">
            <li>Understand the business problem</li>
            <li>Design the right technical approach</li>
            <li>Build reliable digital solutions</li>
            <li>Connect systems and data</li>
            <li>Automate repetitive processes</li>
            <li>Deploy and maintain technology</li>
            <li>Improve systems as the business evolves</li>
          </ul>
        </div>
      </section>
      <section class="section" id="technology-approach">
        <div class="container">
          <div class="section-head">
            <div class="prose">
              <p class="kicker">Technology approach</p>
              <h2>Engineering With Purpose.</h2>
              <p>We believe good technology should be understandable, maintainable, secure, and capable of evolving with the business.</p>
              <p>Our approach combines software engineering, cloud technologies, DevOps, data, automation, and modern development practices to create systems that are built for real operational needs.</p>
            </div>
          </div>
          <div class="detail-blocks detail-blocks--3">
            <article class="card"><h3>Software Engineering</h3><p>Custom applications and business software designed around your requirements.</p><p><a href="/pages/software-development.html">Software development</a></p></article>
            <article class="card"><h3>Cloud &amp; Infrastructure</h3><p>Scalable and reliable cloud environments designed for modern applications.</p><p><a href="/pages/cloud-engineering.html">Cloud engineering</a></p></article>
            <article class="card"><h3>DevOps</h3><p>Automation, CI/CD, infrastructure, monitoring, and reliable software delivery.</p><p><a href="/pages/devops.html">DevOps</a></p></article>
            <article class="card"><h3>Data &amp; Analytics</h3><p>Data pipelines, integrations, dashboards, and analytics that turn information into useful insight.</p><p><a href="/pages/data-analytics.html">Data analytics</a></p></article>
            <article class="card"><h3>Automation</h3><p>Connected workflows that reduce repetitive work and improve operational efficiency.</p><p><a href="/pages/business-automation.html">Business automation</a></p></article>
            <article class="card"><h3>Integration</h3><p>APIs and system integrations that help your technology work together instead of operating in isolation.</p><p><a href="/pages/api-integration.html">API integration</a></p></article>
            <article class="card"><h3>Social Media Management</h3><p>Structured publishing and brand presence across the channels you need.</p><p><a href="/pages/social-media.html">Social media</a></p></article>
          </div>
        </div>
      </section>
      <section class="section section--subtle" id="how-we-think">
        <div class="container split">
          <figure class="media-frame">
            <picture>
              <source type="image/webp" srcset="/images/opt/solution-800.webp 800w, /images/opt/solution.webp 1600w" sizes="(max-width: 1023px) 100vw, 36rem" />
              <img src="/images/opt/solution.jpg" srcset="/images/opt/solution-800.jpg 800w, /images/opt/solution.jpg 1600w" sizes="(max-width: 1023px) 100vw, 36rem" width="1600" height="894" alt="A quiet executive boardroom with a walnut table and city view. Atmospheric photograph, not a named office." loading="lazy" decoding="async" />
            </picture>
            <figcaption>A quiet executive boardroom with a walnut table and city view. Atmospheric photograph, not a named office.</figcaption>
          </figure>
          <div>
            <p class="kicker">How we think</p>
            <h2>Technology Should Simplify, Not Complicate.</h2>
            <p>We focus on practical solutions rather than unnecessary complexity.</p>
            <p>Before introducing another tool or platform, we look at the underlying business problem. We consider what already exists, what can be improved, what needs to be replaced, and how the solution will operate after it goes live.</p>
            <p>The result should be technology that fits the business &mdash; not a business forced to fit the technology.</p>
          </div>
        </div>
      </section>
      <section class="section" id="principles">
        <div class="container">
          <div class="section-head">
            <div>
              <p class="kicker">Our principles</p>
              <h2>The Principles Behind Our Work</h2>
            </div>
          </div>
          <div class="detail-blocks detail-blocks--3">
            <article class="card"><h3>Business First</h3><p>Technology decisions should support real business objectives.</p></article>
            <article class="card"><h3>Clarity</h3><p>We keep requirements, communication, architecture, and delivery understandable.</p></article>
            <article class="card"><h3>Engineering Quality</h3><p>We build with maintainability, reliability, security, and scalability in mind.</p></article>
            <article class="card"><h3>Practical Innovation</h3><p>We use modern technology where it creates meaningful value &mdash; not simply because it is new.</p></article>
            <article class="card"><h3>Long-Term Thinking</h3><p>A successful solution should continue to work as the business changes and grows.</p></article>
            <article class="card"><h3>Continuous Improvement</h3><p>Technology is not finished at launch. We improve systems based on real usage, feedback, and changing requirements.</p></article>
          </div>
        </div>
      </section>
      <section class="section section--subtle" id="client-approach">
        <div class="container split">
          <div>
            <p class="kicker">How we work with clients</p>
            <h2>A Technology Partner, Not Just a Vendor.</h2>
            <p>We believe the best digital solutions come from collaboration.</p>
            <p>We work closely with business owners, teams, and stakeholders to understand what matters, make technical decisions clear, and move from idea to implementation in practical stages.</p>
            <p>Whether you are starting something new, modernizing an existing system, or trying to automate a manual process, we focus on creating a solution that makes sense for your business today and can evolve tomorrow.</p>
          </div>
          <figure class="media-frame media-frame--people">
            <picture>
              <source type="image/webp" srcset="/images/opt/contact-800.webp 800w, /images/opt/contact.webp 1600w" sizes="(max-width: 1023px) 100vw, 36rem" />
              <img src="/images/opt/contact.jpg" srcset="/images/opt/contact-800.jpg 800w, /images/opt/contact.jpg 1600w" sizes="(max-width: 1023px) 100vw, 36rem" width="1600" height="894" alt="Two people in a meeting reviewing a laptop. People shown are illustrative, not named staff." loading="lazy" decoding="async" />
            </picture>
            <figcaption>Two people in a meeting reviewing a laptop. People shown are illustrative, not named staff.</figcaption>
          </figure>
        </div>
      </section>
      <section class="section" id="process">
        <div class="container">
          <div class="section-head">
            <div class="prose">
              <p class="kicker">Development process</p>
              <h2>From Understanding to Implementation.</h2>
            </div>
            <a class="btn btn--ghost" href="/pages/process.html">Full process page</a>
          </div>
          <ol class="process-steps process-steps--6">
            <li><h3>Discover</h3><p>Understand your business, challenges, requirements, and existing technology.</p></li>
            <li><h3>Plan</h3><p>Define the solution, technical approach, priorities, and delivery roadmap.</p></li>
            <li><h3>Design</h3><p>Create the user experience, architecture, workflows, and system structure.</p></li>
            <li><h3>Build</h3><p>Develop, integrate, test, and refine the solution in practical stages.</p></li>
            <li><h3>Deploy</h3><p>Move the solution into a reliable production environment.</p></li>
            <li><h3>Improve</h3><p>Monitor, maintain, optimize, and evolve the system as your needs change.</p></li>
          </ol>
        </div>
      </section>
      <section class="cta-band">
        <div class="container">
          <div>
            <h2>Let&rsquo;s Build Something That Matters.</h2>
            <p>Have a business problem, a new idea, or an existing system that needs to evolve? Tell us what you are trying to achieve. We will help you explore the technology, approach, and next steps needed to turn it into a working solution.</p>
          </div>
          <div class="btn-row">
            <a class="btn btn--inverse" href="/pages/contact.html">Start a Conversation</a>
            <a class="btn btn--secondary" href="/pages/services.html">Explore Our Services</a>
          </div>
        </div>
      </section>
'@

Write-Page 'services.html' 'Services' 'Software development, cloud, DevOps, data, automation, design, and IT consulting from Corelane Systems.' (
  (Hero 'Services' 'A full engineering practice, not a single product' 'Fourteen services across software, cloud, data, automation, design, and advisory. Pick the page that matches the constraint &mdash; or start with the operation and we will map it.' $null $null $false $false $true) + @'
      <section class="section">
        <div class="container">
          <div class="prose service-copy">
            <h2>How to use this catalog</h2>
            <p>Corelane Systems is not a single product. The list below is the work we actually take on. Each card opens a page that says what the engagement covers, when it is a fit, and what it is not.</p>
            <p>If you already know the constraint &mdash; a public site that cannot explain the offer, an internal process stuck in spreadsheets, a cloud bill nobody can defend &mdash; open that service. If you do not, start on <a href="/pages/contact.html">Contact</a> or read <a href="/pages/process.html">how delivery is sequenced</a>.</p>
            <div class="btn-row">
              <a class="btn btn--primary" href="/pages/contact.html">Let&rsquo;s Talk</a>
              <a class="btn btn--secondary" href="/pages/process.html">View process</a>
            </div>
          </div>
          <div class="detail-blocks detail-blocks--3">
            <article class="card">
              <h3>Software and product</h3>
              <p>Custom software, websites, web applications, mobile apps, and interface design. Choose these when the work needs a system people log into, not only a brochure.</p>
            </article>
            <article class="card">
              <h3>Cloud, data, and release</h3>
              <p>Cloud engineering, DevOps, data pipelines, analytics, APIs, and automation. Choose these when the problem is movement of data, environments, or repetitive operational steps.</p>
            </article>
            <article class="card">
              <h3>Growth and advice</h3>
              <p>Social programs aligned to the site, and IT consulting when the first question is build vs buy, sequence, or whether to automate at all.</p>
            </article>
          </div>
        </div>
      </section>
      <section class="section section--subtle">
        <div class="container">
          <h2>Service catalog</h2>
          <p class="lead">Fourteen pages. Photographs are workplace atmosphere, not client offices. Copy on each page is the source of truth.</p>
          <div id="service-catalog" class="service-grid"></div>
        </div>
      </section>
      <section class="section">
        <div class="container">
          <div class="prose service-copy">
            <h2>What we will not write here</h2>
            <p>These pages do not invent client names, headcount, awards, or percentage improvements. When a verified case study exists, it will be labelled as such on the work page.</p>
            <p>Related services on each detail page are suggestions, not a bundle you have to buy. One constraint often maps to two services; that is a sequencing question, not an upsell script.</p>
          </div>
        </div>
      </section>
'@ + (CtaBand 'Not sure which service you need?' 'Describe the operational problem. We will map it to software, cloud, data, or advisory work.')
)

# Solutions is maintained in pages/solutions.html so this generator does not revert it.

Write-Page 'industries.html' 'Industries' 'Software and systems for healthcare, commerce, manufacturing, professional services, and related operations.' (
  (Hero 'Industries' 'Sector context without invented client lists' 'Each industry has its own photograph. These are environmental scenes, not named customers.' $null $null $false $false $false) + @'
      <section class="section">
        <div class="container">
          <div id="industry-grid" class="industry-grid"></div>
        </div>
      </section>
'@
)

Write-Page 'work.html' 'Our Work' 'Sample and demonstration project visuals from Corelane Systems. Not client results.' (
  (Hero 'Our work' 'Demonstration work until verified case studies land' 'Cards on this page are labelled samples. They do not represent named clients, revenue, or performance statistics.' '/images/opt/work.jpg' 'Hands at a keyboard in front of a monitor and laptop. Screen content is not a client product.' $false $false $false) + @'
      <section class="section section--subtle">
        <div class="container">
          <div id="work-grid" class="work-grid"></div>
        </div>
      </section>
'@ + (CtaBand 'Have a live system to discuss?' 'When we can publish a verified case study, it will replace a sample card. Until then, talk to us about the operation you run today.')
)

Write-Page 'process.html' 'Process' 'Corelane Systems delivery: discovery, planning, design, development, testing, deployment, and support.' (
  (Hero 'Delivery' 'A visible path from discovery to support' 'The photograph nearby is a meeting room used as atmosphere. The numbered steps on this page are the process we actually describe to clients.' '/images/opt/solution.jpg' 'A quiet executive boardroom with a walnut table and city view. Atmospheric photograph, not a named office.' $false $false $false) + @'
      <section class="section">
        <div class="container">
          <ol class="process-steps">
            <li><h3>Discovery</h3><p>Understand the operation, constraints, and success criteria before choosing tools.</p></li>
            <li><h3>Planning</h3><p>Phased scope, risks, and architecture choices that can survive contact with reality.</p></li>
            <li><h3>Design</h3><p>Experience, data, and technical design that can be built and operated.</p></li>
            <li><h3>Development</h3><p>Iterative implementation with visible increments instead of a big-bang reveal.</p></li>
            <li><h3>Testing</h3><p>Functional, integration, and acceptance checks against the original constraint.</p></li>
            <li><h3>Deployment</h3><p>Controlled release onto the agreed environment, with rollback in mind.</p></li>
            <li><h3>Support</h3><p>Handover, documentation, and optional ongoing engineering.</p></li>
          </ol>
        </div>
      </section>
'@ + (CtaBand 'Walk this path on a real problem' 'Bring the constraint. We will talk about which stage you are actually in.')
)

Write-Page 'blog.html' 'Blog' 'Notes from Corelane Systems on software, operations, and delivery. Editorial essays, not client case studies.' (
  (Hero 'Journal' 'Notes from the practice' 'Short essays on how we think about software and operations. These are not client results, and they do not invent metrics.' $null $null $false $false $true) + @'
      <section class="section">
        <div class="container">
          <div class="blog-grid">
            <a class="blog-card" href="/pages/note-keep-wrap-replace.html">
              <div class="media-frame"><picture>
                <source type="image/webp" srcset="/images/opt/svc-consulting-800.webp 800w, /images/opt/svc-consulting.webp 1600w" sizes="(max-width: 639px) 100vw, 22rem" />
                <img src="/images/opt/svc-consulting.jpg" srcset="/images/opt/svc-consulting-800.jpg 800w, /images/opt/svc-consulting.jpg 1600w" width="1600" height="894" alt="" loading="lazy" decoding="async" />
              </picture></div>
              <div class="blog-card__body">
                <p class="blog-card__meta"><time datetime="2026-09-12">12 September 2026</time> &middot; Delivery</p>
                <h2>Keep, wrap, or replace</h2>
                <p>The first decision on an ageing system is not which framework to buy. It is whether the current system should stay, be wrapped, or be retired.</p>
                <em>Read note</em>
              </div>
            </a>
            <a class="blog-card" href="/pages/note-start-from-the-operation.html">
              <div class="media-frame"><picture>
                <source type="image/webp" srcset="/images/opt/svc-software-800.webp 800w, /images/opt/svc-software.webp 1600w" sizes="(max-width: 639px) 100vw, 22rem" />
                <img src="/images/opt/svc-software.jpg" srcset="/images/opt/svc-software-800.jpg 800w, /images/opt/svc-software.jpg 1600w" width="1600" height="894" alt="" loading="lazy" decoding="async" />
              </picture></div>
              <div class="blog-card__body">
                <p class="blog-card__meta"><time datetime="2026-09-08">8 September 2026</time> &middot; Discovery</p>
                <h2>Start from the operation</h2>
                <p>A stack conversation without a map of the work is a shopping list. We start from the hand-offs, exceptions, and systems already in the building.</p>
                <em>Read note</em>
              </div>
            </a>
            <a class="blog-card" href="/pages/note-visible-delivery.html">
              <div class="media-frame"><picture>
                <source type="image/webp" srcset="/images/opt/svc-devops-800.webp 800w, /images/opt/svc-devops.webp 1600w" sizes="(max-width: 639px) 100vw, 22rem" />
                <img src="/images/opt/svc-devops.jpg" srcset="/images/opt/svc-devops-800.jpg 800w, /images/opt/svc-devops.jpg 1600w" width="1600" height="894" alt="" loading="lazy" decoding="async" />
              </picture></div>
              <div class="blog-card__body">
                <p class="blog-card__meta"><time datetime="2026-09-01">1 September 2026</time> &middot; Process</p>
                <h2>Delivery you can explain</h2>
                <p>Status that only lives in a slide deck is not status. Phased work needs a path operators can follow when something fails.</p>
                <em>Read note</em>
              </div>
            </a>
          </div>
        </div>
      </section>
'@
)

Write-Page 'note-keep-wrap-replace.html' 'Keep, wrap, or replace' 'How Corelane Systems decides whether an ageing system should stay, be wrapped, or be retired. Editorial note, not a case study.' (
  (Hero 'Delivery' 'Keep, wrap, or replace' '12 September 2026. An editorial note on the first decision in a modernization conversation. Not a client result.' '/images/opt/svc-consulting.jpg' 'A person at a glass whiteboard. Illustrative, not named staff.' $false $true $true) + @'
      <section class="section">
        <div class="container prose article-prose">
          <p>Teams often arrive with a preferred platform already in mind. The more useful first question is what the current system is still good at, and what it can no longer change safely.</p>
          <p><strong>Keep</strong> when the system of record is stable, understood, and the pain is around the edges: reporting, hand-offs, or a missing interface. Rewriting a working core because the UI is dated is usually more expensive than it looks.</p>
          <p><strong>Wrap</strong> when the core must stay, but people cannot work through it anymore. APIs, a thinner application on top, and a documented contract let you move without a big-bang cutover.</p>
          <p><strong>Replace</strong> when the model itself is wrong: data you cannot trust, rules that live in one person&rsquo;s head, or a vendor path that has already ended. Replacement still needs a sequence. Operations do not pause for a greenfield demo.</p>
          <p>None of these options is a slogan. They are a written recommendation with risks attached. If you cannot explain the choice to the people who run the floor, it is not ready.</p>
          <p><a href="/pages/process.html">How we sequence delivery</a> &middot; <a href="/pages/blog.html">All notes</a></p>
        </div>
      </section>
'@
)

Write-Page 'note-start-from-the-operation.html' 'Start from the operation' 'Why Corelane Systems starts software conversations from workflow and constraints, not from a technology shopping list.' (
  (Hero 'Discovery' 'Start from the operation' '8 September 2026. Editorial note on discovery. Not a client workshop and not a named engagement.' '/images/opt/svc-software.jpg' 'Night workstation with a wide monitor. Not a client product.' $false $false $true) + @'
      <section class="section">
        <div class="container prose article-prose">
          <p>Software fails in the gaps between teams as often as it fails in the code. Discovery that only lists desired features will miss the exception path: the spreadsheet that actually closes the month, the inbox that is the real ticket system, the person who still has to approve every exception by phone.</p>
          <p>We ask what happens on a bad day. Who notices. Which system is believed when two numbers disagree. What must not break during a change. Those answers decide whether you need a website, an application, an integration, or advice to wait.</p>
          <p>The catalog on this site exists so you can see the kinds of work we do. It is not a menu to order from in the first meeting. The operation decides the shape.</p>
          <p><a href="/pages/contact.html">Describe the constraint</a> &middot; <a href="/pages/blog.html">All notes</a></p>
        </div>
      </section>
'@
)

Write-Page 'note-visible-delivery.html' 'Delivery you can explain' 'Why Corelane Systems treats status, rollback, and handover as part of delivery, not as a slide after go-live.' (
  (Hero 'Process' 'Delivery you can explain' '1 September 2026. Editorial note on delivery hygiene. Not a performance claim.' '/images/opt/svc-devops.jpg' 'Operations monitors with out-of-focus terminals. Not a client SOC.' $false $false $true) + @'
      <section class="section">
        <div class="container prose article-prose">
          <p>A plan that only exists in a deck will not survive the first production incident. Delivery needs a path people can point at: what is in this phase, what is not, how you promote a change, and how you roll it back.</p>
          <p>That does not require a theatrical DevOps programme. It requires environments you can name, tests that match the original constraint, and handover that is not a folder of screenshots. The seven stages on our process page are the skeleton. The flesh is the written status the operator can use on a Monday morning.</p>
          <p>We would rather ship a smaller increment that can be explained than a large release that only the project team understands.</p>
          <p><a href="/pages/process.html">The seven stages</a> &middot; <a href="/pages/blog.html">All notes</a></p>
        </div>
      </section>
'@
)

Write-Page 'contact.html' 'Contact' 'Start a conversation with Corelane Systems about software, cloud, data, or automation work.' (
  (Hero 'Contact' 'Tell us the problem. We will talk about the system.' 'Use the form, email, or WhatsApp. Submissions are validated in the browser; this static site does not store messages yet.' '/images/opt/contact.jpg' 'Two people in a meeting reviewing a laptop. People shown are illustrative, not named staff.' $false $true $true) + @'
      <section class="section section--subtle">
        <div class="container contact-grid">
          <form class="form card" data-validate>
            <div class="form-row">
              <div>
                <label for="contact-name">Name</label>
                <input id="contact-name" name="name" required autocomplete="name" />
              </div>
              <div>
                <label for="contact-email">Email</label>
                <input id="contact-email" name="email" type="email" required autocomplete="email" />
              </div>
            </div>
            <div>
              <label for="contact-company">Company</label>
              <input id="contact-company" name="company" autocomplete="organization" />
            </div>
            <div>
              <label for="contact-message">How can we help?</label>
              <textarea id="contact-message" name="message" required></textarea>
            </div>
            <div class="form-actions">
              <button class="btn btn--primary" type="submit">Send message</button>
            </div>
            <p class="form-status" role="status" aria-live="polite"></p>
          </form>
          <aside class="contact-aside">
            <article class="card contact-channel">
              <p class="contact-channel__label">Email</p>
              <a class="contact-channel__value" href="mailto:corelanesystem@gmail.com">corelanesystem@gmail.com</a>
              <p class="contact-channel__hint">Prefer mail? Write this address directly.</p>
            </article>
            <article class="card contact-channel">
              <p class="contact-channel__label">WhatsApp</p>
              <a class="contact-channel__value" href="https://wa.me/923012756091" rel="noopener noreferrer" target="_blank">+92 301 2756091</a>
              <p class="contact-channel__hint">Fastest way to start a first conversation.</p>
            </article>
            <article class="card contact-channel">
              <p class="contact-channel__label">Social</p>
              <ul class="social-chips">
                <li><a href="https://www.linkedin.com/company/corelane-system/" rel="noopener noreferrer" target="_blank">LinkedIn</a></li>
                <li><a href="https://www.instagram.com/corelanesystem/" rel="noopener noreferrer" target="_blank">Instagram</a></li>
                <li><a href="https://www.facebook.com/people/Corelane-Offical/61593068332489/" rel="noopener noreferrer" target="_blank">Facebook</a></li>
              </ul>
            </article>
            <article class="card contact-channel">
              <p class="contact-channel__label">What to include</p>
              <ul class="include-list">
                <li>The operational problem, in plain language</li>
                <li>Systems you already run</li>
                <li>Whether you need software, cloud, data, or advice first</li>
              </ul>
            </article>
            <p><a href="/pages/process.html">See how delivery is sequenced</a></p>
          </aside>
        </div>
      </section>
'@
)

Write-Page 'privacy.html' 'Privacy Policy' 'Privacy policy for the Corelane Systems website.' @'
      <section class="content-page"><div class="container prose">
        <h1>Privacy Policy</h1>
        <p>This website is a static brochure. Contact and newsletter fields are validated in your browser. In the current version, Corelane Systems does not operate a server-side store for those submissions.</p>
        <p>If you email <a href="mailto:corelanesystem@gmail.com">corelanesystem@gmail.com</a> or message us on WhatsApp, we will use that correspondence only to respond to your enquiry.</p>
      </div></section>
'@

Write-Page 'terms.html' 'Terms of Service' 'Terms of use for the Corelane Systems website.' @'
      <section class="content-page"><div class="container prose">
        <h1>Terms of Service</h1>
        <p>Content on this site describes services in general terms. It is not a contract, a performance guarantee, or a statement about unnamed clients.</p>
        <p>Sample project visuals are labelled as demonstrations.</p>
      </div></section>
'@

$sitemapLinks = @(
  '/index.html','/pages/about.html','/pages/services.html','/pages/solutions.html','/pages/industries.html','/pages/work.html','/pages/process.html','/pages/blog.html','/pages/note-keep-wrap-replace.html','/pages/note-start-from-the-operation.html','/pages/note-visible-delivery.html','/pages/contact.html','/pages/privacy.html','/pages/terms.html'
)
$serviceFiles = @('software-development','web-development','web-applications','mobile-apps','cloud-engineering','devops','data-engineering','data-analytics','business-automation','api-integration','ui-ux-design','ai-automation','social-media','it-consulting')
$industryFiles = @('healthcare','ecommerce','manufacturing','education','logistics','real-estate','professional-services')
$lis = ($sitemapLinks + ($serviceFiles | ForEach-Object { "/pages/$_.html" }) + ($industryFiles | ForEach-Object { "/pages/$_.html" }) | ForEach-Object { "<li><a href=`"$_`">$_</a></li>" }) -join ''
Write-Page 'sitemap.html' 'Sitemap' 'HTML sitemap for Corelane Systems.' "<section class=`"content-page`"><div class=`"container prose`"><h1>Sitemap</h1><ul class=`"site-footer__links`">$lis</ul></div></section>"

$relSoft = @(@{href='/pages/web-applications.html';t='Web Applications';d='Authenticated applications for internal or customer use.'}, @{href='/pages/api-integration.html';t='API Integration';d='Connections between the systems you already run.'}, @{href='/pages/ui-ux-design.html';t='UI/UX Design';d='Interfaces operators can actually learn.'})
$relCloud = @(@{href='/pages/devops.html';t='DevOps';d='Repeatable build, test, and release paths.'}, @{href='/pages/data-engineering.html';t='Data Engineering';d='Pipelines between systems of record.'}, @{href='/pages/it-consulting.html';t='IT Consulting';d='Build vs buy and sequencing advice.'})
$relData = @(@{href='/pages/data-analytics.html';t='Data Analytics';d='Reporting that supports decisions.'}, @{href='/pages/cloud-engineering.html';t='Cloud Engineering';d='Environments you can operate and observe.'}, @{href='/pages/api-integration.html';t='API Integration';d='Reliable connections, not spreadsheet bridges.'})

$servicePages = @(
  @{ f='software-development.html'; t='Software Development'; d='Custom software engineered around your operations.'; img='/images/opt/svc-software.jpg'; contain=$false; alt='Night workstation with a wide monitor showing out-of-focus code. Not a client product.'; intro='We design and build applications that encode your rules, roles, and data &mdash; not a generic template with your logo.'; includes=@('Domain modelling around how work actually moves','Role-based access and operational workflows','Integration with systems you already run','Handover documentation for the team that will operate it'); related=$relSoft },
  @{ f='web-development.html'; t='Web Development'; d='Corporate and product websites with structure and performance.'; img='/images/opt/svc-web.jpg'; contain=$false; alt='A desktop showing a blurred website layout. Not a live client site.'; intro='Public sites that explain the offer clearly and stay maintainable after launch.'; includes=@('Information architecture and accessible front end','Content structure that can support SEO over time','Performance and maintainability, not a throwaway theme','A path to add applications later if you need them'); related=@(@{href='/pages/web-applications.html';t='Web Applications';d='When a public site is not enough.'}, @{href='/pages/ui-ux-design.html';t='UI/UX Design';d='Interface design for complex offers.'}, @{href='/pages/social-media.html';t='Social Media';d='Channel work aligned to the site.'}) },
  @{ f='web-applications.html'; t='Web Application Development'; d='Internal and customer web applications.'; img='/images/opt/svc-webapps.jpg'; contain=$false; alt='Someone using a laptop in a glass meeting room. Screen content is not a named product.'; intro='Authenticated applications for operations, customers, or partners, with integration to the systems you already run.'; includes=@('Authenticated product and operations surfaces','Permissioned data instead of shared files','Integration to CRM, ERP, or custom APIs','Testing and release path you can repeat'); related=$relSoft },
  @{ f='mobile-apps.html'; t='Mobile App Development'; d='iOS and Android applications for operational and customer use.'; img='/images/opt/svc-mobile.jpg'; contain=$false; alt='A phone held outdoors with a blurred app screen. Not a shipped client app.'; intro='Native or cross-platform apps when a mobile surface is the right way to do the work.'; includes=@('A clear reason the work belongs on a phone','iOS and Android delivery where justified','API-backed data, not a dead-end prototype','Operational handover, not just an App Store listing'); related=@(@{href='/pages/web-applications.html';t='Web Applications';d='Often the companion surface.'}, @{href='/pages/api-integration.html';t='API Integration';d='The app still needs a system of record.'}, @{href='/pages/ui-ux-design.html';t='UI/UX Design';d='Flows people can complete in the field.'}) },
  @{ f='cloud-engineering.html'; t='Cloud Engineering'; d='Cloud architecture, migration, and operations.'; img='/images/opt/svc-cloud.jpg'; contain=$false; alt='A data-center aisle of server racks. Environmental photo, not a named facility.'; intro='Environments that can be deployed, observed, and explained &mdash; without unexplained cost or lock-in theatre.'; includes=@('Architecture you can draw on one page','Migration sequenced against operational risk','Observability and access that operators understand','Cost and environment hygiene as part of the work'); related=$relCloud },
  @{ f='devops.html'; t='DevOps'; d='CI/CD, environments, and release engineering.'; img='/images/opt/svc-devops.jpg'; contain=$false; alt='Operations monitors with out-of-focus terminals. Not a client SOC.'; intro='Repeatable build, test, and release paths so delivery is not a heroic weekend activity.'; includes=@('CI/CD suited to the stack you actually run','Environment promotion with fewer surprises','Secrets, access, and rollback considered up front','Documentation the next engineer can follow'); related=$relCloud },
  @{ f='data-engineering.html'; t='Data Engineering'; d='Pipelines and models that move operational data.'; img='/images/opt/svc-dataeng.jpg'; contain=$false; alt='Fiber cables in a network closet. Infrastructure atmosphere, not a named site.'; intro='Reliable movement of data between systems of record, warehouses, and operational tools.'; includes=@('Source-to-destination mapping you can audit','Pipelines that fail loudly instead of silently','Models that match how managers actually decide','Room to add analytics without a rewrite'); related=$relData },
  @{ f='data-analytics.html'; t='Data Analytics'; d='Reporting that supports management decisions.'; img='/images/opt/svc-analytics.jpg'; contain=$false; alt='A wall display with blurred charts. No invented KPIs.'; intro='Defined metrics and dashboards. We do not fabricate historical KPIs on this website.'; includes=@('Agreed definitions before charts','Role-appropriate views','Scheduled or live reporting where it is justified','A path from raw data to decisions'); related=$relData },
  @{ f='business-automation.html'; t='Business Automation'; d='Workflow automation for repetitive operations.'; img='/images/opt/svc-bizauto.jpg'; contain=$false; alt='A worker scanning a pallet in a warehouse. Environmental photo, not a named client.'; intro='Remove copy-paste work where the process is stable enough to encode.'; includes=@('Process mapping before any bot or workflow tool','Automation of stable, high-volume steps','Human exception paths that stay visible','Integrations so work does not bounce through email'); related=@(@{href='/pages/ai-automation.html';t='AI and Automation';d='Applied only where it reduces genuine load.'}, @{href='/pages/software-development.html';t='Software Development';d='When the workflow needs a real system.'}, @{href='/pages/api-integration.html';t='API Integration';d='Connect the tools you already pay for.'}) },
  @{ f='api-integration.html'; t='API Integration'; d='Connections between the systems you already use.'; img='/images/opt/svc-api.jpg'; contain=$false; alt='Ethernet cables into a network switch. Supporting photograph only.'; intro='Documented, monitored integrations instead of fragile spreadsheet bridges.'; includes=@('Interface contracts you can test','Error handling and retries that operations can see','Mapping between systems of record','Monitoring so silent failure is not the default'); related=$relSoft },
  @{ f='ui-ux-design.html'; t='UI/UX Design'; d='Interface design for complex business software.'; img='/images/opt/svc-uiux.jpg'; contain=$false; alt='Desk with sketches and a tablet showing blurred wireframes.'; intro='Screens and flows that operators can learn. Photographs on this page are workplace atmosphere, not a shipped product UI.'; includes=@('Flows for the real exception cases','Interface design for dense operational data','Handover to engineering without a throwaway prototype','Accessibility as a baseline, not a later patch'); related=@(@{href='/pages/web-applications.html';t='Web Applications';d='Where those flows usually live.'}, @{href='/pages/software-development.html';t='Software Development';d='Design that is meant to be built.'}, @{href='/pages/web-development.html';t='Web Development';d='Public sites with a clearer offer.'}) },
  @{ f='ai-automation.html'; t='AI and Automation'; d='Applied automation and AI where it reduces real operational load.'; img='/images/opt/svc-ai.jpg'; contain=$false; alt='An operator at a multi-screen workstation. Illustrative, not a named team.'; intro='We use automation and, where it is justified, applied AI. We do not claim autonomous business miracles.'; includes=@('A specific workload that is worth encoding','Human review where the risk is high','Integration into the systems you already run','An honest boundary on what the model will not do'); related=@(@{href='/pages/business-automation.html';t='Business Automation';d='Workflow first, models second.'}, @{href='/pages/data-engineering.html';t='Data Engineering';d='Garbage in remains garbage out.'}, @{href='/pages/it-consulting.html';t='IT Consulting';d='When the question is whether to automate at all.'}) },
  @{ f='social-media.html'; t='Social Media Management'; d='Structured social programs that support the brand.'; img='/images/opt/svc-social.jpg'; contain=$false; people=$false; alt='A phone on a tripod in a small content studio. No live social metrics shown.'; intro='Cadence, creative direction, and alignment with the website &mdash; not vanity metrics invented for this page.'; includes=@('A publishing cadence you can actually keep','Channel-appropriate direction','Alignment with the website and offers','Simple reporting on activity, not invented reach'); related=@(@{href='/pages/web-development.html';t='Web Development';d='The destination those channels should support.'}, @{href='/pages/ui-ux-design.html';t='UI/UX Design';d='Brand-consistent surfaces.'}, @{href='/pages/it-consulting.html';t='IT Consulting';d='When the need is strategy, not posts.'}) },
  @{ f='it-consulting.html'; t='IT Consulting'; d='Architecture and delivery advice.'; img='/images/opt/svc-consulting.jpg'; contain=$false; people=$true; alt='A person at a glass whiteboard in an office at dusk. Illustrative, not named staff.'; intro='Independent guidance on build vs buy, sequencing, and technical risk.'; includes=@('Assessment of keep, wrap, or replace','Vendor and sequencing advice without theatre','Architecture that can be explained to operators','A written path you can take to another team if needed'); related=$relCloud }
)

$serviceExtra = @{
  'software-development.html' = @{
    more = '<p>Custom software is for rules, roles, and data that do not fit a spreadsheet or an off-the-shelf package. We model how work actually moves, then build the smallest system that can carry those rules without hiding them in one person&rsquo;s head.</p><p>We do not start from a favourite framework. The operation decides whether you need a new application, a wrap around what you already run, or a recommendation to wait.</p>'
    who = @('Work is trapped in files, inboxes, and tribal knowledge','Several teams share a process but not a system of record','You have already tried stretching a generic package past its limits')
    not = @('A white-label template with your logo on it','A rewrite justified only by fashion in the stack','A promise of unnamed clients or percentage gains')
    deliver = @('A working application in phases you can operate','Role-based access that matches how people actually work','Documentation and handover for the team that stays')
    ask = @('Which workflow fails on a bad day?','Which system is believed when two numbers disagree?','What must not break during a change?')
  }
  'web-development.html' = @{
    more = '<p>A public site has one job first: explain the offer clearly and stay maintainable after launch. Information architecture, accessible front end, and a content structure that can support search over time matter more than a theme you cannot edit.</p><p>If the site later needs logins, workflows, or integrations, that is a web application &mdash; we will say so rather than stretch a brochure into a product.</p>'
    who = @('The current site cannot explain what you sell','Content is stuck in a theme nobody on the team can change','You need a public surface that can grow into an application later')
    not = @('A throwaway landing page farm','Guaranteed ranking or traffic claims','A substitute for an authenticated product')
    deliver = @('A structured, accessible front end','A content model editors can actually use','Performance and handover notes for the next change')
    ask = @('Who updates the site after launch?','What must a first-time visitor understand in one screen?','Do you already know you will need logins later?')
  }
  'web-applications.html' = @{
    more = '<p>Web applications are for authenticated work: operations, customers, or partners who need permissioned data instead of a shared folder. They sit on APIs and a system of record. If nobody needs to log in, you probably need a website, not an application.</p>'
    who = @('Internal teams share process but not a durable system','Customers or partners need a portal, not another email thread','You already run CRM, ERP, or custom APIs that must stay in the loop')
    not = @('A public marketing site with a fake login','A prototype that cannot be released twice','An app with no owner after go-live')
    deliver = @('Authenticated surfaces with clear roles','Integration to the systems you already pay for','A test and release path you can repeat')
    ask = @('Who is allowed to see which records?','What is the system of record today?','How do you know a release is safe to promote?')
  }
  'mobile-apps.html' = @{
    more = '<p>A mobile app is justified when the work belongs on a phone: field capture, approvals away from a desk, or a customer flow that is worse in the browser. An app that only mirrors a website, with no offline or device reason, is usually the wrong surface.</p>'
    who = @('The job happens away from a desk','You need device capabilities a browser does not give you','There is already (or will be) an API behind the screens')
    not = @('An App Store listing as a substitute for a product','A demo that cannot ship to iOS and Android when both are required','A client screenshot presented as a named case study')
    deliver = @('A clear reason the work is mobile','iOS and/or Android delivery where it is justified','Handover that is more than store credentials')
    ask = @('What can the user not do in a browser today?','Does the app need a live connection at all times?','Who operates the API the app will call?')
  }
  'cloud-engineering.html' = @{
    more = '<p>Cloud work is architecture you can draw on one page, migration sequenced against operational risk, and environments that can be observed. Lock-in theatre and unexplained invoices are failure modes, not a strategy.</p>'
    who = @('You are moving workloads and cannot freeze the business to do it','Cost, access, or environments are unexplained','You need a landing zone that operators can actually run')
    not = @('A lift-and-shift with no rollback story','A vendor bake-off disguised as architecture','Guaranteed savings percentages')
    deliver = @('An architecture diagram people can argue with','A sequenced migration with named risks','Observability and access that match how you work')
    ask = @('What happens if the cutover fails on day one?','Who holds production access today?','Which workloads are allowed to move last?')
  }
  'devops.html' = @{
    more = '<p>DevOps here means repeatable build, test, and release &mdash; not a rebrand of the operations team. If every release is a heroic weekend, the path is the product: CI/CD suited to the stack you run, promotion between environments, and rollback that is written down.</p>'
    who = @('Releases depend on one person being awake','Environments drift and nobody can recreate them','Secrets and access live in chat history')
    not = @('A tool install with no change to how you ship','A promise that incidents will stop','A platform nobody on your team can operate')
    deliver = @('A pipeline matched to your actual stack','Environment promotion you can explain','Documentation the next engineer can follow')
    ask = @('How do you ship today, step by step?','What does rollback look like when it fails?','Who is allowed to promote to production?')
  }
  'data-engineering.html' = @{
    more = '<p>Data engineering is reliable movement between systems of record, warehouses, and operational tools. Pipelines should fail loudly. Silent drift is how finance and operations stop trusting the numbers.</p>'
    who = @('The same metric has three definitions','Exports and night jobs are the integration layer','You want analytics later but the pipes are not trustworthy yet')
    not = @('A dashboard with no agreed sources','A warehouse project that ignores operational systems','Invented historical KPIs on a brochure')
    deliver = @('A source-to-destination map you can audit','Pipelines with visible failure','Models that match how managers actually decide')
    ask = @('Which source wins when records conflict?','Who notices when a job does not run?','What decision is this data supposed to support?')
  }
  'data-analytics.html' = @{
    more = '<p>Analytics is agreed definitions, then views. We will not fabricate a trend line for this website, and we will not start with a chart library before the metric is named. Role-appropriate reporting beats a wall of tiles nobody owns.</p>'
    who = @('Leadership cannot see the same number twice','Reports are rebuilt by hand every week','You have pipes, but not a decision layer')
    not = @('Vanity dashboards with no owner','Guaranteed &ldquo;insight&rdquo; from dirty data','A substitute for fixing the source systems')
    deliver = @('Written metric definitions','Views matched to roles','A path from raw data to the decision, or an honest gap')
    ask = @('Which three decisions need a number this month?','Who is allowed to change a definition?','Is the source data already trustworthy?')
  }
  'business-automation.html' = @{
    more = '<p>Automation is for stable, high-volume steps with a visible exception path. If the process still changes every week, encoding it will freeze a mess. We map the work before any bot or workflow tool.</p>'
    who = @('The same copy-paste happens every day','Handoffs bounce through email and chat','The happy path is clear enough to write down')
    not = @('Automating a process nobody can describe','Removing humans from high-risk exceptions','A robot as a substitute for a real system of record')
    deliver = @('A process map the operators recognise','Automation on the stable steps only','Integrations so work does not return to the inbox')
    ask = @('Which step is both frequent and boring?','What happens when the case is not standard?','Which systems already hold the data?')
  }
  'api-integration.html' = @{
    more = '<p>Integrations are contracts you can test: mapping, retries, and monitoring so silent failure is not the default. Spreadsheet bridges and unauthenticated scripts are how operations lose a week without noticing.</p>'
    who = @('Two systems both claim to be the source of truth','Nightly files are the only connection','Errors disappear until a customer calls')
    not = @('A one-off script with no owner','An integration nobody can replay after a failure','A rewrite of both systems when a contract would do')
    deliver = @('Interface contracts and mappings','Error handling operations can see','Monitoring that surfaces a missed sync')
    ask = @('Which system must win on conflict?','How do you know a sync happened?','Who is paged when it does not?')
  }
  'ui-ux-design.html' = @{
    more = '<p>Interface design for operational software is about exception cases and dense data, not a mood board. Flows have to be learnable by the people who live in them. We design to be built, then hand over to engineering without a throwaway prototype.</p>'
    who = @('The current screens only work if you already know the process','Operators invent workarounds on paper','You are about to build software and do not have the flows yet')
    not = @('Decoration on a system that cannot be used','A prototype that cannot survive contact with engineering','Accessibility treated as a later patch')
    deliver = @('Flows for the real exception cases','Interface specs engineering can implement','A baseline for accessibility, not a slogan')
    ask = @('Who uses this for four hours a day?','What is the most common error they make?','When does this design need to be in production?')
  }
  'ai-automation.html' = @{
    more = '<p>Applied automation and AI only where a specific workload is worth encoding, with human review where the risk is high. We do not sell autonomous business miracles. If the data is garbage, the model will not save it &mdash; that is a data-engineering conversation first.</p>'
    who = @('A narrow, repetitive workload has a measurable cost','Humans already review the hard cases','The systems of record can feed the workflow')
    not = @('A chatbot as a strategy','Unattended decisions in a high-risk process','A claim that the model will run the company')
    deliver = @('A bounded use case with an owner','Review points where the risk is high','An honest list of what the model will not do')
    ask = @('What task would you gladly never do again?','What must a human still sign off?','Is the input data complete enough to try?')
  }
  'social-media.html' = @{
    more = '<p>Social work here is cadence, channel-appropriate direction, and alignment with the website. It is not invented reach. If the destination those channels send people to is unclear, fix the site first.</p>'
    who = @('You need a publishing rhythm you can actually keep','Channels exist but nobody owns the offer on them','The website and the posts tell different stories')
    not = @('Guaranteed followers, virality, or ROAS','A substitute for a working website','Vanity metrics invented for this page')
    deliver = @('A cadence and channel plan you can staff','Creative direction that matches the offer','Simple reporting on activity, not theatre')
    ask = @('Which channels do you actually have capacity for?','What should a post send someone to do?','Who approves content today?')
  }
  'it-consulting.html' = @{
    more = '<p>Consulting is independent guidance: keep, wrap, or replace; vendor and sequencing advice; architecture operators can understand. The output is a written path you could take to another team. It is not a disguised implementation sale, and it is not a deck of fashionable tools.</p>'
    who = @('You need a decision before you hire a build team','Vendors disagree and you want a readable recommendation','The last transformation did not survive contact with operations')
    not = @('A tool shortlist with no operational map','Advice that cannot be executed by someone else','Guaranteed savings or a timeline pulled from air')
    deliver = @('A keep / wrap / replace recommendation','Sequencing and risk in writing','Architecture that can be explained to the floor')
    ask = @('What decision is blocked right now?','Who has to live with the recommendation?','What has already been tried and failed?')
  }
}

foreach ($s in $servicePages) {
  $people = [bool]$s.people
  $heroAlt = $s.alt
  if (-not $heroAlt) {
    if ($s.img -match 'work') { $heroAlt = 'Hands at a keyboard in front of a monitor and laptop. Screen content is not a client product.' }
    elseif ($s.img -match 'solution') { $heroAlt = 'A quiet executive boardroom. Atmospheric photograph, not a named office.' }
    elseif ($s.img -match 'about') { $heroAlt = 'Three colleagues reviewing work on a laptop. People shown are illustrative, not named staff.' }
    elseif ($s.img -match 'contact') { $heroAlt = 'Two people in a meeting reviewing a laptop. Illustrative, not named staff.' }
    else { $heroAlt = $s.t }
  }
  Write-Page $s.f $s.t $s.d (
    (Hero 'Service' $s.t $s.d $s.img $heroAlt $s.contain $people $false) + (ServiceBody $s.intro $s.includes $s.related $serviceExtra[$s.f])
  )
}

$industryPages = @(
  @{ f='healthcare.html'; t='Healthcare'; d='Operational software for healthcare organisations, described without named clients.'; img='/images/opt/ind-healthcare.jpg'; alt='A quiet hospital corridor. Environmental photo, not a named hospital.'; intro='Healthcare operations are workflow-heavy and intolerant of silent failure. Corelane treats that as an engineering constraint, not a marketing theme.'; themes=@('Referral, scheduling, and operational hand-offs','Permissioned data and auditability','Integrations with systems already in the organisation','Phased change that does not freeze the floor') },
  @{ f='ecommerce.html'; t='E-Commerce'; d='Commerce operations, catalogs, and integrations.'; img='/images/opt/ind-ecommerce.jpg'; alt='Hands packing boxes at a fulfillment table. Not a named warehouse.'; intro='Storefronts fail in operations as often as they fail in design: catalog, stock, orders, and the tools behind the website.'; themes=@('Catalog and order flows','Stock visibility across channels','Integrations with payment, fulfilment, or ERP tools','Reporting that purchasing can actually use') },
  @{ f='manufacturing.html'; t='Manufacturing'; d='Production and inventory-oriented software.'; img='/images/opt/ind-manufacturing.jpg'; alt='A CNC machine on a factory floor. Not a named plant.'; intro='Plant-adjacent software has to respect the floor, the warehouse, and the systems that already record production.'; themes=@('Inventory and work-order visibility','Integrations with existing plant or ERP tools','Reducing spreadsheet control points','Phased delivery that protects production') },
  @{ f='education.html'; t='Education'; d='Program and administration systems for education providers.'; img='/images/opt/ind-education.jpg'; alt='A sunlit lecture hall with a blank screen. Not a named campus.'; intro='Program, learner, and administration work is often stuck in files and inboxes. We look for the operational system underneath.'; themes=@('Program and cohort administration','Learner or participant records','Staff workflows that do not depend on one champion','Reporting for the people who run the operation') },
  @{ f='logistics.html'; t='Logistics'; d='Tracking and partner integration for logistics operations.'; img='/images/opt/ind-logistics.jpg'; alt='Trucks at a loading dock at dusk. Environmental photo, not a named carrier.'; intro='Movement work needs status that partners and operators can trust, not another dashboard that nobody updates.'; themes=@('Tracking and milestone visibility','Partner and carrier integrations','Exception handling when a shipment leaves the happy path','Operational reporting without invented SLA theatre') },
  @{ f='real-estate.html'; t='Real Estate'; d='Software for property and real-estate operations.'; img='/images/opt/ind-realestate.jpg'; alt='An empty apartment interior with city windows. Sample setting, not a listing.'; intro='Listings and internal operations are different jobs. We treat the operational system as the product, not the brochure site alone.'; themes=@('Listings and inventory of units or properties','Internal tools for the team that runs viewings and tenancy','Integrations with CRM or accounting tools you already use','A public site only when it serves the operation') },
  @{ f='professional-services.html'; t='Professional Services'; d='Tools for firms that sell expertise and delivery.'; img='/images/opt/ind-proservices.jpg'; alt='An empty boardroom after hours. Illustrative setting, not a named firm.'; intro='Firms that sell delivery need resourcing, status, and client operations software that matches how work is actually sold and staffed.'; themes=@('Delivery and resourcing visibility','Client operations without a maze of files','Time, status, and hand-off between teams','Integrations with the finance or CRM tools already in place') }
)
foreach ($i in $industryPages) {
  Write-Page $i.f $i.t $i.d (
    (Hero 'Industry' $i.t $i.d $i.img $i.alt $false $false $false) + (IndustryBody $i.intro $i.themes)
  )
}

Write-Host "Wrote pages to $pages"
Get-ChildItem $pages | Measure-Object | Select-Object Count
