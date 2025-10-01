<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/db/connection.php';
require_once __DIR__ . '/include/functions.php';

$page = $_GET['p'] ?? 'about';
$file = __DIR__ . "/pages/$page/index.php";

// Special handler for the login submission logic
if ($page === 'login_handler') {
    include __DIR__ . "/pages/login_handler/index.php";
    exit(); // Stop execution after handling login logic
}


include 'layouts/header.php';
?>
<div class="content-wrapper">
    <?php include 'partials/nav.php'; ?>

<?php
if (preg_match('/^[a-zA-Z0-9_-]+$/', $page) && file_exists($file)) {
    include $file;
} else {
    echo "<main><h2>404 - Page Not Found</h2></main>";
}
?>
</div>
<?php include 'layouts/footer.php'; ?>
