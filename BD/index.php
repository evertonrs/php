<?php
	$conn = new mysqli("localhost", "root", null, "db_php");
	if ($conn -> connect_error){
		echo "Error: ".$conn -> connect_error;
	}
	$stmt = $conn -> prepare("INSERT INTO tb_users (userLogin, userPass) VALUES(?, ?)");
	$stmt -> bind_param("ss", $login, $pass);
	$login = "user";
	$pass = "123456"; 
	$stmt -> execute();
?>
