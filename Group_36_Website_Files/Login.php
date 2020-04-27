<?php
	$mysqli = mysqli_connect("localhost", "root", "student", "dealership");
	
	if (mysqli_connect_errno())
	{
		//printf("<br>Connect failed: %s\n", mysqli_connect_error());
		exit();
	}
	else
	{
		//printf("<br>Host information: %s\n", mysqli_get_host_info($mysqli));
		
		if($_POST["email"] == ""||$_POST["pass"] == "")
		{
			echo "<br>Must enter Username and Password!";
		}
		else
		{
			$sql = "SELECT * FROM customer WHERE CustEmail ='".$_POST["email"]."'";
			$res = mysqli_query($mysqli, $sql);
			
			if ($res)
			{
				while ($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC))
				{
					$id = $newArray['CustomerID'];
					$email = $newArray['CustEmail'];
					$pass = $newArray['CustPassword'];
					
					if ($pass == $_POST["pass"])
					{
						setcookie("user", $id, time() + 86400, "/");
						echo "<br>Login Complete!";
					}
					else
					{
						echo "<br>Incorrect Password!";
					}
				}
			}
			else
			{
				echo "<br>User does not exist!";
			}
		}
		
		mysqli_close($mysqli);
	}
	$_POST = array();
?>