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

This section will guide you through setting up WebTemp on your local machine.

### Prerequisites
Before you begin, ensure you have the following installed:
-   **PHP**: A local server stack like [XAMPP](https://www.apachefriends.org/), [MAMP](https://www.mamp.info/en/downloads/), or [WAMP](https://www.wampserver.com/en/) (which includes PHP and Apache).
-   **MySQL / MariaDB**: For database management (usually included with XAMPP/MAMP/WAMP).

### Installation
1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/shimshimdiola/PHP-Boilerplate.git](https://github.com/shimshimdiola/PHP-Boilerplate.git) # Replace with your actual repo URL if different
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd PHP-Boilerplate
    ```
3.  **Place in your web server:** Move the cloned `PHP-Boilerplate` directory into your web server's root folder (e.g., `htdocs` for XAMPP, `www` for WAMP). You might want to rename it to `WebTemp` or your desired project name.
4.  **Run:** Visit `http://localhost/WebTemp/` (or your chosen directory name) in your browser.

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
<hr>
<div align="center">
    <a href="https://github.com/shimshimdiola">
        <img 
            src="https://avatars.githubusercontent.com/u/72088468?v=4" 
            alt="Shimshimdiola" 
            width="110" 
            style="border-radius: 50%; box-shadow: 0 4px 8px rgba(0,0,0,0.15);"
        >
    </a>
    <br>
    <h3>**Kian Shim Diola**</h3>
    <p style="color: #555;">*Creator & Primary Maintainer*</p>
</div>

<!-- <br>
<hr>
<br> -->

<!-- <div align="center">
    <table align="center" style="width: 100%; max-width: 800px; border-collapse: separate; border-spacing: 20px 0;">
        <tr>
            <td align="center" style="padding: 10px;">
                <a href="https://github.com/COLLAB_1_USERNAME">
                    <img src="https://avatars.githubusercontent.com/u/106507975?v=4" width="90" alt="Collaborator 1" style="border-radius: 50%;">
                </a>
                <br>
                <strong style="font-size: 1.1em;">Ivan Dancil</strong>
                <br>
                <span style="color: #666; font-size: 0.9em;">*Lead Backend Developer*</span> 
            </td>
            <td align="center" style="padding: 10px;">
                <a href="https://github.com/COLLAB_2_USERNAME">
                    <img src="https://avatars.githubusercontent.com/u/69681725?v=4" width="90" alt="Collaborator 2" style="border-radius: 50%;">
                </a>
                <br>
                <strong style="font-size: 1.1em;">COLLAB 2 NAME</strong>
                <br>
                <span style="color: #666; font-size: 0.9em;">*Frontend UI/UX Specialist*</span>
            </td>
            <td align="center" style="padding: 10px;">
                <a href="https://github.com/COLLAB_3_USERNAME">
                    <img src="https://avatars.githubusercontent.com/u/1106705?v=4" width="90" alt="Collaborator 3" style="border-radius: 50%;">
                </a>
                <br>
                <strong style="font-size: 1.1em;">COLLAB 3 NAME</strong>
                <br>
                <span style="color: #666; font-size: 0.9em;">*Documentation & Setup*</span>
            </td>
        </tr>
    </table>
</div> -->
