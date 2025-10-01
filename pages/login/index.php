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
