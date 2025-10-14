<?php
// This will receive data from any form
if (!empty($_POST)) {
    echo "Data received from form:<br>";
    foreach ($_POST as $key => $value) {
        echo htmlspecialchars($key) . ": " . htmlspecialchars($value) . "<br>";
    }
} else {
    echo "No data received.";
}
?>
