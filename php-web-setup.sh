#!/bin/bash
# setup2.sh - Build WebTemp PHP project structure with DB connection and Login feature
# Author: shimshimdiola

APP_NAME="WebTemp"

echo "🔨 Setting up WebTemp project structure with modern design updates..."

# === Create directories (ensure all exist) ===
mkdir -p $APP_NAME/{layouts,partials,pages/{about,contact,services,login,logout,login_handler},assets/{css,js,images/{banners,icons},fonts,media},include,db,config}

# === Root files ===
cat > $APP_NAME/README.md <<'EOF'
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
EOF

echo "node_modules/" > $APP_NAME/.gitignore
echo "RewriteEngine On" > $APP_NAME/.htaccess

# index.php (UPDATED: Modern landing page with feature showcase and credentials)
cat > $APP_NAME/index.php <<'EOF'
<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/db/connection.php';
require_once __DIR__ . '/include/functions.php';

include 'layouts/header.php';
?>

<div class="content-wrapper">
    <?php include 'partials/nav.php'; ?>
    <main>
        <div class="hero">
            <h1><?php echo SITE_NAME; ?>: A Fast-Track PHP Template</h1>
            <p class="tagline">The boilerplate for developers who value **simplicity, speed, and clean architecture**.</p>
            <a href="page.php?p=about" class="btn-primary hero-btn">Explore Features →</a>
        </div>

        <section class="info-section template-info">
            <h2>Start Building in Minutes</h2>
            <p>WebTemp provides a ready-to-run foundation, eliminating repetitive setup tasks. Focus instantly on your core application logic.</p>
            
            <div class="feature-grid">
                <div class="feature-card">
                    <h3>📁 Organized Structure</h3>
                    <p>Clear separation of layouts, partials, and pages for maintainable code.</p>
                </div>
                <div class="feature-card">
                    <h3>⚡ Simple Routing</h3>
                    <p>The <code>page.php?p=name</code> system handles navigation without complex frameworks.</p>
                </div>
                <div class="feature-card">
                    <h3>🔒 Basic Auth Included</h3>
                    <p>A functional login/logout feature with database connection already configured.</p>
                </div>
            </div>
        </section>
        
        <section class="info-section login-details">
            <h2>🔑 Authentication & Database Setup</h2>
            <?php if (isUserLoggedIn()): ?>
                <div class="login-status success">
                    <h3>🎉 You are currently logged in!</h3>
                    <p>You can access user-specific pages and features now. Click 'Logout' in the navigation to test the login process again.</p>
                </div>
            <?php else: ?>
                <div class="login-status warning">
                    <p>To test the login feature, use the credentials below. **Remember to run the SQL in <code>README.md</code> first!**</p>
                    <table class="credentials-table">
                        <tr><td>**Email:**</td><td><code>admin@example.com</code></td></tr>
                        <tr><td>**Password:**</td><td><code>password123</code></td></tr>
                    </table>
                    <p class="login-prompt">
                        <a href="page.php?p=login">Click here to log in →</a>
                    </p>
                </div>
            <?php endif; ?>
        </section>
    </main>
</div>

<?php include 'layouts/footer.php'; ?>
EOF

# page.php (Router)
cat > $APP_NAME/page.php <<'EOF'
<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/db/connection.php';
require_once __DIR__ . '/include/functions.php';

$page = $_GET['p'] ?? 'about';
$file = __DIR__ . "/pages/$page/index.php";

// Special handler for the login submission logic
if ($page === 'login_handler') {
    include __DIR__ . "/pages/login_handler/index.php";
    exit(); // Stop execution after handling login logic
}


include 'layouts/header.php';
?>
<div class="content-wrapper">
    <?php include 'partials/nav.php'; ?>

<?php
if (preg_match('/^[a-zA-Z0-9_-]+$/', $page) && file_exists($file)) {
    include $file;
} else {
    echo "<main><h2>404 - Page Not Found</h2></main>";
}
?>
</div>
<?php include 'layouts/footer.php'; ?>
EOF

# === Layouts ===
# header.php
cat > $APP_NAME/layouts/header.php <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?php echo SITE_NAME; ?></title>
  <link rel="stylesheet" href="assets/css/main.css">
  <?php include __DIR__ . '/../partials/meta.php'; ?>
