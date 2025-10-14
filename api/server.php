<?php
if (!empty($_POST)) {
    $formId = $_POST['form_id'] ?? 'unknown';
    echo "<b>Data received from {$formId}:</b><br>";

    foreach ($_POST as $key => $value) {
        if ($key !== 'form_id') {
            echo htmlspecialchars($key) . ": " . htmlspecialchars($value) . "<br>";
        }
    }

    echo "<br><b>Action Result:</b><br>";

    switch ($formId) {
        case 'form1':
            echo "👉 This data would be INSERTED (Form 1 logic simulated).";
            break;
        case 'form2':
            echo "🛠️ This data would be UPDATED (Form 2 logic simulated).";
            break;
        case 'form3':
            echo "🔍 This data would be SELECTED (Form 3 logic simulated).";
            break;
        default:
            echo "❓ Unknown form — no simulated action.";
            break;
    }

    echo "<hr>";
} else {
    echo "No data received.";
}
