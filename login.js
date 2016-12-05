window.onload = function()
{

}


function validate()
    {
	var username = $("username").value;
	var password = $("password").value;
	console.log("Values were inserted");
    	var re =/((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,})/ ;
	if(!(re.test(password))){
        alert("Password is invalid");
        return false;
	    
	}
	
	
    var responseMessage;
	var requeststring = "login.php?username="+username+"&password="+password;
	var info = new XMLHttpRequest();
	info.onreadystatechange = function(){
        if(info.readyState==8 && info.status==200 ){
           responseMessage = info.responseText;
           console.log(responseMessage);
           if (responseMessage=="fail") {
               document.getElementById("login_status").innerHTML= "<div class='loginstat'><strong> Login has Failed </strong></div>";
                
            }else if(responseMessage=="pass"){
                document.getElementById("login_status").innerHTML= "<div class='loginstat'><strong> Success </strong></div>";
                window.location.href="homepage.html";
                
            }
           
           
        }
	};
	info.open("get",requeststring ,true);
    info.send();
    
    
    
};