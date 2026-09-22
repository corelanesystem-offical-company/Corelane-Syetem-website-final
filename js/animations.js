(function () {
  document.documentElement.classList.add("js-enabled");

  const motionQuery = window.matchMedia("(prefers-reduced-motion: reduce)");

  function prefersReduced() {
    return motionQuery.matches;
  }

  function stampDelays(container) {
    Array.prototype.forEach.call(container.children, function (child, index) {
      child.classList.add("reveal");
      child.style.setProperty("--reveal-delay", index * 55 + "ms");
    });
  }

  function prepareReveals() {
    document.querySelectorAll(
      ".problem-grid, .service-grid, .work-grid, .industry-grid, .process-steps, .feature-list, .blog-grid, .stat-row, .challenge-grid, .category-grid"
    ).forEach(function (grid) {
      grid.classList.remove("reveal");
      stampDelays(grid);
    });

    document.querySelectorAll(".cta-band, .solution-panel, .form.card").forEach(function (el) {
      if (!el.classList.contains("reveal")) el.classList.add("reveal");
    });

    const split = document.querySelector("#why .split > div:first-child");
    if (split) split.classList.add("reveal", "reveal--left");
  }

  function showAllReveals() {
    document.querySelectorAll(".reveal").forEach(function (el) {
      el.classList.add("is-visible");
    });
  }

  function observeReveals() {
    if (!("IntersectionObserver" in window)) {
      showAllReveals();
      return;
    }
    const io = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          entry.target.classList.add("is-visible");
          io.unobserve(entry.target);
        });
      },
      { threshold: 0.14, rootMargin: "0px 0px -8% 0px" }
    );
    document.querySelectorAll(".reveal").forEach(function (el) {
      io.observe(el);
    });
  }

  function easeOutCubic(t) {
    return 1 - Math.pow(1 - t, 3);
  }

  function countSources() {
    const data = window.Corelane || {};
    return {
      problems: data.problems ? data.problems.length : 8,
      services: data.serviceCatalog ? data.serviceCatalog.length : 14,
      process: document.querySelectorAll(".process-steps li").length || 7,
    };
  }

  function animateCounter(el, to) {
    const duration = 1100;
    const start = performance.now();
    function tick(now) {
      const p = Math.min(1, (now - start) / duration);
      el.textContent = String(Math.round(to * easeOutCubic(p)));
      if (p < 1) requestAnimationFrame(tick);
    }
    requestAnimationFrame(tick);
  }

  function observeCounters() {
    const sources = countSources();
    const nodes = document.querySelectorAll("[data-count], [data-count-source]");
    if (!nodes.length) return;

    function run(el) {
      if (el.getAttribute("data-counted") === "true") return;
      el.setAttribute("data-counted", "true");
      const source = el.getAttribute("data-count-source");
      const to = source && sources[source] != null ? sources[source] : Number(el.getAttribute("data-count") || el.textContent);
      if (prefersReduced()) {
        el.textContent = String(to);
        return;
      }
      animateCounter(el, to);
    }

    if (prefersReduced() || !("IntersectionObserver" in window)) {
      nodes.forEach(run);
      return;
    }

    const io = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          run(entry.target);
          io.unobserve(entry.target);
        });
      },
      { threshold: 0.4 }
    );
    nodes.forEach(function (el) {
      io.observe(el);
    });
  }

  function heroIntro() {
    const copy = document.querySelector(".hero__grid > div");
    if (copy) copy.classList.add("hero-enter");
  }

  function observeTechFlow() {
    const flow = document.querySelector(".tech-flow");
    if (!flow) return;
    const items = flow.querySelectorAll("li");
    if (!items.length) return;

    function lightAll() {
      items.forEach(function (item) {
        item.classList.add("is-lit");
      });
    }

    if (prefersReduced() || !("IntersectionObserver" in window)) {
      lightAll();
      return;
    }

    const io = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;
          items.forEach(function (item, index) {
            window.setTimeout(function () {
              item.classList.add("is-lit");
            }, index * 110);
          });
          io.unobserve(entry.target);
        });
      },
      { threshold: 0.28, rootMargin: "0px 0px -6% 0px" }
    );
    io.observe(flow);
  }

  prepareReveals();
  heroIntro();

  if (prefersReduced()) {
    showAllReveals();
  } else {
    observeReveals();
  }
  observeCounters();
  observeTechFlow();

  if (motionQuery.addEventListener) {
    motionQuery.addEventListener("change", function (event) {
      if (event.matches) showAllReveals();
    });
  }
})();
