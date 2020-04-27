<DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title> About Us </title>
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
    
   <div class="heading"> New Cars & Vans</div>  
    <div align="center" class="cars">
	
	<form action = "Buy_Car.php" method = "POST">
	<?php
		/*echo "Hello World";
		printf("<br>%s<br>%s<br>%.2f", "Hello There!", "General Kenobi!", 3.141592653);*/
		
		$mysqli = mysqli_connect("localhost", "root", "student", "dealership");
		
		if (mysqli_connect_errno())
		{
			printf("<br>Connect failed: %s\n", mysqli_connect_error());
			exit();
		}
		else
		{
			//printf("<br>Host information: %s\n", mysqli_get_host_info($mysqli));
			
			$sql = "SELECT * FROM cars c JOIN models m ON c.ModelID = m.ModelID";
			$res = mysqli_query($mysqli, $sql);
			
			if ($res)
			{
				while ($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC))
				{
					$id = $newArray['CarID'];
					$model = $newArray['Description'];
					$bodyStyle = $newArray['BodyStyle'];
					$color = $newArray['Color'];
					$carTrim = $newArray['CarTrim'];
					$drive = $newArray['Drive'];
					$fuel = $newArray['FuelConsumption'];
					$co2 = $newArray['CO2Emmission'];
					$price = $newArray['Price'];
					$num = $newArray['NumInStock'];
					?>
							
							
					<div class="cars"> 
						<h1> <?php echo strtoupper($id);?> </h1>
						<p>
							<?php printf("<br>Model: %s", $model);
							printf("<br>Body Style: %s", $bodyStyle);
							printf("<br>Color: %s", $color);
							printf("<br>Car Trim: %s", $carTrim);
							printf("<br>Drive: %s", $drive);
							printf("<br>Fuel: %s", $fuel);
							printf("<br>CO2: %s", $co2);
							printf("<br>Price: £%.2f", $price);
							printf("<br>Stock: %d<br>", $num);?>
						</p>
					 </div>
					<?php
					echo "<br>Buy:";
					?>
					<input type = "submit" name = "carID" value = "<?php echo strtoupper($id);?>">
					<?php
					echo "<br>";
				}
			}
			else
			{
				printf("<br>Could not retrieve records: %s", mysqli_error($mysqli));
			}
			mysqli_free_result($res);
			mysqli_close($mysqli);
		}
	?>
	</form>
    </div>
</body>
</html>