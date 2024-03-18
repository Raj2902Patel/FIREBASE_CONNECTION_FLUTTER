<?php

$servername = "localhost";

$username = "root";

$password = "";

$dbname = "database_connection";

$conn = new mysqli($servername, $username, $password, $dbname);

if (!$conn){

	die("Connection Failed: ". mysqli_connect_error());

} ?>

