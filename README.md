# WebTemp: The PHP Boilerplate 🚀
> **A fast, minimal, and organized PHP/HTML template designed for rapid web development.**
> Fully equipped with basic routing and a simple, **rich set of frontend plugins for enhanced UI/UX.**

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

WebTemp comes packed with these essential and useful frontend libraries to accelerate your development, organized by their primary function:

### Core Frameworks & UI
* **Bootstrap** (v3.x - for responsive design and UI components)
* **jQuery** (v1.x - for DOM manipulation and event handling)
* **jQuery UI** (for advanced UI widgets and interactions)
* **Animate.css** (for simple, pre-built CSS animations)

### Forms & Input Enhancements
* **Bootstrap Colorpicker**
* **Bootstrap Datepicker**
* **Bootstrap Inputmask**
* **Bootstrap Maxlength**
* **Bootstrap Touchspin**
* **Clockpicker**
* **Colorpicker**
* **Parsley.js** (for robust form validation)
* **Powerange** (for a beautiful range slider)
* **Select2** (for enhanced select box functionality)
* **Timepicker**
* **X-editable** (for in-place editing)

### Rich Text & File Management
* **Dropify** (for elegant file uploads)
* **Summernote** (lightweight WYSIWYG editor)
* **TinyMCE** (advanced WYSIWYG editor)

### Charts & Data Visualization
* **C3** (D3.js-based charts)
* **Chart.js** (simple, yet flexible JavaScript charting)
* **Chartist** (responsive, lean charts)
* **D3.js** (powerful data-driven documents library)
* **Flot Chart** (jQuery plotting library)
* **Morris.js** (beautiful charts using Raphael)
* **Raphael** (JavaScript vector graphics library, used by Morris.js)

### Tables & Data Grids
* **Datatables** (advanced table interactions: sorting, pagination, search)
* **RWD-Table-Patterns** (responsive tables)
* **Tabledit** (in-place table editing)

### Notifications & Modals
* **Alertify** (customizable JavaScript dialogs and notifications)
* **Magnific Popup** (fast, light, responsive lightbox)
* **SweetAlert2** (beautiful, responsive, customizable JavaScript alerts)

### Mapping & Location
* **GMaps** (jQuery plugin for Google Maps)
* **jVectorMap** (interactive maps)

### Calendars & Time
* **FullCalendar** (full-sized drag & drop event calendar)
* **Moment.js** (parse, validate, manipulate, and format dates)

### Miscellaneous UI Components
* **Bootstrap Rating** (star rating component)
* **Ion.RangeSlider** (nice and comfortable range slider)
* **jQuery Knob** (canvas-based rotary knob control)
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
