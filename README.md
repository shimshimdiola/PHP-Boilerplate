# WebTemp

A PHP / HTML based web template project with a simple login feature.

## Getting Started
1. Run on local server (XAMPP, WAMP, or PHP built-in server).
2. Visit \`http://localhost/WebTemp/\`.

## Structure
- layouts/ → header, footer, base layouts
- partials/ → reusable UI parts
- pages/ → content pages (including login/logout)
- assets/ → CSS, JS, images, fonts, media
- include/ → helper functions
- db/ → database connection
- config/ → site configuration

## Database Setup
Run this SQL snippet in your **phpMyAdmin** or MySQL CLI:

\`\`\`sql
CREATE DATABASE webtemp;

USE webtemp;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Note: We are using MD5 for simplicity to match this SQL setup. 
-- For production, always use PHP's password_hash() and password_verify().
INSERT INTO users (name, email, password)
VALUES ('Admin', 'admin@example.com', MD5('password123'));
\`\`\`

✅ This will create a **users table** with a sample admin account.
