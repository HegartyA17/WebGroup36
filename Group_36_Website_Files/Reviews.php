<DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title> Review Page </title>
<link rel="stylesheet" type="text/css" href="style.css">
    <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

	<ul class="nav">
        
        <div class="logo">
        
       <a href="index1.html">Ford Garage</a>
        
        </div>
	
	<<li><a href="index1.html">Home</a></li>
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

    <h2> Reviews by customers</h2>

<table>
  <tr>
    <th>Review Number</th>
    <th>CarID</th>
    <th>Rating</th>
    <th>Customer</th>
    <th>Comment</th>
  </tr>
  
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
		
		$sql = "SELECT * FROM `reviews` r JOIN `customer` c ON r.CustomerID = c.CustomerID";
		$res = mysqli_query($mysqli, $sql);
		
		if ($res)
		{
			while ($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC))
			{
				$id = $newArray['ReviewID'];
				$car = $newArray['CarID'];
				$rating = $newArray['Rating'];
				$comment = $newArray['CustomerComment'];
				$forename = $newArray['Forename'];
				$surname = $newArray['Surname'];
				
				?>
				  <tr>
					<td><?php printf("%s", $id);?></td>
					<td><?php printf("%s", $car);?></td>
					<td><?php printf("%d", $rating);?>/10</td>
					<td><?php printf("%s %s", $forename, $surname);?></td>
					<td><?php printf("%s", $comment);?></td>
				  </tr>
				<?php
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
</table>
    
    <h2> <b>We have so many amazing reviews we cannot fit them all in, if you like other peoples opinions we hope these reviews helped!</b></h2>
	
	<h2 style = "margin-left:auto; margin-right:auto;"><a href="Select_Review.php">Submit Review here!</a></h2> 
	
</body>


<div id="footer">
		<div>
			<div class="connect">
				<a href= "http://Twitter.com">Twitter</a>
				<a href= "http://https://www.facebook.com">Facebook</a>
				
			</div>
			<p>
				&copy; copyright 2020 | all rights reserved.
			</p>
			
			
		</div>





</html>