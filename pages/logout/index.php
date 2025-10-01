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
