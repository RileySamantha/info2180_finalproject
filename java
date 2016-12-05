$(document).ready(function(){
	
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});

	$('#login').click(function(){

		var username = $("#username").val();
		var password = $("#password").val();
		if( username =='' || password ==''){
			$('input[type="text"],input[type="password"]').css("border","2px solid red");
			$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
			alert("Please fill all fields...!!!!!!");
		}else {
			//alert("Successful login");
			$.post("../php/controller/user_controller.php",{ username: username, password:password, request:'login' },
				function(data) {
					//alert("Successful login");
					data=JSON.parse(data);
					//alert("Successful login");
					if(data.status==200){
						//alert("Successful login");
						location.href="profile.php";
						// $('#usernameID').html(username);
					}else{
						$('input[type="text"],input[type="password"]').css("border","2px solid red");
						$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
						alert("password or username incorrect");

					}
					console.log(data);
				}
			);
		}
	});

	$('#logout').click(function(){

		$.post("../php/config/logout.php",{ request:'logout' },
				function(data) {
					data=JSON.parse(data);
					if(data.status==200)
						location.href="index.html";
					console.log(data);
				}
			);

	});


	// var passwordChecker = function(str){
	// 	if (str.length < 8){

	// 		$('input[type="text"],input[type="password"]').css("border","2px solid red");
	// 		alert('password too short');

	// 		return false;
	// 	}else if(str.search(/\d/) == -1){

	// 		$('input[type="text"],input[type="password"]').css("border","2px solid red");
	// 		alert('please include a digit in password');
	// 		return false;

	// 	}else if(str.search(/[A-Z]/) == -1){
	// 		$('input[type="text"],input[type="password"]').css("border","2px solid red");
	// 		alert('please include a UpperCase Letter in password');
	// 		return false;

	// 	}else if(str.search(/[a-zA-Z]/) == -1){
	// 		$('input[type="text"],input[type="password"]').css("border","2px solid red");
	// 		alert('please include a  Letter in password');
	// 		return false;
	// 	}else{
	// 		return true;
	// 	}
	// }




	
	// //Signup
	// $('#signup').click(function(){
	// 	// alert("fjhdjdj");
	// 	var firstname = $("#first_name").val();
	// 	var lastname = $("#last_name").val();
	// 	var username = $("#username").val();
	// 	var password = $("#password").val();

	// 	// alert("fhjjdfh");
	// 	var cpassword = $("#password_confirmation").val();
	// 	// console.log(cpassword+" "+password);
	// 	if( cpassword != password){
	// 		alert("passwords do not match");
	// 	}
	// 	else if( firstname ==''|| lastname =='' || username =='' || password =='' || cpassword ==''){
	// 		$('input[type="text"],input[type="password"]').css("border","2px solid red");
	// 		$('input[type="text"],input[type="password"]').css("box-shadow","0 0 3px red");
	// 		alert("Please fill all fields...!!!!!!");
	// 	}
	// 	else {
	// 		// alert("hhhhhh");
	// 		// console.log(cpassword+" "+password);
			
	// 		if (passwordChecker(password)) {
	// 			alert('password in');
	// 			alert(passwordChecker(password));
	// 			alert('password out');



	// 			// $.post("../../php/controller/user_controller.php",{ username: username, request:'checkuser' },
	// 			// function(data){
	// 			// 	// alert("this"+data);
	// 			// 	data=JSON.parse(data);
	// 			// 	// alert("username");
	// 			// 	if(data.status==200){
	// 			// 		alert("User already exists");
	// 			// 	}
	// 			// 	else{
	// 			// 		alert("soon Successful");
	// 			// 		$.post("../../php/controller/user_controller.php",{ 
	// 			// 			firstname:firstname, 
	// 			// 			lastname:lastname, 
	// 			// 			username:username, 
	// 			// 			password:password,
	// 			// 			request:'insert'
	// 			// 		},
	// 			// 		function(data) {
	// 			// 			alert("created "+data);
	// 		 // 				data=JSON.parse(data);
	// 			// 			if(data.status==200)
	// 		 // 					alert("Successful");
	// 		 // 				else
	// 		 // 					alert("User not created");
	// 		 // 			});
	// 			// 	}
	// 			// });



	// 		};
	// 	}
	// });





		

	$("#messageSend").click(function(){

		var confirmation = false;
	    alert("The paragraph was clicked.");
	    var recepent = $('#inputTo').val();
	    var subject = $('#inputSubject').val();
	    var messageBody = $('#inputBody').val();
	    if( recepent ==''){
			alert("Please add A recipent to the message");
		}else if(subject=='' || messageBody ==''){

			confirmation = confirm("You are about to send a message with no Subject or a Body is that ok?");
		}else{

			confirmation = true;
		}

		alert(confirmation);



		


		if(confirmation){
			$.post("../php/controller/message_controller.php",{ recepent: recepent,subject:subject, messageBody:messageBody,request:'send' },
				function(data) {
					data=JSON.parse(data);
					if(data.status==200)
						//location.href="profile.html"
					// if(data=='Invalid Email.......') {
					// 	$('input[type="text"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
					// 	$('input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
					// 	alert(data);
					// }else if(data=='Email or Password is wrong...!!!!'){
					// 	$('input[type="text"],input[type="password"]').css({"border":"2px solid red","box-shadow":"0 0 3px red"});
					// 	alert(data);
					// } else if(data=='Successfully Logged in...'){
					// 	$("form")[0].reset();
					// 	$('input[type="text"],input[type="password"]').css({"border":"2px solid #00F5FF","box-shadow":"0 0 5px #00F5FF"});
					// 	alert(data);
					// } else{
					// 	alert(data);
					// }

					console.log(data);
				}
			);
		}
	});
});