<?php
	
	session_start();
	
	if(!isset($_SESSION['SESS_USERID']) || (trim($_SESSION['SESS_USERID']) == '')) {
		header("location: index.php");
		exit();
	};
	require_once('conn.php');
				$id=$_SESSION['SESS_USERID'];
				$result3 = mysql_query("SELECT * FROM user where id='$id'");
				$result4 = mysql_query("SELECT * FROM message where user_id='$id'");
				$result5 = mysql_query("SELECT * FROM message_read where reader_id='$id'");
				while($row3 = mysql_fetch_array($result3))
				{ 
				$fname=$row3['f_name'];
				$lname=$row3['l_name'];
				$username=$row3['username'];
				}
				$val1 = mysql_num_rows($result4);
				$val2 = mysql_num_rows($result5);
				
		
?>


<html>
<head>
<title>Profile</title>

</head>


<body ><center>
	<h1> Home Page </h1> <a href="logout.php" style="float:right;"><button >Log Out</button></a>
	<div id="container" >
<form method="POST" action="message.php">
	<div id="div_read" name="read" style="float:left"  >
		<h2>Inbox</h2>
<?php
		
$sql="SELECT body,subject,user_id FROM message where recipient_ids=$id";
$result= mysql_query($sql) or die(mysql_error());
echo '<body bgcolor="skyblue"> <center>';
echo'<table 	style="border: 5px solid red;">','<tr>','<th> Sender</th>','<th> Subject </th>','<th> Message</th>','</tr>';
while($row3=mysql_fetch_array($result)){	
		 		$user_id=$row3['user_id'];
		 		$subject=$row3['subject'];
				$body=$row3['body'];
				
				echo '<tr>','<td>'.$user_id.'</td>','<td>'.$subject.'</td>','<td>'.$body.'</td>','</tr>';
}
 echo '</table>','<br>';
?>
		
	</div>
	
	<div id="div_send" name="send"  >
<h2>Send Message</h2>
		<p>Recipient:<input type="number" style="width:50px" id="recipient_ids" name="recipient_ids" required></p>
		<p>Subject:<input type="text" id="subject" name="subject" required ></p>
		<p>Body: <br><textarea type="text" id="body" name="body" required placeholder="Enter Message" style="width:300px; height:300px "></textarea> </p>
		<p><input type="submit" value="Submit"></p>

	</div> 
</form>
<div style="clear:both;"></div>
</div>


</center>


</body>



</html>