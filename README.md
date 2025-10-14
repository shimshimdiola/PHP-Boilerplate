
# WebTemp: The PHP Boilerplate 🚀
> **A fast, minimal, and organized PHP/HTML template designed for rapid web development.**  
> ⚡ Equipped with routing, database setup, and **AJAX-driven multi-form handling** for real-time interactions.

---

## ✨ Project Status
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Technology](https://img.shields.io/badge/Technology-PHP%20%7C%20MySQL-7777BB.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Included-green.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Frontend%20Libraries-blue.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Core%20UI%2FUX-orange.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Bootstrap%20%26%20jQuery-8A2BE2.svg)]()

---

## ✨ Features
- ⚡ Lightweight PHP + Bootstrap boilerplate
- 🗂️ Organized MVC-style folder structure
- 🎨 Built-in frontend plugins for enhanced UI/UX
- 💬 **AJAX Form Submission (3 forms simulated)**
- 🧠 Demo of INSERT / UPDATE / SELECT actions via form ID
- 🛠️ Ready-to-connect MySQL configuration

---

## 🚀 Getting Started

### Prerequisites
Ensure the following are installed:
- **PHP 7+** (via [XAMPP](https://www.apachefriends.org/), [MAMP](https://www.mamp.info/), or [WAMP](https://www.wampserver.com/en/))
- **MySQL / MariaDB** (included with most local stacks)

### Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/shimshimdiola/PHP-Boilerplate.git


2. Navigate to the project:

   ```bash
   cd PHP-Boilerplate
   ```
3. Move the folder to your web root (e.g. `htdocs/WebTemp`)
4. Run in your browser:

   ```
   http://localhost/WebTemp/
   ```

---

## 🗂️ Folder Structure Overview

| Directory       | Description                                            |
| :-------------- | :----------------------------------------------------- |
| **`layouts/`**  | Core HTML layout files (header, footer, base)          |
| **`partials/`** | Shared UI components (navigation, sidebars, meta tags) |
| **`pages/`**    | Content pages and routes                               |
| **`assets/`**   | Frontend resources: CSS, JS, images, fonts             |
| **`include/`**  | PHP utility scripts (e.g., `functions.php`)            |
| **`config/`**   | Site configuration (e.g., `config.php`)                |
| **`db/`**       | Database connection logic                              |

---

## 🧠 AJAX Boiler Forms (Insert / Update / Select)

This boilerplate comes with **three forms**, each dynamically handled by a single AJAX script.

### 💡 HTML Example

```html
<div class="row">
  <div class="col-md-12 offset-md-2">

    <h2>Form 1</h2>
    <form id="form1" class="col-md-4 mb-4 p-3 border rounded shadow-sm">
      <input class="form-control form-control-sm mb-2" type="text" name="name" placeholder="Name">
      <input class="form-control form-control-sm mb-2" type="text" name="contact_no" placeholder="Contact No">
      <input class="form-control form-control-sm mb-2" type="email" name="email" placeholder="Email">
      <input type="hidden" name="form_id" value="form1">
      <button class="btn btn-success" type="button" onclick="sendFormData('form1')">Submit Form 1</button>
    </form>

    <h2>Form 2</h2>
    <form id="form2" class="col-md-4 mb-4 p-3 border rounded shadow-sm">
      <input class="form-control form-control-sm mb-2" type="text" name="fname" placeholder="First Name">
      <input class="form-control form-control-sm mb-2" type="text" name="lname" placeholder="Last Name">
      <input type="hidden" name="form_id" value="form2">
      <button class="btn btn-success" type="button" onclick="sendFormData('form2')">Submit Form 2</button>
    </form>

    <h2>Form 3</h2>
    <form id="form3" class="col-md-4 mb-4 p-3 border rounded shadow-sm">
      <input class="form-control form-control-sm mb-2" type="text" name="fname" placeholder="First Name">
      <input class="form-control form-control-sm mb-2" type="text" name="lname" placeholder="Last Name">
      <input class="form-control form-control-sm mb-2" type="text" name="mname" placeholder="Middle Name">
      <input type="hidden" name="form_id" value="form3">
      <button class="btn btn-success" type="button" onclick="sendFormData('form3')">Submit Form 3</button>
    </form>

    <h3 class="mt-5">Response Data:</h3>
    <p id="response" class="alert alert-info"></p>

  </div>
</div>
```

---

### ⚙️ JavaScript (assets/js/boilerform.js)

```js
function sendFormData(formId) {
  const form = document.getElementById(formId);
  const formData = new FormData(form);

  fetch('ajax/handler.php', {
    method: 'POST',
    body: formData
  })
  .then(response => response.text())
  .then(data => {
    document.getElementById('response').innerHTML = data;
  })
  .catch(error => {
    document.getElementById('response').innerHTML = 'Error: ' + error;
  });
}
```

---

### 🧩 PHP Handler (api/server.php)

```php
<?php
if (!empty($_POST)) {
    $formId = $_POST['form_id'] ?? 'unknown';
    echo "<b>Data received from {$formId}:</b><br>";

    foreach ($_POST as $key => $value) {
        if ($key !== 'form_id') {
            echo htmlspecialchars($key) . ": " . htmlspecialchars($value) . "<br>";
        }
    }

    echo "<br><b>Action Result:</b><br>";

    switch ($formId) {
        case 'form1':
            echo "👉 This data would be INSERTED (Form 1 logic simulated).";
            break;
        case 'form2':
            echo "🛠️ This data would be UPDATED (Form 2 logic simulated).";
            break;
        case 'form3':
            echo "🔍 This data would be SELECTED (Form 3 logic simulated).";
            break;
        default:
            echo "❓ Unknown form — no simulated action.";
            break;
    }

    echo "<hr>";
} else {
    echo "No data received.";
}
?>
```

✅ **How It Works:**

* Each form submits to the same PHP handler.
* The `form_id` hidden input identifies which form sent the data.
* The backend simulates database logic:

  * **Form 1 → INSERT**
  * **Form 2 → UPDATE**
  * **Form 3 → SELECT**
* Results are dynamically shown inside the page’s response container.

---

## 🔌 Included Frontend Libraries / Plugins

### Core Frameworks

* Bootstrap
* jQuery
* jQuery UI
* Animate.css

### Forms & Input Enhancements

* Parsley.js (validation)
* Select2 (enhanced selects)
* Bootstrap Inputmask
* Datepicker, Timepicker, Touchspin
* Dropify (file uploads)
* Summernote, TinyMCE (text editors)

### Charts & Visualization

* Chart.js, C3, Chartist, Morris.js, D3.js

### Tables

* Datatables, Tabledit, RWD-Table-Patterns

### Notifications

* SweetAlert2, Alertify, Magnific Popup

### Misc

* FullCalendar, Moment.js, jVectorMap, Ion.RangeSlider

---

## 🔑 Database Setup (Optional Demo)

```sql
CREATE DATABASE boilerplate_db;

USE boilerplate_db;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  password VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 📄 License

Licensed under the [MIT License](https://opensource.org/licenses/MIT).

---

## 💡 Author

**Kian Shim Diola**
📧 [shimshimdiola@example.com](mailto:shimshimdiola@example.com)
🌐 [GitHub: shimshimdiola](https://github.com/shimshimdiola)

---

## 🧭 Roadmap

* [ ] Add real DB integration for form actions
* [ ] Build login/register modules
* [ ] Add REST API endpoints
* [ ] Create CRUD generator

---
