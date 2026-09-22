(function () {
  const grid = document.getElementById("problem-grid");
  const title = document.getElementById("solution-title");
  const body = document.getElementById("solution-body");
  const list = document.getElementById("solution-benefits");
  if (!grid || !window.Corelane) return;

  const icons = {
    manual:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><rect x="4" y="5" width="16" height="14" rx="2"/><path d="M8 9h8M8 13h5"/></svg>',
    customers:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="3"/><path d="M22 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg>',
    excel:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M4 4h16v16H4z"/><path d="M4 9h16M9 4v16"/></svg>',
    inventory:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>',
    presence:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><circle cx="12" cy="12" r="9"/><path d="M3 12h18M12 3a15 15 0 0 1 0 18M12 3a15 15 0 0 0 0 18"/></svg>',
    social:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M21 15a4 4 0 0 1-4 4H8l-5 3V7a4 4 0 0 1 4-4h10a4 4 0 0 1 4 4z"/></svg>',
    reports:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M4 20V10M10 20V4M16 20v-7M22 20H2"/></svg>',
    legacy:
      '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><rect x="3" y="4" width="18" height="14" rx="2"/><path d="M8 21h8M12 18v3"/></svg>',
  };

  function select(id) {
    const item = Corelane.problems.find(function (p) { return p.id === id; });
    if (!item) return;
    grid.querySelectorAll(".problem-card").forEach(function (btn) {
      const on = btn.getAttribute("data-id") === id;
      btn.classList.toggle("is-active", on);
      btn.setAttribute("aria-selected", String(on));
    });
    if (title) title.textContent = item.solutionTitle;
    if (body) body.textContent = item.solutionDescription;
    if (list) {
      list.innerHTML = item.benefits.map(function (b) { return "<li>" + b + "</li>"; }).join("");
    }
  }

  grid.setAttribute("role", "tablist");
  Corelane.problems.forEach(function (item, index) {
    const btn = document.createElement("button");
    btn.type = "button";
    btn.className = "problem-card" + (index === 0 ? " is-active" : "");
    btn.setAttribute("data-id", item.id);
    btn.setAttribute("role", "tab");
    btn.setAttribute("aria-controls", "solutions-preview");
    btn.setAttribute("aria-selected", index === 0 ? "true" : "false");
    btn.innerHTML = (icons[item.id] || "") + "<strong>" + item.title + "</strong><span>" + item.short + "</span>";
    btn.addEventListener("click", function () { select(item.id); });
    btn.addEventListener("keydown", function (event) {
      if (event.key !== "ArrowRight" && event.key !== "ArrowLeft") return;
      event.preventDefault();
      const i = Corelane.problems.findIndex(function (p) { return p.id === item.id; });
      const next = event.key === "ArrowRight"
        ? Corelane.problems[(i + 1) % Corelane.problems.length]
        : Corelane.problems[(i - 1 + Corelane.problems.length) % Corelane.problems.length];
      const el = grid.querySelector('[data-id="' + next.id + '"]');
      if (el) {
        el.focus();
        select(next.id);
      }
    });
    grid.appendChild(btn);
  });

  select(Corelane.problems[0].id);
})();
