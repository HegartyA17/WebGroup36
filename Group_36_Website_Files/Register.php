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
		
		if($_POST["title"] == ""||$_POST["surname"] == ""||$_POST["forename"] == ""||$_POST["street"] == ""||$_POST["city"] == ""||$_POST["county"] == ""||$_POST["postcode"] == ""||$_POST["telno"] == ""||$_POST["email"] == ""||$_POST["pass"] == "")
		{
			echo "<br>All fields must be filled";
		}
		else
		{
			$sqlCust = "SELECT * FROM customer";
			$resCust = mysqli_query($mysqli, $sqlCust);
			
			$custCount = 0;
			while ($custArray = mysqli_fetch_array($resCust, MYSQLI_ASSOC))
			{
				$custCount++;
			}
			$custID = sprintf("C%05d", $custCount);
			
			$sql = "INSERT INTO customer (CustomerID, Title, Surname, Forename, Street, City, County, Postcode, TelNo, CustEmail, CustPassword) VALUES ('".$custID."' , '".$_POST["title"]."', '".$_POST["surname"]."', '".$_POST["forename"]."', '".$_POST["street"]."', '".$_POST["city"]."', '".$_POST["county"]."', '".$_POST["postcode"]."', '".$_POST["telno"]."', '".$_POST["email"]."', '".$_POST["pass"]."')";
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
	$_POST = array();
	//header("Location: Index.php");
?>