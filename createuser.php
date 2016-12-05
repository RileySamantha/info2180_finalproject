<?php
include 'config.php';

if (isset($_POST['action']) && $_POST['action'] == 'register')
{

    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $confirmpassword=$_POST['confirmpassword'];

    if (strlen($username)<4) {
    		echo 2;
    	}
    	else if (strlen($password) < 8 || !preg_match('/'."^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$".'/', $password)) {
    		echo 3;
    	}
    	else if ($password!=$confirmpassword) {
    		echo 4;
    	}

    else if ($firstname && $lastname && $username && $password && $confirmpassword) {
    	

            $qu = $db->prepare("SELECT * FROM user WHERE username=:username ");
            $qu->bindParam(':username', $username);
            $qu->execute();
            $row = $qu->fetch();
            if(empty($row['username'])){
            	 $id= $row['id'];
                $query = $db->prepare("INSERT INTO user(first_name,last_name,password,username) VALUES (:first_name,:last_name,:password,:username)");
                $query->execute(array(
                ':first_name' => $firstname,
                ':last_name' => $lastname,
                ':password' => $password,
                ':username'=> $username));
                echo 1;
			
		}
            
            else{
                echo 0;
            }
           
            }
           else {
            	echo 7;
            }
}
















?>