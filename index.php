<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/db/connection.php';
require_once __DIR__ . '/include/functions.php';

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



                </div><!-- container -->
            </div><!-- Page content Wrapper -->
        </div><!-- content -->
        <footer class="footer">&copy; <?php echo getCurrentYear(); ?> <?php echo SITE_NAME; ?>. All rights reserved.</footer>
    </div><!-- End Right content here -->
</div>

<?php include 'layouts/footer.php'; ?>