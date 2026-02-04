<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

require_once __DIR__ . "/pages/system/connect.php";

if (!isset($conn)) {
    die("❌ BIẾN $conn KHÔNG TỒN TẠI");
}

$result = $conn->query("SELECT DATABASE()");
if (!$result) {
    die("❌ LỖI QUERY: " . $conn->error);
}

$row = $result->fetch_row();
echo "📌 DATABASE ĐANG KẾT NỐI: <b>" . $row[0] . "</b>";
