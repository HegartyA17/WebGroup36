<DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title> Bought </title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

	<ul class="nav">
        
        <div class="logo">
        
       <a href="index1.html">Ford Garage</a>
    
    </div>

	<li><a href="index1.html">Home</a></li>
	<li><a href="About%20Us.HTML">About Us</a></li>
	<li><a href="Cars.php">Cars</a></i>
	<li><a href="LogIn.HTML">Log In</a></li>
	<li><a href="Contact%20Us.html">Contact Us</a></li>
    <li><a href="Reviews.php">Reviews</a></i>
    <li><a href="Bought.php">Purchases</a></i>
	</ul>
<div class="banner">
<img class="banner-image" src="img/forddirect.jpg";

</div>
<div class="article">
			
			<h2>Bought Cars</h1>
		</div>
	</div>
	<div id="body">
	
	<?php
		$mysqli = mysqli_connect("localhost", "root", "student", "dealership");
		
		if (mysqli_connect_errno())
		{
			printf("<br>Connect failed: %s\n", mysqli_connect_error());
			exit();
		}
		else
		{
			//printf("<br>Host information: %s\n", mysqli_get_host_info($mysqli));
			$sql = "SELECT * FROM orders o JOIN orderdetails od ON o.OrderID = od.OrderID WHERE o.CustomerID = '".$_COOKIE["user"]."'";
			$res = mysqli_query($mysqli, $sql);
			
			if ($res)
			{
				echo "<br>User ".$_COOKIE["user"];
				$count = 0;
				while ($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC))
				{
					$id = $newArray['CarID'];
					
					printf("<br>CarID: %s", $id);
					$count++;
				}
				
				if ($count == 0)
				{
					echo "<br>No purchases for this User";
				}
				
			}
			else
			{
				printf("<br>Could not retrieve records: %s", mysqli_error($mysqli));
			}
			
			mysqli_free_result($res);
			mysqli_close($mysqli);
			echo "<br>";
		}
	?>
	
	
	</div>
    
    <div id="footer">
		<div>
			<div class="connect"><br>
				<a href="http://Twitter.com">Twitter</a>
				<a href="http://Facebook.com">Facebook</a>
				
			</div>
			<p>
				&copy; copyright 2020 all rights reserved.
			</p>
		</div>
	</div>
    

</body>








</html>