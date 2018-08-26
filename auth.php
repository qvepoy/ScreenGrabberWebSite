<?php
	include_once "config.php";
	if(isset($_POST['email'])) {
		$user_email = $_POST['email'];
		$user_password = $_POST['password'];
		$mysqli = new mysqli('localhost', 'almost', 'mnt39g', 'screengrab');
		
		$sql_res = mysql_query("SELECT * FROM users WHERE user_email='$user_email'") or die(mysql_error());
		if(mysql_num_rows($sql_res) == 0 ) {
			mysql_query("INSERT INTO users SET	user_email='$user_email',
												user_password='$user_password'");
			$sql_res = mysql_query("SELECT * FROM users WHERE user_email='$user_email'");
			$arr = mysql_fetch_assoc($sql_res);	
			session_start();
			$_SESSION['id']=$arr["user_id"];
			$_SESSION['name']=$arr["user_email"];
			//header("start_template2/index.html");
			echo 'ok';
			//exit;
		} else {
			echo 'busy';
		}
	}
?>