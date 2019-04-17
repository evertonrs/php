<?php
	$conn = new mysqli("localhost", "root", null, "db_php");
	if ($conn -> connect_error){
		echo "Error: ".$conn -> connect_error;
	}
	$result = $conn->query("SELECT * FROM tb_users ORDER BY userLogin");
	while($row = $result->fetch_array()){
		var_dump($row);
	}
?>