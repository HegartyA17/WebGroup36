<?php
	$mysqli = mysqli_connect("localhost", "root", "student", "dealership");
	
	if (!isset($_COOKIE["user"]))
	{
		echo "<br>Please Login to Continue!<br>";
		?><a href="LogIn.HTML">Log In</a><?php
	}
	else
	{
		//echo "<br>User: ".$_COOKIE["user"]."<br>";
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
				
				$sqlOrd = "SELECT * FROM orders";
				$resOrd = mysqli_query($mysqli, $sqlOrd);
				
				$ordCount = 0;
				while ($ordCountArray = mysqli_fetch_array($resOrd, MYSQLI_ASSOC))
				{
					$ordCount++;
				}
				$ordID = sprintf("O%05d", $ordCount);
				
				$sql1 = "INSERT INTO `orders`(`OrderID`, `CustomerID`, `OrderDate`, `DeliveryDate`, `Paid`) VALUES ('".$ordID."' , '".$_COOKIE["user"]."', '".date("Ymd")."', '".date("Ymd")."', 'Yes')";
				$res1 = mysqli_query($mysqli, $sql1);
				
				if ($res1 === true)
				{
					echo "<br>A record has been inserted.";
					
					$sql2 = "INSERT INTO `orderdetails`(`OrderID`, `CarID`, `Quantity`) VALUES ('".$ordID."' , '".$_POST["carID"]."', '1')";
					$res2 = mysqli_query($mysqli, $sql2);
					
					if ($res2 === true)
					{
						echo "<br>A record has been inserted.";
					}
					else
					{
						printf("<br>Could not be inserted: %s\n", mysqli_error($mysqli));
					}
				}
				else
				{
					printf("<br>Could not be inserted: %s\n", mysqli_error($mysqli));
				}
				
				mysqli_close($mysqli);
			}
		}
	}
	
	$_POST = array();
	//header("Location: Index.php");
?>