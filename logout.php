<?php
session_start();
if (!isset(S_SESSION['user'])) {
    header("Location: index.php");
}
session_destroy();
unset($_SESSION['user']);
header("Location: index.php");
