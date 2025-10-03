<?php
// Start a session for user management
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Site configuration: make sure the name matches your folder name
define("SITE_NAME", "PHP-Boilerplate");
// Base URL of the application
define("BASE_URL", "http://localhost/" . SITE_NAME .  "/");
