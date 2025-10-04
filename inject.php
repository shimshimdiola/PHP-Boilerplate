<?php
// anti CSRF token
session_start();
$_SESSION['user_id']    = 4;
$_SESSION['user_name']  = "Admin";
$_SESSION['user_email'] = "injector@gmail.com";
// Redirect to dashboard (or default page)
header("Location: page.php?p=dashboard");
