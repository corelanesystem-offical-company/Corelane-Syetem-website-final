(function () {
  function emailOk(value) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
  }

  function bind(form) {
    const status = form.querySelector(".form-status");
    const submit = form.querySelector("[type=submit]");
    form.addEventListener("submit", function (event) {
      event.preventDefault();
      form.querySelectorAll(".field-error").forEach(function (n) { n.remove(); });
      form.querySelectorAll("[required], [type=email]").forEach(function (field) {
        field.removeAttribute("aria-invalid");
        field.removeAttribute("aria-describedby");
      });
      let valid = true;
      form.querySelectorAll("[required]").forEach(function (field) {
        const empty = !field.value.trim();
        const badEmail = field.type === "email" && field.value && !emailOk(field.value.trim());
        if (empty || badEmail) {
          valid = false;
          const msg = document.createElement("span");
          msg.className = "field-error";
          msg.id = (field.id || field.name) + "-error";
          msg.textContent = empty ? "This field is required." : "Enter a valid email address.";
          field.setAttribute("aria-invalid", "true");
          field.setAttribute("aria-describedby", msg.id);
          field.insertAdjacentElement("afterend", msg);
        }
      });
      if (!status) return;
      status.classList.remove("is-success", "is-error");
      if (!valid) {
        status.classList.add("is-error");
        status.textContent = "Please correct the highlighted fields.";
        const first = form.querySelector("[aria-invalid=true]");
        if (first) first.focus();
        return;
      }
      if (submit) {
        submit.disabled = true;
        submit.setAttribute("aria-busy", "true");
      }
      window.setTimeout(function () {
        if (submit) {
          submit.disabled = false;
          submit.removeAttribute("aria-busy");
        }
        status.classList.add("is-success");
        status.textContent =
          "Details look valid. This site does not store submissions yet — email corelanesystem@gmail.com or WhatsApp +92 301 2756091.";
        form.reset();
      }, 400);
    });
  }

  document.querySelectorAll("form[data-validate]").forEach(bind);
})();
