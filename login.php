<?php
/*include 'config.php';
if (isset($_POST['action']) && $_POST['action'] == 'login')
{
    $username = $_POST["UserName"];
    $password = $_POST["Password"];
    
    if ($username && $password) {
        try {
            $query = $db->prepare("SELECT * FROM user WHERE username=:username AND password=:password");
            $query->bindParam(':username', $username);
            $query->bindParam(':password', $password);
            $query->execute();
            if ($row = $query->fetch())
            {
                $_SESSION['username'] = $row['username'];
                $_SESSION['id'] = $row['id'];
                //here user successfully logged in so we will store id in session variable 
               echo 1;
            }
            else
            {
                echo 0;
            }
            $conn = null; // close connection
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }
}
*/

 
session_start();
require_once('conn.php');
$username = $_POST['username'];
$password = $_POST['password'];
if ($username=='admin' && $password=='admin'){
		$_SESSION['SESS_USERID'] ='admin';
		$_SESSION['SESS_NAME'] ='admin';
		header('Location: user.php');
		exit();
	};
  
    $sql = "SELECT * FROM user WHERE username = '$username' AND password = '$password'";
    $results= mysql_query($sql);
    if ($results){
    	if(mysql_num_rows($results) > 0){
    		session_regenerate_id();
    		$one = mysql_fetch_assoc($results);
    		$_SESSION['SESS_USERID'] = $one['id'];
    		$_SESSION['SESS_NAME'] = $one['username'];
    		session_write_close();
    		header("Location: userpro.php");
    		exit();
    	}else {
    		header("Location: index.php");
    		exit();
    	}
    }else{
    	die("Unfortunately your query is unsuccessful, try again with better inputs!");
    }
   
?>
?>