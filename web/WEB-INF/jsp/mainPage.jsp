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
                        <c:if test="${ currentPerson.role eq 'Manager'}">
                         <li class="page-scroll">
                            <a href="manager">Manager Tools</a>
                        </li>
                        </c:if>
                        <c:if test="${ currentPerson.role eq 'CustRep'}">
                         <li class="page-scroll">
                            <a href="custrep.html">Customer Rep Tools</a>
                        </li>
                        </c:if>                          
                        <c:if test="${ not empty currentPerson}">
                         <li class="page-scroll">
                            <a href="viewperson=${currentPerson.email}">${currentPerson.firstName}'s Account</a>
                        </li>
                        </c:if>
                         
                        <li class="page-scroll">
                            <a href="search.html">Search</a>
                        </li>
                        <c:if test="${ empty currentPerson}">
                        <li class="page-scroll">
                            <a href="login">Login</a>
                        </li>
                        </c:if>
                        <c:if test="${not empty currentPerson}">
                        <li class="page-scroll">
                            <a href="login/logout">logout</a>
                        </li>
                        </c:if>                        
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

        <!-- Header -->
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="intro-text">
                            <span class="name">Welcome to LoveBucket!</span>
                            <hr class="star-light">   
                            <small style="font-size:20px;">Love is a rough sea. Lovebucket makes it better.</small>
                            
                        </div>
                   
                </div>
            </div>
                
                        
        </header>

        <!-- Portfolio Grid Section -->
        <section id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        
                        <h2>Popular Profiles</h2>
                        <hr class="star-primary">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof0}"/></p>
                        <c:if test="${prof0!=null}">
                        <a href="viewprofile=${prof0}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof0}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/cake.png" class="img-responsive" alt="">
                        </a>
                        </c:if>        
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof1}"/></p>
                        <c:if test="${prof1!=null}">
                        <a href="viewprofile=${prof1}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof1}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/game.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof2}"/></p>
                        <c:if test="${prof2!=null}">
                        <a href="viewprofile=${prof2}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof2}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/cabin.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                </div>    
                        <div class="row">
                        <div class="col-lg-12 text-center">
                        <h2>Highest Rated Profiles</h2>
                        <hr class="star-primary">
                        </div>
                        </div>
                <div class="row">
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof3}"/></p>
                        <c:if test="${prof3!=null}">
                        <a href="viewprofile=${prof3}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof3}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/game2.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof4}"/></p>
                        <c:if test="${prof4!=null}">
                        <a href="viewprofile=${prof4}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof4}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/circus2.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof5}"/></p>
                        <c:if test="${prof5!=null}">
                        <a href="viewprofile=${prof5}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof5}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/cake.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                        <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof6}"/></p>
                        <c:if test="${prof6!=null}">
                        <a href="viewprofile=${prof6}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof6}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/circus.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof7}"/></p>
                        <c:if test="${prof7!=null}">
                        <a href="viewprofile=${prof7}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof7}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/safe.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof8}"/></p>
                        <c:if test="${prof8!=null}">
                        <a href="viewprofile=${prof8}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof8}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/cabin.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                </div>
                        <div class="row">
                        <div class="col-lg-12 text-center">
                        <h2>Most Active Profiles</h2>
                        <hr class="star-primary">
                        </div>
                        </div>
                <div class="row">
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof9}"/></p>
                        <c:if test="${prof9!=null}">
                        <a href="viewprofile=${prof9}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof9}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/submarine.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof10}"/></p>
                        <c:if test="${prof10!=null}">
                        <a href="viewprofile=${prof10}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof10}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/safe3.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof11}"/></p>
                        <c:if test="${prof11!=null}">
                        <a href="viewprofile=${prof11}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof11}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/game.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                        <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof12}"/></p>
                        <c:if test="${prof12!=null}">
                        <a href="viewprofile=${prof12}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof12}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/circus.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof13}"/></p>
                        <c:if test="${prof13!=null}">
                        <a href="viewprofile=${prof13}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof13}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/cabin.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                    <div class="col-sm-4 portfolio-item">
                        <p><c:out value="${prof14}"/></p>
                        <c:if test="${prof14!=null}">
                        <a href="viewprofile=${prof14}" class="portfolio-link" data-toggle="modal">
                            <div class="caption">
                                <div class="caption-content">
                                    <i class="fa fa-search-plus fa-3x"><p><c:out value="${prof14}"/></p></i>
                                </div>
                            </div>
                            <img src="assets/img/portfolio/cake.png" class="img-responsive" alt="">
                        </a>
                        </c:if>
                    </div>
                </div>
                        <div class="col-lg-12 text-center">
                        <small style="font-size:40px;">HOTTEST DATE LOCATIONS</small>
                        <p><c:out value="${loc0},"/><c:out value=" ${loc1},"/><c:out value=" ${loc2},"/><c:out value=" ${loc3}"/></p>
                        <hr class="star-primary">
                        </div>
            </div>
        </section>

        <!-- About Section -->


        <!-- Footer -->
        <footer class="text-center">
            <div class="footer-below">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            LoveBucket &copy; 2014
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
        <div class="scroll-top page-scroll visible-xs visble-sm">
            <a class="btn btn-primary" href="#page-top">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>

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

