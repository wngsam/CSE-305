<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>LoveBucket Signup</title>

        <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="assets/css/freelancer.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="assets/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <style>
            header{
                background-color: white;
                color: navy; 
            }
            inputFieldPadding
            {
                padding: 30px;
            }
        </style>
        
        <script src="assets/LoveBucketJS/LovelyBucketCommon.js"> </script>
    </head>

    <body id="page-top" class="index">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="mainPage.html">LoveBucket</a>
                    
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li class="page-scroll">
                            <a href="search.html">Search</a>
                        </li>
                        <li class="page-scroll">
                            <a href="login.html">Login</a>
                        </li>
                        <li class="page-scroll">
                            <a href="about.html">About</a>
                        </li>
                        <li class="page-scroll">
                            <a href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <!-- Contact Section -->
        <header>
            <div class="container " >
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h2>Register Now!</h2>
                        <hr class="star-primary">
                    </div>
                </div>
                <div class="row" >
                    <div class="col-lg-12">
                        <form role="form" id="signupForm">
                          <fieldset style = " 
                                  background-color: #f9f9f9;
                                  min-width: 198px;
                                  max-width: 650px;
                                  padding: 10px 20px 0px 0px;
                                  border: 1.5px solid black;
                                  border-radius: 5px;
                                  box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                                  margin-left: auto;
                                  margin-right: auto;
                                  ">

                              <table class="table table-bordered">
                                  <div class="">
                                      <div class="page-header" font-weight: bold>
                                  <h2><small>Fill in all sections</small></h2>
                              </div>
                              <form class="form-horizontal" role="form">
                              <div class="form-group">
                                <div class="row inputFieldPadding">
                                    <label for="ssn" class="col-md-2">SSN</label>
                                    <div class="col-md-2 control-group ">
                                        <input type="text" class="form-control col-lg-12 " name="ssn">
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 5px;">
                                    <label for="state" class="col-md-2 text-center">State</label>
                                    <div class="col-md-2 control-group ">
                                        <input type="text" class="form-control col-lg-12" name="state">
                                    </div>
                                    <label for="city" class="col-md-1 ">City</label>
                                    <div class="col-md-4 control-group ">
                                        <input type="text" class="form-control col-lg-12" name="city">
                                    </div>                                    
                                </div>                                  
                                <div class="row" style="margin-top: 5px;">

                                </div>   
                                <div class="row" style="margin-top: 5px;">
                                    <label for="street" class="col-md-2">Street</label>
                                    <div class="col-md-4 control-group ">
                                        <input type="text" class="form-control col-lg-12" name="street">
                                    </div>
                                    <label for="zip" class="col-md-2">Zip Code</label>
                                    <div class="col-md-4 control-group ">
                                        <input type="text" class="form-control col-lg-12" name="zip">
                                    </div>                                    
                                </div> 
 
                                <div class="row" style="margin-top: 5px;">
                                    <label for="telephone" class="col-md-2">Telephone</label>
                                    <div class="col-md-4 control-group ">
                                        <input type="text" class="form-control col-lg-12" name="telephone">
                                    </div>
                                </div>                                    
                                <div class="row" style="margin-top: 5px;">
                                    <label for="fname" class="col-md-2">First Name</label>
                                    <div class="col-md-4 control-group ">
                                      <input type="text" class="form-control col-md-2" id="fname" name="fname">
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 5px;">
                                    <label for="lname" class="col-md-2">Last Name</label>
                                    <div class="col-md-4 control-group ">
                                      <input type="text" class="form-control col-md-2" id="lname" name="lname">
                                    </div>
                                </div>  
                                <div class="row" style="margin-top: 5px;">
                                    <label for="password" class="col-md-2">Password</label>
                                    <div class="col-md-4 control-group">
                                       <input type="password" class="form-control col-md-2" id="password" name="password">
                                    </div>
                                 </div>  
                                 <div class="row" style="margin-top: 5px;">
                                      <label for="cpassword" class="col-md-2">Confirm Password</label>
                                      <div class="col-md-4 control-group">
                                          <input type="password" class="form-control" id="cpassword" name="cpassword">
                                      </div>
                                  </div>
                                  <span id="errPass" style="color:red"></span><br> 
                                  <div class="row">
                                      <label for="email" class="col-md-2 ">Email</label>
                                      <div class="col-md-4 control-group ">
                                          <input type="text" class="form-control col-md-2" id="email" name="email">
                                      </div>
                                  </div>
                                  <div class="row">
                                      <label for="cemail" class="col-md-2 ">Confirm Email</label>
                                      <div class="col-md-4 control-group ">
                                          <input type="text" class="form-control col-lg-12" id="cemail" name="cemail">
                                      </div>
                                  </div>
                                 
                                  <span id="errEmail" style="color:red"></span><br><br>
                                      <button type="button" class="btn btn-primary" onclick="
                                          signUp(document.getElementById('password'),
                                          document.getElementById('cpassword'),
                                          document.getElementById('email'),
                                          document.getElementById('cemail'),
                                          document.getElementById('signupForm'))">Submit</button>
                                          <span style="color:greenyellow">${err}</span>
                                  </fieldset> 
                        </form>
                    </div>
                </div>
            </div>
        </header>
        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
        <script src="assets/js/classie.js"></script>
        <script src="assets/js/cbpAnimatedHeader.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="assets/js/jqBootstrapValidation.js"></script>
        <script src="assets/js/contact_me.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="assets/js/freelancer.js"></script>
        
        <script src="assets/js/LoveBucketJS/LovelyBucketCommon.js"></script>

    </body>

</html>