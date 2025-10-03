<?php
$error = "";
// Handle login form submission
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST['email'] ?? '');
    $password = trim($_POST['password'] ?? '');

    if ($email && $password) {
        // Fetch user by email
        $stmt = $conn->prepare("SELECT id, name, email, password FROM users WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($row = $result->fetch_assoc()) {
            // Since your DB uses MD5, compare with md5()
            if (md5($password) === $row['password']) {
                // Store session data
                $_SESSION['user_id']    = $row['id'];
                $_SESSION['user_name']  = $row['name'];
                $_SESSION['user_email'] = $row['email'];

                // Redirect to dashboard (or default page)
                header("Location: page.php?p=dashboard");
                exit;
            } else {
                $error = 'The password you’ve entered is incorrect.';
            }
        } else {
            $error = "The email you’ve entered is incorrect.";
        }
    } else {
        $error = "⚠️ Please fill in both fields.";
    }
}
