(function () {
  const video = document.getElementById("hero-video");
  const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");

  function setPlaying(playing) {
    if (!video) return;
    if (playing) {
      const play = video.play();
      if (play && play.catch) play.catch(function () {});
    } else {
      video.pause();
    }
  }

  if (video) {
    video.muted = true;
    if (reduceMotion.matches) {
      video.removeAttribute("autoplay");
      setPlaying(false);
    } else {
      setPlaying(true);
    }
    if (reduceMotion.addEventListener) {
      reduceMotion.addEventListener("change", function (event) {
        setPlaying(!event.matches);
      });
    }
  }

  const svg = document.querySelector(".arch");
  const panel = document.getElementById("arch-note");
  if (!svg) return;

  const notes = {
    challenge: "Start with the operational problem — not a technology shopping list.",
    strategy: "Agree scope, constraints, and a delivery approach before writing production code.",
    software: "Design and build the software, integrations, and interfaces the work requires.",
    cloud: "Place workloads on infrastructure that can be operated and observed.",
    deploy: "Release through a controlled path with testing and rollback in mind.",
    growth: "Measure whether the system actually helps the business run better.",
  };

  const order = ["challenge", "strategy", "software", "cloud", "deploy", "growth"];

  function setActive(id) {
    svg.querySelectorAll(".node").forEach(function (node) {
      node.classList.toggle("is-active", node.getAttribute("data-node") === id);
    });
    svg.querySelectorAll(".edge").forEach(function (edge) {
      const from = edge.getAttribute("data-from");
      const to = edge.getAttribute("data-to");
      const active = from === id || to === id;
      edge.classList.toggle("is-active", active);
    });
    if (panel) panel.textContent = notes[id] || "";
  }

  svg.querySelectorAll(".node").forEach(function (node) {
    const id = node.getAttribute("data-node");
    node.setAttribute("tabindex", "0");
    node.setAttribute("role", "button");
    node.addEventListener("mouseenter", function () { setActive(id); });
    node.addEventListener("focus", function () { setActive(id); });
    node.addEventListener("click", function () { setActive(id); });
    node.addEventListener("keydown", function (event) {
      if (event.key === "Enter" || event.key === " ") {
        event.preventDefault();
        setActive(id);
      }
    });
  });

  setActive("challenge");

  const visual = document.querySelector(".hero__visual");
  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  const fine = window.matchMedia("(hover: hover) and (pointer: fine)").matches;
  if (visual && svg && fine && !reduce) {
    let frame = 0;
    let nextX = 0;
    let nextY = 0;
    visual.addEventListener("mousemove", function (event) {
      const rect = visual.getBoundingClientRect();
      nextX = (event.clientX - rect.left) / rect.width - 0.5;
      nextY = (event.clientY - rect.top) / rect.height - 0.5;
      if (frame) return;
      frame = requestAnimationFrame(function () {
        svg.style.transform = "translate3d(" + nextX * 8 + "px," + nextY * 6 + "px,0)";
        frame = 0;
      });
    });
    visual.addEventListener("mouseleave", function () {
      svg.style.transform = "none";
    });
  }

  return order;
})();
