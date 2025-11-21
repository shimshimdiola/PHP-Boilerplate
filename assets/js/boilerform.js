function sendFormData(formId) {
  const form = document.getElementById(formId);
  const submitButton = form.querySelector("button[type='button']");

  // SELECT ALL INPUTS AND SELECTS
  const fields = form.querySelectorAll("input, select, textarea");
  let hasEmpty = false;

  // DISABLE BUTTON TO PREVENT MULTI-CLICK
  submitButton.disabled = true;

  // CLEAR OLD ERROR MESSAGES
  form.querySelectorAll(".error-text").forEach((e) => e.remove());
  fields.forEach((field) => field.classList.remove("is-invalid"));

  // VALIDATION LOOP
  fields.forEach((field) => {

    // --- EMAIL VALIDATION ---
    if (field.type === "email" && field.value.trim() !== "") {
      const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailPattern.test(field.value)) {
        field.classList.add("is-invalid");

        const error = document.createElement("small");
        error.className = "text-danger error-text";
        error.innerText = "Please enter a valid email address";
        field.insertAdjacentElement("afterend", error);

        hasEmpty = true;
        return; // skip to next field
      }
    }

    // --- EMPTY VALIDATION ---
    if (field.value.trim() === "" || field.value === null) {
      field.classList.add("is-invalid");

      const error = document.createElement("small");
      error.className = "text-danger error-text";
      error.innerText = "This field is required";
      field.insertAdjacentElement("afterend", error);

      const style = document.createElement("style");
      style.textContent = `
        input.is-invalid,
        select.is-invalid,
        textarea.is-invalid {
            background-image: none !important;
        }
      `;
      document.head.appendChild(style);

      hasEmpty = true;
    }
  });

  if (hasEmpty) {
    submitButton.disabled = false;
    return;
  }

  // SEND DATA
  const formData = new FormData(form);
  formData.append("form_id", formId);

  const params = new URLSearchParams(formData).toString();

  const xhr = new XMLHttpRequest();
  xhr.open("POST", "api/server.php", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  xhr.onload = function () {
    submitButton.disabled = false;

    if (xhr.status === 200) {
      document.getElementById("response").innerHTML = xhr.responseText;
      swal("Updated!", "Your file has been updated.", "success");

      fields.forEach((field) => (field.value = ""));
    } else {
      document.getElementById("response").innerHTML = "Error: " + xhr.status;
      swal("Error!", "Error 404 not found.", "warning");
    }
  };

  xhr.onerror = function () {
    submitButton.disabled = false;
    swal("Error!", "Network error occurred.", "error");
  };

  xhr.send(params);
}
