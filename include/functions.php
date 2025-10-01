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
