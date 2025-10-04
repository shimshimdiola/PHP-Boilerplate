<?php
// Use unique session variable names
$session_user_name = $_SESSION['user_name'] ?? null;
$session_user_id   = $_SESSION['user_id'] ?? null;

// Prepare query with unique statement variable
$stmt_check_session = $conn->prepare("SELECT id FROM users WHERE id = ? AND name = ?");
if (!$stmt_check_session) {
    die("Prepare failed: " . $conn->error);
}
// Bind parameters with unique variable names
$stmt_check_session->bind_param("is", $session_user_id, $session_user_name);
$stmt_check_session->execute();

// Use a unique result variable
$result_check_session = $stmt_check_session->get_result();

// If no matching user found, invalidate session and redirect to login
if ($result_check_session->num_rows === 0) {
    // User not found → clear session + redirect to login
    session_unset();
    session_destroy();
    header("Location: " . BASE_URL);
    exit;
}
