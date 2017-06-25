<?php
//Connecting to sql db.
$connect = mysqli_connect("localhost","root@localhost","","unixproject");
//Sending form data to sql db.
mysqli_query($connect,"INSERT INTO user (username, login, password)
VALUES ('$_POST['usernameR']', '$_POST[usernameR]', '$_POST[passwordR]')";
?>