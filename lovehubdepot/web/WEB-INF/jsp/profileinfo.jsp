<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>LoveBocket Profile</title>

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
        </style>

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
                            <a href="login.html">Login</a>
                        </li>
                        <li class="page-scroll">
                            <a href="signup.html">Register</a>
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
            <section id="register" >
                <div class="container " >
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2>ProfileID</h2> <h2>SSN</h2>
                            <hr class="star-primary">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <!-- To configure the register form email address, go to mail/register_me.php and update the email address in the PHP file on line 19. -->
                            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
                            <form name="sentMessage" id="registerForm" novalidate>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Age</label>
                                        <input type="text" class="form-control" placeholder="Age" id="name" required data-validation-required-message="Please enter your age.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Dating Age Range Start</label> 
                                        <input type="text" class="form-control" placeholder="DatingAgeRangeStart" id="datingagerangestart" required data-validation-required-message="Please enter your dating age range start.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Dating Age Range End</label> 
                                        <input type="text" class="form-control" placeholder="DatingAgeRangeEnd" id="datingagerangeend" required data-validation-required-message="Please enter your last dating age range end.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                 <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Dating Geo Range</label>
                                        <input type="text" class="form-control" placeholder="Dating Geo Range" id="name" required data-validation-required-message="Please enter your dating age range.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                 <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Gender</label>
                                        <input type="text" class="form-control" placeholder="Gender" id="name" required data-validation-required-message="Please enter your gender.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                 <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Hobbies</label>
                                        <input type="text" class="form-control" placeholder="Hobbies" id="name" required data-validation-required-message="Please enter your hobbies.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Height</label>
                                        <input type="text" class="form-control" placeholder="Height" id="name" required data-validation-required-message="Please enter your height.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Weight</label>
                                        <input type="text" class="form-control" placeholder="Weight" id="name" required data-validation-required-message="Please enter your weight.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="row control-group">
                                    <div class="form-group col-xs-12 floating-label-form-group controls">
                                        <label>Hair Color</label>
                                        <input type="text" class="form-control" placeholder="Hair Color" id="name" required data-validation-required-message="Please enter your hair color.">
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                  
                                <br>
                                <div id="success"></div>
                                <div class="row">
                                    <div class="form-group col-xs-12">
                                        <button type="submit" class="btn btn-success btn-lg">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
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
        <script src="assets/js/register.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="assets/js/freelancer.js"></script>

    </body>

</html>