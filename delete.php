<?php
require_once('./config/db.class.php');

if ($_SERVER['REQUEST_METHOD'] != 'GET')
    die('Invalid HTTP method!');

$sql = "DELETE FROM product WHERE ProductID = '" . $_POST['ProductID'] . "'";
// die($sql);
$db = new Db();
$result = $db->query_execute($sql);
if ($result) {
    header("Location:list_product.php");
}
