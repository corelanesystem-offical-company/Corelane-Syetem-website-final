(function () {
  const nav = document.getElementById("primary-nav");
  const toggle = document.querySelector(".menu-toggle");
  const overlay = document.querySelector(".nav-overlay");
  const header = document.querySelector(".site-header");
  const navParent = nav ? nav.parentNode : null;
  const navNext = nav ? nav.nextSibling : null;
  const overlayParent = overlay ? overlay.parentNode : null;
  const overlayNext = overlay ? overlay.nextSibling : null;

  function parkMobileNav(open) {
    if (!nav || !overlay) return;
    if (open && isMobileNav()) {
      document.body.appendChild(overlay);
      document.body.appendChild(nav);
      return;
    }
    if (overlayParent) overlayParent.insertBefore(overlay, overlayNext);
    if (navParent) navParent.insertBefore(nav, navNext);
  }
  document.querySelectorAll(".site-header__actions .btn--primary").forEach(function (el) {
    el.classList.add("header-cta");
  });
  const searchOpen = document.querySelector("[data-search-open]");
  const searchDialog = document.getElementById("search-dialog");
  const searchInput = document.getElementById("site-search");
  const searchResults = document.getElementById("search-results");
  if (searchDialog && !searchDialog.querySelector("[data-search-close]")) {
    const panel = searchDialog.querySelector(".search-dialog__panel");
    if (panel) {
      const btn = document.createElement("button");
      btn.type = "button";
      btn.className = "icon-btn";
      btn.setAttribute("data-search-close", "");
      btn.setAttribute("aria-label", "Close search");
      btn.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18" stroke-linecap="round" /></svg>';
      panel.insertBefore(btn, panel.firstChild);
    }
  }
  const searchCloseBtn = document.querySelector("[data-search-close]");
  let searchActive = -1;

  function isMobileNav() {
    return window.matchMedia("(max-width: 992px)").matches;
  }

  function setOpen(open) {
    if (!nav || !toggle) return;
    const wasOpen = nav.classList.contains("is-open");
    nav.classList.toggle("is-open", open);
    if (overlay) overlay.classList.toggle("is-open", open);
    document.body.classList.toggle("nav-open", open);
    parkMobileNav(open);
    toggle.setAttribute("aria-expanded", String(open));
    toggle.setAttribute("aria-label", open ? "Close menu" : "Open menu");
    if (isMobileNav()) {
      nav.setAttribute("aria-hidden", open ? "false" : "true");
    } else {
      nav.removeAttribute("aria-hidden");
    }
    if (open && isMobileNav()) {
      const first = nav.querySelector("a, button");
      if (first) first.focus();
    } else if (!open && wasOpen) {
      toggle.focus();
    }
  }

  if (nav && isMobileNav()) nav.setAttribute("aria-hidden", "true");

  if (toggle && !toggle.querySelector(".menu-toggle__box")) {
    toggle.innerHTML =
      '<span class="menu-toggle__box" aria-hidden="true"><span></span><span></span><span></span></span>';
  }

  if (nav) {
    nav.querySelectorAll(".site-nav__list li").forEach(function (item, index) {
      item.style.setProperty("--nav-i", String(index));
    });
  }

  if (toggle) {
    toggle.addEventListener("click", function (event) {
      event.stopPropagation();
      setOpen(!nav.classList.contains("is-open"));
    });
  }
  if (overlay) {
    overlay.addEventListener("click", function () {
      setOpen(false);
    });
  }

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      setOpen(false);
      closeSearch();
    }
    if (event.key === "Tab" && nav && nav.classList.contains("is-open") && isMobileNav()) {
      const focusable = nav.querySelectorAll("a, button");
      if (!focusable.length) return;
      const first = focusable[0];
      const last = focusable[focusable.length - 1];
      if (event.shiftKey && document.activeElement === first) {
        event.preventDefault();
        last.focus();
      } else if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault();
        first.focus();
      }
    }
  });

  document.querySelectorAll(".site-header__actions .btn--primary").forEach(function (el) {
    el.classList.add("header-cta");
  });
  if (nav && !nav.querySelector(".nav-cta")) {
    const wrap = document.createElement("div");
    wrap.innerHTML = '<a class="btn btn--primary nav-cta" href="/pages/contact.html">Let’s Talk</a>';
    nav.appendChild(wrap.firstChild);
  }
  if (nav) {
    nav.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function (event) {
        if (!isMobileNav()) return;
        var next;
        var here;
        try {
          next = new URL(link.href, window.location.href);
          here = new URL(window.location.href);
        } catch (err) {
          return;
        }
        var samePath =
          (next.pathname.replace(/index\.html$/, "").replace(/\/$/, "") || "/") ===
          (here.pathname.replace(/index\.html$/, "").replace(/\/$/, "") || "/");
        if (samePath && !next.hash) {
          event.preventDefault();
          setOpen(false);
        }
      });
    });
  }

  function onScroll() {
    if (header) header.classList.toggle("is-scrolled", window.scrollY > 8);
  }
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });
  window.addEventListener("resize", function () {
    if (!isMobileNav()) setOpen(false);
  });

  function pathOf(href) {
    try {
      return new URL(href, window.location.href).pathname.replace(/index\.html$/, "").replace(/\/$/, "") || "/";
    } catch (e) {
      return href;
    }
  }

  const here = pathOf(window.location.href);
  document.querySelectorAll(".site-nav a").forEach(function (link) {
    if (link.classList.contains("nav-cta")) return;
    if (pathOf(link.href) === here) link.setAttribute("aria-current", "page");
  });

  function openSearch() {
    if (!searchDialog) return;
    searchDialog.classList.add("is-open");
    searchDialog.setAttribute("aria-hidden", "false");
    document.body.classList.add("search-open");
    const panel = searchDialog.querySelector(".search-dialog__panel");
    if (panel) {
      panel.setAttribute("role", "dialog");
      panel.setAttribute("aria-modal", "true");
    }
    if (searchInput) searchInput.focus();
    renderSearch(searchInput ? searchInput.value : "");
  }

  function closeSearch() {
    if (!searchDialog || !searchDialog.classList.contains("is-open")) return;
    searchDialog.classList.remove("is-open");
    searchDialog.setAttribute("aria-hidden", "true");
    document.body.classList.remove("search-open");
    const panel = searchDialog.querySelector(".search-dialog__panel");
    if (panel) panel.removeAttribute("aria-modal");
    if (searchOpen) searchOpen.focus();
  }

  function haystack(item) {
    return [item.title, item.group, item.blurb, item.keywords].join(" ").toLowerCase();
  }

  function escapeHtml(value) {
    return String(value).replace(/[&<>"']/g, function (ch) {
      return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[ch];
    });
  }

  function highlight(text, q) {
    const safe = escapeHtml(text || "");
    if (!q) return safe;
    const idx = safe.toLowerCase().indexOf(q);
    if (idx === -1) return safe;
    return safe.slice(0, idx) + "<mark>" + safe.slice(idx, idx + q.length) + "</mark>" + safe.slice(idx + q.length);
  }

  function scoreItem(item, q) {
    const title = item.title.toLowerCase();
    const hay = haystack(item);
    if (title === q) return 100;
    if (title.indexOf(q) === 0) return 80;
    if (title.indexOf(q) !== -1) return 60;
    if ((item.keywords || "").toLowerCase().indexOf(q) !== -1) return 40;
    if (hay.indexOf(q) !== -1) return 20;
    return 0;
  }

  function resultMarkup(item, q) {
    return (
      "<li><a class=\"search-result\" href=\"" +
      escapeHtml(item.href) +
      "\"><span class=\"search-result__group\">" +
      escapeHtml(item.group || "Page") +
      "</span><span class=\"search-result__title\">" +
      highlight(item.title, q) +
      "</span><span class=\"search-result__blurb\">" +
      highlight(item.blurb || "", q) +
      "</span></a></li>"
    );
  }

  function resultLinks() {
    return searchResults ? searchResults.querySelectorAll("a.search-result") : [];
  }

  function setSearchActive(index) {
    const links = resultLinks();
    if (!links.length) {
      searchActive = -1;
      return;
    }
    searchActive = (index + links.length) % links.length;
    links.forEach(function (link, i) {
      link.classList.toggle("is-active", i === searchActive);
    });
    links[searchActive].focus();
  }

  function renderSearch(query) {
    if (!searchResults || !window.Corelane || !Corelane.searchIndex) return;
    const q = (query || "").trim().toLowerCase();
    searchActive = -1;
    let items;
    if (!q) {
      items = Corelane.searchIndex.filter(function (item) { return item.featured; }).slice(0, 8);
    } else {
      items = Corelane.searchIndex
        .map(function (item) { return { item: item, score: scoreItem(item, q) }; })
        .filter(function (row) { return row.score > 0; })
        .sort(function (a, b) { return b.score - a.score; })
        .slice(0, 10)
        .map(function (row) { return row.item; });
    }
    if (!items.length) {
      searchResults.innerHTML =
        "<li class=\"search-empty\">No matching pages on this site. Try a service, industry, or Contact.</li>";
      return;
    }
    searchResults.innerHTML = items.map(function (item) { return resultMarkup(item, q); }).join("");
  }

  if (searchOpen) searchOpen.addEventListener("click", openSearch);
  if (searchCloseBtn) searchCloseBtn.addEventListener("click", closeSearch);
  if (searchDialog) {
    searchDialog.addEventListener("click", function (event) {
      if (event.target === searchDialog) closeSearch();
    });
  }
  if (searchInput) {
    searchInput.addEventListener("input", function () { renderSearch(searchInput.value); });
  }

  document.addEventListener("keydown", function (event) {
    const inField = /^(INPUT|TEXTAREA|SELECT)$/.test((event.target && event.target.tagName) || "");
    if ((event.key === "k" || event.key === "K") && (event.metaKey || event.ctrlKey)) {
      event.preventDefault();
      if (searchDialog && searchDialog.classList.contains("is-open")) closeSearch();
      else openSearch();
      return;
    }
    if (event.key === "/" && !inField && !event.metaKey && !event.ctrlKey && !event.altKey) {
      event.preventDefault();
      openSearch();
      return;
    }
    if (!searchDialog || !searchDialog.classList.contains("is-open")) return;
    if (event.key === "ArrowDown") {
      event.preventDefault();
      setSearchActive(searchActive < 0 ? 0 : searchActive + 1);
    } else if (event.key === "ArrowUp") {
      event.preventDefault();
      setSearchActive(searchActive < 0 ? resultLinks().length - 1 : searchActive - 1);
    } else if (event.key === "Tab") {
      const focusable = searchDialog.querySelectorAll("a[href], button, input");
      if (!focusable.length) return;
      const first = focusable[0];
      const last = focusable[focusable.length - 1];
      if (event.shiftKey && document.activeElement === first) {
        event.preventDefault();
        last.focus();
      } else if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault();
        first.focus();
      }
    }
  });
})();
