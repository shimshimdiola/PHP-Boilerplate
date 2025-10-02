<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/db/connection.php';
require_once __DIR__ . '/include/functions.php';

include 'layouts/header.php';
?>

<div class="content-wrapper">
    <?php include 'partials/nav.php'; ?>
    <main>
        <div class="hero">
            <h1><?php echo SITE_NAME; ?>: A Fast-Track PHP Template</h1>
            <p class="tagline">The boilerplate for developers who value **simplicity, speed, and clean architecture**.</p>
            <a href="page.php?p=about" class="btn-primary hero-btn">Explore Features →</a>
        </div>

        <section class="info-section template-info">
            <h2>Start Building in Minutes</h2>
            <p>WebTemp provides a ready-to-run foundation, eliminating repetitive setup tasks. Focus instantly on your core application logic.</p>
            <div class="feature-grid">
                <div class="feature-card">
                    <h3>📁 Organized Structure</h3>
                    <p>Clear separation of layouts, partials, and pages for maintainable code.</p>
                </div>
                <div class="feature-card">
                    <h3>⚡ Simple Routing</h3>
                    <p>The <code>page.php?p=name</code> system handles navigation without complex frameworks.</p>
                </div>
                <div class="feature-card">
                    <h3>🔒 Basic Auth Included</h3>
                    <p>A functional login/logout feature with database connection already configured.</p>
                </div>
            </div>
        </section>

    </main>
</div>

<?php include 'layouts/footer.php'; ?>