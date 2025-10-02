# WebTemp: The PHP Boilerplate 🚀

> **A fast, minimal, and organized PHP/HTML template designed for rapid web development.**
> Fully equipped with basic routing and a simple, session-based login system.

## ✨ Project Status
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Technology](https://img.shields.io/badge/Technology-PHP%20%7C%20MySQL-7777BB.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Included-green.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Frontend%20Libraries-blue.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Core%20UI%2FUX-orange.svg)]()
[![Plugins](https://img.shields.io/badge/Plugins-Bootstrap%20%26%20jQuery-8A2BE2.svg)]()
---

## 🚀 Getting Started

1.  **Prerequisites:** Ensure you have a local server stack (e.g., **XAMPP**, **MAMP**, **WAMP**) running PHP and MySQL.
2.  **Setup:** Place the **`WebTemp/`** directory in your web server's root folder (`htdocs` or `www`).
3.  **Run:** Visit **`http://localhost/WebTemp/`** in your browser.

---

## 🗂️ Project Structure at a Glance

A clean separation of concerns makes development easy:

| Directory | Purpose |
| :--- | :--- |
| **`layouts/`** | Primary HTML structure: header, footer, base. |
| **`partials/`** | Reusable UI components: navigation, meta tags, sidebars. |
| **`pages/`** | Application content and routing entry points. |
| **`assets/`** | Frontend resources: CSS, JS, images, fonts. |
| **`include/`** | PHP helper functions (**`functions.php`**). |
| **`config/`** | Site-wide settings (**`config.php`**). |
| **`db/`** | Database connection logic (**`connection.php`**). |

---

## 🔌 Included Frontend Libraries / Plugins

WebTemp comes packed with these essential and useful frontend libraries to accelerate your development:

* **Alertify**
* **Animate.css**
* **Bootstrap**
* **Bootstrap Colorpicker**
* **Bootstrap Datepicker**
* **Bootstrap Inputmask**
* **Bootstrap Maxlength**
* **Bootstrap Rating**
* **Bootstrap Touchspin**
* **C3 (D3.js-based Charts)**
* **Chart.js**
* **Chartist**
* **Clockpicker**
* **Colorpicker**
* **D3.js**
* **Datatables**
* **Dropify**
* **Flot Chart**
* **FullCalendar**
* **GMaps**
* **Ion.RangeSlider**
* **jQuery Knob**
* **jQuery UI**
* **jVectorMap**
* **Magnific Popup**
* **Moment.js**
* **Morris.js (Charts)**
* **Parsley.js (Form Validation)**
* **Powerange**
* **Raphael (Vector Graphics Library)**
* **RWD-Table-Patterns**
* **Select2**
* **Summernote (WYSIWYG Editor)**
* **SweetAlert2**
* **Tabledit**
* **Timepicker**
* **TinyMCE (WYSIWYG Editor)**
* **X-editable**

---

## 🔑 Database Setup (MySQL)

You must run the SQL snippet below in your **phpMyAdmin**, MySQL Workbench, or CLI to enable the login feature.

### 💾 SQL Snippet

```sql
CREATE DATABASE webtemp;

USE webtemp;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email, password)
VALUES ('Admin', 'admin@example.com', MD5('password123'));
````
