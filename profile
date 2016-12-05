<?php
session_start();
require_once "../php/config/access_controller.php";
?>
<!DOCTYPE html>
<html ng-app="my-app">
	<head>
		<meta charset="UTF-8">
		<title>Profile</title>
		<link href="css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/simple-sidebar.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    
    <link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/angular.min.js"></script>
    <script type="text/javascript" src="js/bs-table.js"></script>

    <script src="js/angular-route.js"></script>
    <script src="js/angular_script.js"></script>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js" type="text/javascript"></script>
	</head>
	<body id="bodya" ng-controller="read_message_Controller" ng-mousemove="trigger()">


<!-- navbar-inverse -->
    <nav role="navigation" class="navbar">

        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="navbar-header">

            <!-- <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> -->

            <a href="#" class="navbar-brand"><i></i></a>

        </div>

        <!-- Collection of nav links, forms, and other content for toggling -->

        <div id="navbarCollapse" class="collapse navbar-collapse">

            <ul class="nav navbar-nav">

                <!-- <li class="active"><a href="#">Home</a></li> -->

                <!-- <li><a href="#">Profile</a></li> -->

               <!--  <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">Messages <b class="caret"></b></a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="#">Inbox</a></li>
                        <li><a href="#">Drafts</a></li>
                        <li><a href="#">Sent Items</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Trash</a></li>
                    </ul>
                </li> -->

            </ul>

            <form role="search" class="navbar-form navbar-left">

                <div class="form-group">

                    <input type="text" placeholder="Search" class="form-control">

                </div>

            </form>

            <ul class="nav navbar-nav navbar-right">

                <li id="usernameID" class="glyphicon glyphicon-envelope">{{count}}</li>

                <li id="usernameID"><?php echo $_SESSION['username']?></li>
                <li><button type="button" class="btn btn-danger" id="logout">log out</button></li>

            </ul>

        </div>

    </nav>






   <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    
                       Cheapermail
                  
                </li>
                <!-- <li>
                    <a href="#compose_partial">Compose Messages</a>
                </li> -->
                <li>
                    <a href="#unread_message_partial" >Unread Messages</a>
                </li>
                <li>
                    <a href='#read_messages_partial' >Read Messages</a>
                </li>
                <?php
                    if ($_SESSION['user_type'] == 'Admin') {
                        # code...
                        echo "
                         <li>
                            <a href='#users_partial' >Users</a>
                        </li>
                        ";
                    }
                ?>
               
                <li>
                    <a href="#/">My Links</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                      <div ng-view>
                      </div>

<!-- 
                        <h1>{{message}}</h1>
                        <p>This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.</p>
                        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>.</p> -->
                        <!-- Trigger the modal with a button -->
                        <button type="button" id="openmodal" class="btn btn-default" data-toggle="modal" data-target="#myModal">Compose</button>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" role="dialog">
                          <div class="modal-dialog">
                          
                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Compose Message</h4>
                              </div>
                              <div class="modal-body">
                               <div class="modal-body">


                                  <form role="form" class="form-horizontal">
                                      <div class="form-group">
                                        <label class="col-sm-2" for="inputTo">To</label>
                                        <div class="col-sm-10"><input class="form-control" id="inputTo" placeholder="comma separated list of recipients" type="email"></div>
                                      </div>
                                      <div class="form-group">
                                        <label class="col-sm-2" for="inputSubject">Subject</label>
                                        <div class="col-sm-10"><input class="form-control" id="inputSubject" placeholder="subject" type="text"></div>
                                      </div>
                                      <div class="form-group">
                                        <label class="col-sm-12" for="inputBody">Message</label>
                                        <div class="col-sm-12"><textarea class="form-control" id="inputBody" rows="18"></textarea></div>
                                      </div>
                                  </form>


                                  
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-warning pull-left">Save Draft</button>
                                <button type="button" class="btn btn-primary " id="messageSend">Send <i class="fa fa-arrow-circle-right fa-lg"></i></button>
                              </div>
                            </div>
                            
                          </div>
                        </div>
                        <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>



                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>

    {{4*5}}
		
	</body>



</html> 