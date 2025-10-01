<?php
// Start a session for user management
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

define("SITE_NAME", "WebTemp");
define("BASE_URL", "http://localhost/WebTemp/");
?>