</head>
<body>
<header class="main-header">
  <div class="logo-container">
    <img src="assets/images/logo.png" alt="Logo" width="40">
    <span class="site-title"><?php echo SITE_NAME; ?></span>
  </div>
</header>
EOF

# footer.php
cat > $APP_NAME/layouts/footer.php <<'EOF'
  <footer>
    <p>&copy; <?php echo getCurrentYear(); ?> <?php echo SITE_NAME; ?>. All rights reserved.</p>
  </footer>
  <script src="assets/js/main.js"></script>
</body>
</html>
EOF

cat > $APP_NAME/layouts/base.php <<'EOF'
<?php
  include 'header.php';
  echo "<div class='content-wrapper'><main><h1>Base Layout Example</h1></main></div>";
  include 'footer.php';
?>
EOF

# === Partials ===
# nav.php
cat > $APP_NAME/partials/nav.php <<'EOF'
<?php require_once __DIR__ . '/../include/functions.php'; ?>
<nav class="main-nav">
  <ul>
    <li><a href="index.php">Home</a></li>
    <li><a href="page.php?p=about">About</a></li>
    <li><a href="page.php?p=contact">Contact</a></li>
    <li><a href="page.php?p=services">Services</a></li>
    <?php if (isUserLoggedIn()): ?>
        <li class="auth-link"><a href="page.php?p=logout">Logout</a></li>
    <?php else: ?>
        <li class="auth-link"><a href="page.php?p=login">Login</a></li>
    <?php endif; ?>
  </ul>
</nav>
EOF

cat > $APP_NAME/partials/sidebar.php <<'EOF'
<aside class="sidebar">
  <h3>Sidebar</h3>
  <p>Additional links or information can go here.</p>
</aside>
EOF

cat > $APP_NAME/partials/meta.php <<'EOF'
<meta name="description" content="WebTemp template project">
<meta name="author" content="shimshimdiola">
EOF

# === Standard Pages ===
cat > $APP_NAME/pages/about/index.php <<'EOF'
<div class="page-content-grid">
    <main>
        <h2>About Us</h2>
        <p>This is the About page. We are dedicated to providing a clean, easy-to-use boilerplate for simple PHP development projects.</p>
    </main>
    <?php include __DIR__ . '/../../partials/sidebar.php'; ?>
</div>
EOF

cat > $APP_NAME/pages/contact/index.php <<'EOF'
<main>
  <h2>Contact Us</h2>
  <p>For inquiries, please reach out to us:</p>
  <p>Email: <a href="mailto:shimshimdiola@gmail.com">Kian shim Diola</a></p>
</main>
EOF

cat > $APP_NAME/pages/services/index.php <<'EOF'
<main>
  <h2>Our Services</h2>
  <ul class="service-list">
    <li>🚀 Web Development (Fast Prototyping)</li>
    <li>📱 App Development (Minimalist Backend)</li>
    <li>🎨 UI/UX Design (Wireframing Support)</li>
  </ul>
</main>
EOF

# === Login Pages ===
# pages/login/index.php (Login Form)
cat > $APP_NAME/pages/login/index.php <<'EOF'
<?php
if (isUserLoggedIn()) {
    redirect('index.php');
}

$error_message = '';
if (isset($_SESSION['login_error'])) {
    $error_message = $_SESSION['login_error'];
    unset($_SESSION['login_error']);
}
?>
<main class="login-page">
    <h2>User Login</h2>

    <?php if ($error_message): ?>
        <div class="login-status error">
            <p><?php echo htmlspecialchars($error_message); ?></p>
        </div>
    <?php endif; ?>

    <form method="POST" action="page.php?p=login_handler" class="login-form">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn-primary">Log In</button>
    </form>
    <p><small>Hint: Use 'admin@example.com' and 'password123'</small></p>
</main>
EOF

# pages/login_handler/index.php (Login Logic)
cat > $APP_NAME/pages/login_handler/index.php <<'EOF'
<?php
// This page is for processing the form, not for direct viewing.
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    redirect('index.php');
}

// DB connection and functions are already included via page.php

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if (empty($email) || empty($password)) {
    $_SESSION['login_error'] = "Email and password are required.";
    redirect('page.php?p=login');
}

