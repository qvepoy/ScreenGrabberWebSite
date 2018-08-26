<?php
	if(isset($_POST['email'])) {
		$user_email = strtolower($_POST['email']);
		$user_password = $_POST['password'];
		$mysqli = new mysqli('localhost', 'almost', 'mnt39g', 'screengrab');
		
		if ($stmt = $mysqli->prepare("SELECT user_email FROM `users` WHERE user_email=?")) {
			$stmt->bind_param('s', $user_email);
			$stmt->execute();
			$stmt->bind_result($count_rec);
			$stmt->fetch();
			$stmt->close();
			
			if ($count_rec != $user_email)  {
				echo 'email_error';
			}
			else {
				if ($stmt = $mysqli->prepare("SELECT user_password FROM `users` WHERE user_email=?")) {
					$stmt->bind_param('s', $user_email);
					$stmt->execute();
					$stmt->bind_result($count_rec);
					$stmt->fetch();
					$stmt->close();
					
					if ($count_rec != $user_password)  
					echo 'password_error';
					else {
						echo 'ok';
						session_start();
						$_SESSION['id'] = 99;
						$_SESSION['name'] = $user_email;
					}
				}
			}
		}
		$mysqli->close();
	}
?>