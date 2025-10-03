<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/db/connection.php';
require_once __DIR__ . '/include/functions.php';

$page = $_GET['p'] ?? 'about';
$file = __DIR__ . "/pages/$page/index.php";
include 'layouts/header.php';
?>
<div class="content-wrapper">
    <?php include 'partials/sidebar.php'; ?>
    <div class="content-page"><!-- Start content -->
        <div class="content">

            <?php include 'partials/nav.php' ?>
            <div class="page-content-wrapper">
                <div class="container-fluid">
                    <!-- Page content here!! -->
                    <?php
                    if (preg_match('/^[a-zA-Z0-9_-]+$/', $page) && file_exists($file)) {
                        include $file;
                    } else {
                        echo "<main><h2>404 - Page Not Found</h2></main>";
                    }
                    ?>


                </div><!-- container -->
            </div><!-- Page content Wrapper -->
        </div><!-- content -->
        <footer class="footer">&copy; <?php echo getCurrentYear(); ?> <?php echo SITE_NAME; ?>. All rights reserved.</footer>
    </div><!-- End Right content here -->
</div>
<?php include 'layouts/footer.php'; ?>