// Prepare and execute the SQL statement
$stmt = $conn->prepare("SELECT id, password FROM users WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
    
    // MD5 comparison (matches the SQL in README.md)
    if (MD5($password) === $user['password']) {
        // Successful login: Set session variables
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_email'] = $email;

        // Redirect to homepage
        redirect('index.php');
    } else {
        // Password mismatch
        $_SESSION['login_error'] = "Invalid password.";
        redirect('page.php?p=login');
    }
} else {
    // User not found
    $_SESSION['login_error'] = "User with that email address not found.";
    redirect('page.php?p=login');
}

$stmt->close();
// Note: We don't close $conn here as page.php might use it later, 
// but in a proper architecture, this file would manage its own connection or be outside the layout.
// For this example, it's ok.
?>
EOF

# pages/logout/index.php (Logout Logic)
cat > $APP_NAME/pages/logout/index.php <<'EOF'
<?php
// Ensure session is started (via config.php)
require_once __DIR__ . '/../../include/functions.php';

// Destroy the session
$_SESSION = array(); // Clear all session variables
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}
session_destroy();

// Redirect to home page
redirect('index.php');
?>
EOF

# === Assets ===
# main.css (MODIFIED: Added styles for feature grid, buttons, and credentials table)
cat > $APP_NAME/assets/css/main.css <<'EOF'
:root {
    --primary-color: #007bff;
    --secondary-color: #6c757d;
    --background-color: #f8f9fa;
    --text-color: #343a40;
    --success-color: #28a745;
    --warning-color: #ffc107;
    --error-color: #dc3545;
    --border-radius: 5px;
    --card-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: var(--background-color);
    color: var(--text-color);
    line-height: 1.6;
}

/* Header */
.main-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 40px;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}
.logo-container {
    display: flex;
    align-items: center;
    gap: 10px;
}
.site-title {
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--primary-color);
}
.main-header img {
    border-radius: var(--border-radius);
}

/* Navigation */
.main-nav {
    padding: 0;
    background: var(--secondary-color);
    margin-bottom: 20px;
}
.main-nav ul {
    display: flex;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    gap: 25px;
    list-style: none;
}
.main-nav ul li a {
    color: white;
    text-decoration: none;
    padding: 15px 0;
    display: block;
    transition: background-color 0.3s;
}
.main-nav ul li a:hover {
    color: var(--warning-color);
}
.main-nav .auth-link a {
    font-weight: bold;
}

/* Content Layout */
.content-wrapper {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}
main {
    padding: 20px 0;
    background: #fff;
    border-radius: var(--border-radius);
    box-shadow: 0 0 10px rgba(0,0,0,0.05);
    min-height: 60vh;
}
main h1, main h2 {
    color: var(--primary-color);
    border-bottom: 2px solid rgba(0, 123, 255, 0.1);
    padding-bottom: 10px;
    margin: 0 20px 20px 20px;
}
.hero {
    padding: 40px 20px;
    text-align: center;
    background: linear-gradient(to right, #e9ecef, #ffffff);
    margin-bottom: 30px;
    border-radius: var(--border-radius) var(--border-radius) 0 0;
}
.tagline {
    font-size: 1.2rem;
    color: var(--secondary-color);
}
.info-section {
    padding: 0 20px 20px 20px;
}
.service-list li {
    background: var(--background-color);
    padding: 10px;
    margin-bottom: 8px;
    border-left: 4px solid var(--primary-color);
    border-radius: var(--border-radius);
}

/* Login Status Messages */
.login-status {
    padding: 15px;
    margin-top: 20px;
    border-radius: var(--border-radius);
    font-weight: 500;
}
.login-status.success {
    background-color: rgba(40, 167, 69, 0.1);
    color: var(--success-color);
    border: 1px solid var(--success-color);
}
.login-status.warning {
    background-color: rgba(255, 193, 7, 0.1);
    color: #856404; /* Darker text for readability */
    border: 1px solid var(--warning-color);
}
.login-status.error {
    background-color: rgba(220, 53, 69, 0.1);
    color: var(--error-color);
    border: 1px solid var(--error-color);
}
.login-status a {
    color: var(--primary-color);
    text-decoration: none;
    font-weight: bold;
}

/* Forms */
.login-form .form-group {
    margin-bottom: 15px;
    display: flex;
    flex-direction: column;
    width: 300px; /* Constrain form width */
    margin-left: 20px;
}
.login-form label {
    font-weight: 600;
    margin-bottom: 5px;
}
.login-form input[type="email"],
.login-form input[type="password"] {
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: var(--border-radius);
    font-size: 1rem;
}

/* Button & Links */
.btn-primary {
    background-color: var(--primary-color);
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: var(--border-radius);
    cursor: pointer;
    transition: background-color 0.3s;
    /* Default form width, overriden below for hero */
    width: 300px; 
    margin-left: 20px;
    display: inline-block;
    text-decoration: none;
    text-align: center;
}
.btn-primary:hover {
    background-color: #0056b3;
}
.hero-btn {
    width: auto; /* Override form width for hero button */
    margin: 20px auto 0;
    padding: 12px 30px;
    font-size: 1.1rem;
}

/* Sidebar Layout for Pages */
.page-content-grid {
    display: grid;
    grid-template-columns: 3fr 1fr;
    gap: 30px;
    padding: 0 20px;
}
.sidebar {
    background: var(--background-color);
    padding: 15px;
    border-radius: var(--border-radius);
    height: fit-content;
}
.sidebar h3 {
    color: var(--primary-color);
    margin-top: 0;
}

/* Footer */
footer {
    text-align: center;
    background: var(--secondary-color);
    padding: 20px;
    color: #ffffff;
    margin-top: 30px;
}

/* --- NEW STYLES FOR MODERN LANDING PAGE --- */

.feature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
    margin-top: 30px;
}

