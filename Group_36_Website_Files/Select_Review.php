
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
<?php
	/*echo "Hello World";
	printf("<br>%s<br>%s<br>%.2f", "Hello There!", "General Kenobi!", 3.141592653);*/
	
	if (!isset($_COOKIE["user"]))
	{
		echo "<br>No User!";
	}
	else
	{
		echo "<br>User: ".$_COOKIE["user"];
	}
	
	$mysqli = mysqli_connect("localhost", "root", "student", "dealership");
	
	if (mysqli_connect_errno())
	{
		printf("<br>Connect failed: %s\n", mysqli_connect_error());
		exit();
	}
	else
	{
		//printf("<br>Host information: %s\n", mysqli_get_host_info($mysqli));
		
		$sql = "SELECT * FROM cars";
		$res = mysqli_query($mysqli, $sql);
		$carArray = array();
		
		if ($res)
		{
			while ($newArray = mysqli_fetch_array($res, MYSQLI_ASSOC))
			{
				array_push($carArray, $newArray['CarID']);
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

<form action = "Reviews_Submit.php" method = "POST">
	<p>Car:<br>
	<select name ="carID">
		<option selected="selected">Select Car</option>
		<?php
		foreach($carArray as $item){
		?>
		<option value="<?php echo strtoupper($item); ?>"><?php echo $item; ?></option>
		<?php
		}
		?>
	</select>
	<p>Rating:<br>
	<input type = "text" name = "rating" size = "30">
	<p>Comment:<br>
	<textarea name="comment" cols="50" rows="10"></textarea>
	<p><input type = "submit" name = "submit" value = "Insert Review"></p>
</form>	
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





</html>1