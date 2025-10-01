<?php
$host = "localhost";
$user = "root";
$pass = "";
$db  = "webtemp";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
  die("❌ Database Connection failed: " . $conn->connect_error);
}
?>
