<?php
session_start();
include ('conn.php');
$firstname=$_POST['firstname'];
$lastname=$_POST['lastname'];
$username=$_POST['username'];
$password=$_POST['password'];
mysql_query("INSERT INTO user(firstname, lastname, username, password) VALUES ('$firstname', '$lastname', '$username', '$password')");
header("location: user.php");
mysql_close($conn);
?>