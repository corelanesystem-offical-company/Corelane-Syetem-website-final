document.addEventListener("DOMContentLoaded", function () {
  /* Feature scripts load separately and attach themselves. */
  
  // Floating Contact Button
  if (!window.location.pathname.includes("contact.html")) {
    const fab = document.createElement("a");
    // Handle root vs /pages/ paths correctly
    const isRoot = window.location.pathname.endsWith("/") || window.location.pathname.endsWith("index.html") || !window.location.pathname.includes(".html");
    fab.href = isRoot ? "pages/contact.html" : "contact.html";
    // Always use absolute path for safety if possible, or relative to root:
    fab.href = "/pages/contact.html";
    
    fab.className = "floating-contact";
    fab.setAttribute("aria-label", "Contact Us");
    fab.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>';
    document.body.appendChild(fab);
  }
});