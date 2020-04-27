<?php
	$mysqli = mysqli_connect("localhost", "root", "student", "dealership");
	
	if (!isset($_COOKIE["user"]))
	{
		echo "<br>Please Login to leave a Review!";
	}
	else
	{
		if (mysqli_connect_errno())
		{
			//printf("<br>Connect failed: %s\n", mysqli_connect_error());
			exit();
		}
		else
		{
			//printf("<br>Host information: %s\n", mysqli_get_host_info($mysqli));
			
			if($_POST["carID"] == ""||$_POST["rating"] == ""||$_POST["comment"] == "")
			{
				echo "<br>All fields must be filled";
			}
			else
			{
				$sqlRev = "SELECT * FROM reviews";
				$resRev = mysqli_query($mysqli, $sqlRev);
				
				$revCount = 0;
				while ($revCountArray = mysqli_fetch_array($resRev, MYSQLI_ASSOC))
				{
					$revCount++;
				}
				$revID = sprintf("R%05d", $revCount);
				
				$sql = "INSERT INTO `reviews`(`ReviewID`, `CustomerID`, `CarID`, `Rating`, `CustomerComment`) VALUES ('".$revID."' , '".$_COOKIE["user"]."', '".strtoupper($_POST["carID"])."', '".$_POST["rating"]."', '".$_POST["comment"]."')";
				$res = mysqli_query($mysqli, $sql);
				
				if ($res === true)
				{
					echo "<br>A record has been inserted.";
				}
				else
				{
					printf("<br>Could not be inserted: %s\n", mysqli_error($mysqli));
				}
			}
			
			mysqli_close($mysqli);
		}
	}
	$_POST = array();
	//header("Location: Index.php");
?>