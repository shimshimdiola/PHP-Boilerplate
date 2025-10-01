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
        
        <section class="info-section login-details">
            <h2>🔑 Authentication & Database Setup</h2>
            <?php if (isUserLoggedIn()): ?>
                <div class="login-status success">
                    <h3>🎉 You are currently logged in!</h3>
                    <p>You can access user-specific pages and features now. Click 'Logout' in the navigation to test the login process again.</p>
                </div>
            <?php else: ?>
                <div class="login-status warning">
                    <p>To test the login feature, use the credentials below. **Remember to run the SQL in <code>README.md</code> first!**</p>
                    <table class="credentials-table">
                        <tr><td>**Email:**</td><td><code>admin@example.com</code></td></tr>
                        <tr><td>**Password:**</td><td><code>password123</code></td></tr>
                    </table>
                    <p class="login-prompt">
                        <a href="page.php?p=login">Click here to log in →</a>
                    </p>
                </div>
            <?php endif; ?>
        </section>
    </main>
</div>

<?php include 'layouts/footer.php'; ?>
