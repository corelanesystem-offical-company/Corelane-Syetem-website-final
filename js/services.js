(function () {
  const home = document.getElementById("service-grid");
  const all = document.getElementById("service-catalog");
  if (!window.Corelane) return;
  function photoCard(item, idx) {
    if (!item.image) {
      return (
        '<a class="service-card" href="' +
        item.href +
        '"><h3>' +
        item.title +
        "</h3><p>" +
        item.description +
        "</p><em>Learn more</em></a>"
      );
    }
    const stem = item.image.replace(/\.jpg$/i, "");
    const alt = item.imageAlt || "";
    const loadingAttr = (idx != null && idx < 4) ? 'fetchpriority="high"' : 'loading="lazy"';
    return (
      '<a class="service-card service-card--photo" href="' +
      item.href +
      '"><span class="service-card__media"><picture><source type="image/webp" srcset="' +
      stem +
      "-800.webp 800w, " +
      stem +
      '.webp 1600w" sizes="(max-width: 639px) 100vw, 22rem"><img src="' +
      item.image +
      '" srcset="' +
      stem +
      "-800.jpg 800w, " +
      item.image +
      ' 1600w" width="1600" height="894" alt="' +
      alt +
      '" ' + loadingAttr + ' decoding="async"></picture></span><span class="service-card__body"><h3>' +
      item.title +
      "</h3><p>" +
      item.description +
      "</p><em>Learn more</em></span></a>"
    );
  }

  if (home) home.innerHTML = Corelane.services.map(photoCard).join("");
  if (all) all.innerHTML = Corelane.serviceCatalog.map(photoCard).join("");
  const industries = document.getElementById("industry-grid");
  if (industries && Corelane.industries) {
    industries.innerHTML = Corelane.industries.map(photoCard).join("");
  }

  const work = document.getElementById("work-grid");
  if (work) {
    work.innerHTML = Corelane.work.map(function (item, idx) {
        const loadingAttr = idx < 3 ? 'fetchpriority="high"' : 'loading="lazy"';
        const img = item.image;
        const href = item.href;
        const jpg800 = img.replace(".jpg", "-800.jpg");
        const webp = img.replace(".jpg", ".webp");
        const webp800 = img.replace(".jpg", "-800.webp");
        const contain = "";
        const flag = item.flag || "Project type";
        const cta = item.cta || "View this work";
        const alt = item.imageAlt || "";
        return (
          '<article class="work-card"><div class="media-frame' +
          contain +
          '"><picture><source type="image/webp" srcset="' +
          webp800 +
          " 800w, " +
          webp +
          ' 1600w" sizes="(max-width: 639px) 100vw, 30rem"><img src="' +
          img +
          '" srcset="' +
          jpg800 +
          " 800w, " +
          img +
          ' 1600w" sizes="(max-width: 639px) 100vw, 30rem" width="1600" height="894" alt="' +
          alt +
          '" ' + loadingAttr + ' decoding="async"></picture></div><div class="work-card__body"><span class="sample-flag">' +
          flag +
          '</span><span class="work-card__label">' +
          item.category +
          "</span><h3>" +
          item.title +
          "</h3><p>" +
          item.description +
          '</p><a class="btn btn--ghost" href="' +
          href +
          '">' +
          cta +
          "</a></div></article>"
        );
      })
      .join("");
  }
})();