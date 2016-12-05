<?php
    session_start();
    
    
    ?>

<!DOCTYPE html>
<html>
  <head>
    <title>Login to Cheapo Mail</title>
    <link rel=stylesheet type="text/css" href="login.css">
    <script src="//ajax.googleapis.com/ajax/libs/prototype/1.7.1.0/prototype.js"></script>
    <script src=""></script>
  </head>
  
  <body style="text-align:center;">
    <form id="logininfo" action="login.php" method="POST"> 
  
    <div id="info">
        <strong>Username</strong><br> <input type="text" id ="username" name="username" class="textfield" required autofocus> <br>
        <strong>Password</strong><br> <input type="password" id ="password" name="password" class="textfield" required> <br>
        <input type= "submit" id="login" value="Submit" >
            </div>

    </form>
     
  </body>
</html>