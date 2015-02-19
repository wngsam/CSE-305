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
        <script src="assets/js/jquery.js"></script>
    </head>

    

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
                        <c:if test="${ not empty currentPerson}">
                         <li class="page-scroll">
                            <a href="viewperson=${currentPerson.email}">${currentPerson.firstName}'s Account</a>
                        </li>
                        </c:if>
                        <c:if test="${not empty currentPerson}">
                        <li class="page-scroll">
                            <a href="login/logout">logout</a>
                        </li>
                        </c:if>                        
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
                            <span class="name">Customer Rep. Tools</span>
                            <hr class="star-light">   
                        </div>
                   </div>
                </div>            
            </div>
        </header>
            <div class="row">
                <div class="panel-group" id="accordion" style="text-align:center;">
                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">List date suggestions for a given profile</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" >
                            <div class="panel-body" style="text-align:center;max-width:500px;margin-left:auto;margin-right:auto">
                                <p>Enter ProfileID</p>
                                <form name="suggForm" method="GET" action="custrepSugg.html" role="form">
                                    <label >ProfileID</label><input type="text" name="PID" class="form-control ">  
                                    <button onClick="submitDateSuggest()" class="btn btn-success btn-lg">Submit</button>
                                </form>                                    
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <td>ProfileID</td> <td>OwnerSSN</td> <td>Age</td> <td>DatingAgeRangeStart</td> <td>DatingAgeRangeEnd</td> <td>DatinGeoRange</td> <td>M_F</td> <td>Hobbies</td> <td>Height</td> <td>Weight</td> <td>HairColor</td> <td>CreationDate</td> <td>LastModDate</td>
                                    </thead>
                                    <c:forEach items="${dateSuggest}" var="pro">
                                    <tr>
                                        <td>${pro.profileID}</td> <td>${pro.ownerSSN}</td> <td>${pro.age}</td> <td>${pro.datingAgeRangeStart}</td> <td>${pro.datingAgeRangeEnd}</td> <td>${pro.datinGeoRange}</td> <td>${pro.gender}</td> <td>${pro.hobbies}</td> <td>${pro.hairColor}</td> <td>${pro.height}</td> <td>${pro.weight}</td> 
                                        <td>${pro.creationDate}</td> <td>${onePerson.lastModDate}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>                   
          
        <script> 
            function submitDateSuggest()
            {
                document.forms.suggForm.submit();
            }
            function submitAddEmployee()
            {
                document.forms.addForm.submit();
            }            
            function submitDeleteEmployee()
            {
                document.forms.deleteForm.submit();
            }
            function submitEditEmployee()
            {
                document.forms.editEmployee.submit();
            }
        </script>


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
    

</html>
