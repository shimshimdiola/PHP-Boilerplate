function sendFormData(formId) {
  const form = document.getElementById(formId);
  const formData = new FormData(form);

  // ✅ Add form_id manually so PHP can detect it
  formData.append('form_id', formId);

  // Convert to URL-encoded string
  const params = new URLSearchParams(formData).toString();

  const xhr = new XMLHttpRequest();
  xhr.open("POST", "api/server.php", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  xhr.onload = function () {
    if (xhr.status === 200) {
      document.getElementById("response").innerHTML = xhr.responseText;
    } else {
      document.getElementById("response").innerHTML = "Error: " + xhr.status;
    }
  };

  xhr.send(params);
}
