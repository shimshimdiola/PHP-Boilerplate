<?php
// Start a session for user management
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


// Site configuration: make sure the name matches your folder name
define("SITE_NAME", "PHP-Boilerplate");
// Database name without prefix/suffix
define("DB_HOST", "localhost"); // Database name
define("DB_USER", "root"); // Database username
define("DB_PASSWORD", ""); // Database password
define("DB_NAME", "Boilerplate"); // Database name


// Base URL of the application
$host = $_SERVER['HTTP_HOST'];
// Build base URL dynamically
define("BASE_URL", "http://" . $host . "/" . SITE_NAME . "/");

// Form IDs
for ($i = 1; $i <= 100; $i++) {
    define("FORM$i", "form$i");
    $form[$i] = constant("FORM$i");
}

