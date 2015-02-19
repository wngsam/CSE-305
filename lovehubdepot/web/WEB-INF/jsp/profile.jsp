<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>LoveBucket</title>
        <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="assets/css/freelancer.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="assets/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <style type="text/css">
            largefont{
                font-size: 60px;
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
                    <form class="navbar-form navbar-left" role="search" id="search">
                        <div class="form-group">
                            <label class="sr-only" for ="searchInput">Search</label>
                            <input type="text" class="form-control" id="searchInput" name="searchInput" placeholder = "Search by Profile" onkeypress="return enterSearch(event, document.getElementById('search'))">
                        </div>
                        <button type="button" class="btn btn-large btn-primary " >Search</button>
                    </form>
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
                            <a href="mainPage.html">Sign out</a>
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

        <!-- Header -->
        <header>
            <div class="container">
                <div class="row" align ="left">
                    <div class="col-lg-12">
                        <div align="left" class="intro-text">
                            <span class="name2">${currentProfile.profileID}</span>      
                        </div>
                        <img align="left" class="img-responsive" src="assets/img/profile.png" alt="">  
                        <div class="row">
                            <table style="
                                   margin-left: 555px;
                                   font-size:1.5em;">
                                <thead>
                                    <tr>
                                        <th>Profile Information</th><th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Age:</td><td>${currentProfile.age}</td>
                                    </tr>
                                    <tr>
                                        <td>Dating Age Range Start:</td><td>${currentProfile.datingAgeRangeStart}</td>
                                    </tr>
                                    <tr>
                                        <td>Dating Age Range End:</td><td>${currentProfile.datingAgeRangeEnd}</td>
                                    </tr>
                                    <tr>
                                        <td>Dating Geo Range:</td><td>${currentProfile.datinGeoRange}</td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td><td>${currentProfile.gender}</td>
                                    </tr>
                                    <tr>
                                        <td>Hobbies:</td><td>${currentProfile.hobbies}</td>
                                    </tr>
                                    <tr>
                                        <td>Weight:</td><td>${currentProfile.weight}</td>
                                    </tr>
                                    <tr>
                                        <td>Height:</td><td>${currentProfile.height} 

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Hair Color:</td><td>${currentProfile.hairColor}</td>
                                    </tr>

                                </tbody>
                            </table>

                        </div>

                    </div>
                    <div >
                        <button class="btn btn-danger">Like</button>
                        <div class="col-lg-2">
                            <a href="profileinfo.html" class="btn btn-danger">Edit Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Portfolio Grid Section -->
        <div class="container" style="
             
             margin-top: 25px;
             margin-bottom: 100px;">
            <div class="row" style="
                 margin-bottom:100px;
                 box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                 ">
                <h1 class="col-lg-offset-5">Dates</h1>

                <table class="table-bordered" style="
                       margin-bottom:25px;
                       font-size:16px;">
                    <tr style="
                        font-weight: bold;">
                        <td class="col-lg-2">Profile1</td>
                        <td class="col-lg-2">Profile2</td>
                        <td class="col-lg-2">Cust_Rep</td>
                        <td class="col-lg-2">Date_Time</td>
                        <td class="col-lg-2">Location</td>
                        <td class="col-lg-2">BookingFee</td>
                        <td class="col-lg-2">Comments</td>
                        <td class="col-lg-3">User1Rating</td>
                        <td class="col-lg-3">User2Rating</td>
                        </font>
                    </tr>

                    <c:forEach items="${dates}" var="date" varStatus="count">
                        <tr>
                            <td class="col-lg-2">${date.profile1}</td>
                            <td class="col-lg-2">${date.profile2}</td>
                            <td class="col-lg-2">${date.getCustRep()}</td>
                            <td class="col-lg-2">${date.getDate_Time()}</td>
                            <td class="col-lg-2">${date.getLocation()}</td>
                            <td class="col-lg-2">${date.getBookingFee()}</td>
                            <td class="col-lg-2">${date.getComments()}</td>
                            <td class="col-lg-3">${date.getUser1Rating()}</td>
                            <td class="col-lg-3">${date.getUser2Rating()}</td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                    </c:forEach>
                </table>
            </div>
            <div class="row" style="
                
                 box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                 margin-top:50px;
                 ">
                <h1 class="col-lg-offset-5">Likes</h1>

                <table  style="     
                        
                       margin-left:100px;
                       margin-bottom:25px;
                       font-size:16px;">
                    <tr style="
                        font-weight: bold;
                        font-size:24px;" >
                        <td class="col-lg-2">Liker</td>
                        <td class="col-lg-2">Date_Time</td>
                        </font>
                    </tr>

                    <c:forEach items="${likes}" var="like" varStatus="count">
                        <tr>
                            <td class="col-lg-2">${like.liker}</td>
                            <td class="col-lg-2">${like.date_Time}</td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                    </c:forEach>
                </table>
            </div>
        </div>


              <footer class="text-center">
            <div class="footer-below">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            &copy; LoveBucket 2014
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Portfolio Modals -->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Project Title</h2>
                                <hr class="star-primary">
                                <img src="assets/img/portfolio/cabin.png" class="img-responsive img-centered" alt="">
                                <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                                <ul class="list-inline item-details">
                                    <li>Client:
                                        <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                        </strong>
                                    </li>
                                    <li>Date:
                                        <strong><a href="http://startbootstrap.com">April 2014</a>
                                        </strong>
                                    </li>
                                    <li>Service:
                                        <strong><a href="http://startbootstrap.com">Web Development</a>
                                        </strong>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Project Title</h2>
                                <hr class="star-primary">
                                <img src="img/portfolio/cake.png" class="img-responsive img-centered" alt="">
                                <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                                <ul class="list-inline item-details">
                                    <li>Client:
                                        <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                        </strong>
                                    </li>
                                    <li>Date:
                                        <strong><a href="http://startbootstrap.com">April 2014</a>
                                        </strong>
                                    </li>
                                    <li>Service:
                                        <strong><a href="http://startbootstrap.com">Web Development</a>
                                        </strong>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Project Title</h2>
                                <hr class="star-primary">
                                <img src="img/portfolio/circus.png" class="img-responsive img-centered" alt="">
                                <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                                <ul class="list-inline item-details">
                                    <li>Client:
                                        <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                        </strong>
                                    </li>
                                    <li>Date:
                                        <strong><a href="http://startbootstrap.com">April 2014</a>
                                        </strong>
                                    </li>
                                    <li>Service:
                                        <strong><a href="http://startbootstrap.com">Web Development</a>
                                        </strong>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Project Title</h2>
                                <hr class="star-primary">
                                <img src="img/portfolio/game.png" class="img-responsive img-centered" alt="">
                                <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                                <ul class="list-inline item-details">
                                    <li>Client:
                                        <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                        </strong>
                                    </li>
                                    <li>Date:
                                        <strong><a href="http://startbootstrap.com">April 2014</a>
                                        </strong>
                                    </li>
                                    <li>Service:
                                        <strong><a href="http://startbootstrap.com">Web Development</a>
                                        </strong>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Project Title</h2>
                                <hr class="star-primary">
                                <img src="assets/img/portfolio/safe.png" class="img-responsive img-centered" alt="">
                                <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                                <ul class="list-inline item-details">
                                    <li>Client:
                                        <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                        </strong>
                                    </li>
                                    <li>Date:
                                        <strong><a href="http://startbootstrap.com">April 2014</a>
                                        </strong>
                                    </li>
                                    <li>Service:
                                        <strong><a href="http://startbootstrap.com">Web Development</a>
                                        </strong>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal">
                    <div class="lr">
                        <div class="rl">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-lg-offset-2">
                            <div class="modal-body">
                                <h2>Project Title</h2>
                                <hr class="star-primary">
                                <img src="img/portfolio/submarine.png" class="img-responsive img-centered" alt="">
                                <p>Use this area of the page to describe your project. The icon above is part of a free icon set by <a href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On their website, you can download their free set with 16 icons, or you can purchase the entire set with 146 icons for only $12!</p>
                                <ul class="list-inline item-details">
                                    <li>Client:
                                        <strong><a href="http://startbootstrap.com">Start Bootstrap</a>
                                        </strong>
                                    </li>
                                    <li>Date:
                                        <strong><a href="http://startbootstrap.com">April 2014</a>
                                        </strong>
                                    </li>
                                    <li>Service:
                                        <strong><a href="http://startbootstrap.com">Web Development</a>
                                        </strong>
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="assets/js/jquery.js"></script>

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

    </body>

</html>

