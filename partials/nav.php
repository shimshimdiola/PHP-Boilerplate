<?php require_once __DIR__ . '/../include/functions.php'; ?>
<nav class="main-nav">
  <ul>
    <li><a href="index.php">Home</a></li>
    <li><a href="page.php?p=about">About</a></li>
    <li><a href="page.php?p=contact">Contact</a></li>
    <li><a href="page.php?p=services">Services</a></li>
    <?php if (isUserLoggedIn()): ?>
        <li class="auth-link"><a href="page.php?p=logout">Logout</a></li>
    <?php else: ?>
        <li class="auth-link"><a href="page.php?p=login">Login</a></li>
    <?php endif; ?>
  </ul>
</nav>
