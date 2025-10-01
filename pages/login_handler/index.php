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
