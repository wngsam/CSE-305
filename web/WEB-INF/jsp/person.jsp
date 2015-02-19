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

        <script>
            function requestdate() {

                var yourprofile = $('#yourprofile').val();
                var dateprofile = $('#dateprofile').val();

                var profiles = ${profiles};
                var json = {"profiles": profiles};
                $.ajax({
                url: "/requestdate",
                        type: 'Post',
                        data: json,
                        success:function (response) {
                            alert(response);
                            }
                    error:fucntion(e){
                    alert('Error:' + E);
                    }
                });
            }

        </script>
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
                            <a href="login/logout">Logout</a>
                        </li>
                        <li class="page-scroll">
                            <a href="contact.html"></a>
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
                    <div align="left" class="intro-text">
                        <span class="name2">${person.firstName} ${person.lastName}</span>      
                    </div>
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <h2>Profiles</h2>
                        </div>
                        <div >
                            <div align="right" class="col-lg-3">
                                <form method="POST" action="requestdate" role="form" style="color:black;">   
                                    <button class="btn btn-primary" onclick="requestdate();">Edit Account</button>
                                </form>       
                            </div>

                            <form class="col-lg-7" method="POST" action="search" role="form">
                                <fieldset style = " 
                                          background-color: #F0F0F0;
                                          width: 90%;
                                          padding: 10px;
                                          border: 1.5px solid blue;
                                          border-radius: 5px;
                                          box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);

                                          ">
                                    <c:forEach items="${profiles}" var="profile" varStatus="count">

                                        <P align="center"><a href="viewprofile=${profile.profileID}">${profile.profileID}</a></P>
                                        </c:forEach>
                                </fieldset>
                            </form>
                            <div class="col-lg-2">
                                <form method="POST" action="deleteprofile=${person.SSN}" role="form" style="color:black;">
                                    Profile ID: <input type="text" name="profileid"><br><br>
                                    <button class="btn btn-primary">Delete Profile</button>
                                </form>  
                                <a style="margin-top:10px;"href="newprofile=${person.SSN}" class="btn btn-primary">Create Profile</a>
                            </div>
                        </div>
                    </div>


                    <div class="row" align="left">
                        <div class="col-lg-12 text-center">
                            <h2>Pending Dates</h2>
                        </div>
                        <div >
                            <div align="right" class="col-lg-3">
                                <form method="POST" action="requestdate=${person.SSN}" role="form" style="color:black;">
                                    Your Profile: <input type="text" name="yourprofile"><br><br>
                                    Date Profile: <input type="text" name="dateprofile"><br><br>
                                    <button class="btn btn-primary" onclick="requestdate();">Request Date</button>
                                </form>       
                            </div>
                            <form class="col-lg-7" method="POST" action="search" role="form">
                                <fieldset style = " 
                                          background-color: #F0F0F0;
                                          width: 90%;
                                          padding: 10px;
                                          border: 1.5px solid blue;
                                          border-radius: 5px;
                                          box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                                          ">
                                    <P style="color:black"><text class="col-lg-4">Date Number</text>
                                        <text class="col-lg-4">Your Profile</text>Date Profile</P>
                                        <c:forEach items="${pendingdate}" var="pendingdate" varStatus="count">

                                        <P ><span style="color:black" class="col-lg-3">${pendingdate.id}</span>
                                            <a class="col-lg-5" href="viewprofile=${pendingdate.profile1}">${pendingdate.profile1}</a>
                                            <a href="viewprofile=${pendingdate.profile2}">${pendingdate.profile2}</a>
                                        </P>
                                    </c:forEach>
                                </fieldset>  
                            </form>
                            <div class="col-lg-2" >
                                <form method="POST" action="deletedate=${person.SSN}" role="form" style="color:black;">
                                    Date Number: <input type="text" name="id"><br><br>
                                    <button class="btn btn-primary" >Delete Date</button>
                                </form>  
                                <form method="POST" action="geodate=${person.SSN}" role="form" style="color:black;">
                                    Your Profile: <input type="text" name="profileid"><br><br>
                                    <button class="btn btn-primary" >Request Geo Date</button>
                                </form> 
                            </div>
                        </div>
                    </div>
                    <div class="row" align="left">
                        <div class="col-lg-12 text-center">
                            <h2>Referrals</h2>
                        </div>
                        <div >
                            <div align="right" class="col-lg-3">
                                <form method="POST" action="referdate=${person.SSN}" role="form" style="color:black;">
                                    Your Profile: <input type="text" name="yourprofile"><br><br>
                                    Profile A: <input type="text" name="profilea"><br><br>
                                    Profile B: <input type="text" name="profileb"><br><br>
                                    <button class="btn btn-primary" >Refer Date</button>
                                </form>       
                            </div >
                            <form class="col-lg-7" method="POST" action="search" role="form">
                                <fieldset style = " 
                                          background-color: #F0F0F0;
                                          width: 90%;
                                          padding: 10px;
                                          border: 1.5px solid blue;
                                          border-radius: 5px;
                                          box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                                          ">
                                    <P style="color:black"><text class="col-lg-4">Profile A</text>
                                        <text class="col-lg-6">Profile B</text>Profile C</P>
                                        <c:forEach items="${blinddate}" var="blinddate" varStatus="count">

                                        <P>  <a class="col-lg-3" href="viewprofile=${blinddate.profileA}">${blinddate.profileA}</a>
                                            <a class="col-lg-5" href="viewprofile=${blinddate.profileB}">${blinddate.profileB}</a>
                                            <a href="viewprofile=${blinddate.profileC}">${blinddate.profileC}</a>
                                        </P>
                                    </c:forEach>
                                </fieldset>  
                            </form>
                            <div class="col-lg-2" >
                                <form method="POST" action="deleterefdate=${person.SSN}" role="form" style="color:black;">
                                    Your Profile: <input type="text" name="yourprofile"><br><br>
                                    Profile A: <input type="text" name="profilea"><br><br>
                                    Profile B: <input type="text" name="profileb"><br><br>
                                    <button class="btn btn-primary" >Delete Referral</button>
                                </form>  
                            </div>
                        </div>
                    </div>
                    <div class="row" align="left">
                        <div class="col-lg-12 text-center">
                            <h2>Account</h2>
                        </div>
                        <div >
                            <div align="right" class="col-lg-3">
                                <form method="POST" action="createaccount=${person.SSN}" role="form" style="color:black;">
                                    Card Number: <input type="text" name="cardnumber"><br><br>
                                    Acct Number: <input type="text" name="accountnumber"><br><br>
                                    <button class="btn btn-primary" >Create Account</button>
                                </form>       
                            </div >
                            <form class="col-lg-7" method="POST" action="search" role="form">
                                <fieldset style = " 
                                          background-color: #F0F0F0;
                                          width: 90%;
                                          padding: 10px;
                                          border: 1.5px solid blue;
                                          border-radius: 5px;
                                          box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                                          ">
                                    <P style="color:black">
                                        <text class="col-lg-6">Card Number</text>Account Number</P>
                                        <c:forEach items="${account}" var="account" varStatus="count">
                                            
                                        <P> <span style="color:black" class="col-lg-6">${account.cardNumber}</span>
                                            <span style="color:black" class="col-lg-3">${account.acctNum}</span>
                                        </P>
                                    </c:forEach>
                                </fieldset>  
                            </form>
                            <div class="col-lg-2" >
                                <form method="POST" action="deleteaccount=${person.SSN}" role="form" style="color:black;">
                                    Card Number: <input type="text" name="cardnumber"><br><br>
                                    <button class="btn btn-primary" >Delete Account</button>
                                </form>  
                            </div>
                        </div>
                    </div>
                                    <div class="row" align="left">
                        <div class="col-lg-12 text-center">
                            <h2>User</h2>
                        </div>
                        <div >
                           
                            <form class="col-lg-7 col-lg-offset-3" method="POST" action="search" role="form">
                                <fieldset style = " 
                                          background-color: #F0F0F0;
                                          width: 90%;
                                          padding: 10px;
                                          border: 1.5px solid blue;
                                          border-radius: 5px;
                                          box-shadow: 0px 0px 10px 4px rgba(119, 119, 119, 0.75);
                                          ">
                                    <P style="color:black">
                                        <text class="col-lg-6">PPP</text>Rating</P>
                                        <c:forEach items="${user}" var="user" varStatus="count">
                                            
                                        <P> <span style="color:black" class="col-lg-6">${user.PPP}</span>
                                            <span style="color:black" class="col-lg-3">${user.getRating()}</span>
                                        </P>
                                    </c:forEach>
                                </fieldset>  
                            </form>
                            <div class="col-lg-2" >
                                <form method="POST" action="upgradeaccount=${person.SSN}" role="form" style="color:black;">
                                   
                                    <button class="btn btn-primary" >Upgrade Account</button>
                                </form>  
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>


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

