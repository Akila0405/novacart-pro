<?php
session_start();
$host='localhost'; $db='novacart_pro'; $user='root'; $pass='';
try { $pdo=new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4",$user,$pass,[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]); }
catch(PDOException $e){ die('Database connection failed. Import database/novacart_pro.sql first.'); }
function e($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}
function cartCount(){return array_sum(array_column($_SESSION['cart']??[],'qty'));}
function isLoggedIn(){return isset($_SESSION['user']);}
function isAdmin(){return isset($_SESSION['admin']);}
?>
