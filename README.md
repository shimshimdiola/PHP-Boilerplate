# WebTemp: The PHP Boilerplate 🚀

> **A fast, minimal, and organized PHP/HTML template designed for rapid web development.**
> Fully equipped with basic routing and a simple, session-based login system.

## ✨ Project Status
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Technology](https://img.shields.io/badge/Technology-PHP%20%7C%20MySQL-7777BB.svg)]()
[![Login Feature](https://img.shields.io/badge/Auth-Simple%20Session%20Login-yellowgreen.svg)]()

---

## 🚀 Getting Started

1.  **Prerequisites:** Ensure you have a local server stack (e.g., **XAMPP**, **MAMP**, **WAMP**) running PHP and MySQL.
2.  **Setup:** Place the **`WebTemp/`** directory in your web server's root folder (`htdocs` or `www`).
3.  **Run:** Visit **`http://localhost/WebTemp/`** in your browser.

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
```

### 🔑 Default Login Credentials

Use the following credentials to test the authentication flow:

```
Email: admin@example.com
Password: password123
```