.feature-card {
    background-color: var(--background-color);
    padding: 20px;
    border-radius: var(--border-radius);
    box-shadow: var(--card-shadow);
    transition: transform 0.2s;
}

.feature-card:hover {
    transform: translateY(-5px);
}

.feature-card h3 {
    color: var(--primary-color);
    margin-top: 0;
    font-size: 1.2rem;
    border-bottom: none;
    padding-bottom: 0;
    margin-left: 0;
}

.login-details {
    padding-bottom: 40px;
}

.credentials-table {
    width: 100%;
    max-width: 400px;
    margin: 15px 0;
    border-collapse: collapse;
}

.credentials-table td {
    padding: 8px 12px;
    border: 1px solid rgba(0,0,0,0.1);
    background-color: #fff;
}

.credentials-table tr:first-child td {
    border-top: none;
}
.credentials-table tr:last-child td {
    border-bottom: none;
}
.credentials-table tr td:first-child {
    font-weight: 600;
    background-color: #f1f1f1;
}

.login-prompt {
    margin-top: 15px;
    font-size: 1.1rem;
}
.login-prompt a {
    text-decoration: none;
}
.login-status .credentials-table {
    background-color: transparent; /* Reset background for table inside warning box */
}
.login-status.warning .credentials-table td {
    border-color: rgba(133, 100, 4, 0.3); /* Match warning color */
}
EOF

cat > $APP_NAME/assets/js/main.js <<'EOF'
document.addEventListener("DOMContentLoaded", () => {
  console.log("✅ WebTemp loaded! Design updated to modern standard.");
});
EOF

touch $APP_NAME/assets/css/vendor.css $APP_NAME/assets/js/vendor.js
touch $APP_NAME/assets/images/logo.png

# === Include + DB + Config ===
# functions.php
cat > $APP_NAME/include/functions.php <<'EOF'
<?php
function greet($name) {
  return "👋 Hello, " . htmlspecialchars($name);
}

function getCurrentYear() {
  return date("Y");
}

/**
 * Checks if a user is currently logged in.
 * @return bool
 */
function isUserLoggedIn() {
    return isset($_SESSION['user_id']);
}

/**
 * Redirects the user to a specified page.
 * @param string $path The page to redirect to (e.g., 'index.php').
 */
function redirect($path) {
    header("Location: " . BASE_URL . $path);
    exit();
}
?>
EOF

cat > $APP_NAME/db/connection.php <<'EOF'
<?php
$host = "localhost";
$user = "root";
$pass = "";
$db  = "webtemp";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
  die("❌ Database Connection failed: " . $conn->connect_error);
}
?>
EOF

# config.php
cat > $APP_NAME/config/config.php <<'EOF'
<?php
// Start a session for user management
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

define("SITE_NAME", "WebTemp");
define("BASE_URL", "http://localhost/WebTemp/");
?>
EOF

echo "✅ WebTemp project created in $APP_NAME/ with a modern layout and clear builder message."
echo "⚠️ IMPORTANT: Run the SQL in $APP_NAME/README.md to set up the database and default admin user."