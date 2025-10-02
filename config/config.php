<?php
// Start a session for user management
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// Site configuration
define("SITE_NAME", "PHP-Boilerplate");
// Base URL of the application
define("BASE_URL", "http://localhost/WebTemp/");
