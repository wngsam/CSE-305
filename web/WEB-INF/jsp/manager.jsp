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
                            <span class="name">Manager Tools</span>
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
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Add Employee</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" >
                            <div class="panel-body" style="text-align:center;max-width:500px;margin-left:auto;margin-right:auto">
                                <p>Note: To add a new employee they must already be signed up as a basic user.</p>
                                <form name="addForm" method="GET" action="managerAddEmployee">
                                    <label >SSN</label> <input name="SSN" type="text" class="form-control "> 
                                    <label >Role</label> <input name="role" type="text" class="form-control"> 
                                    <label>Start Date</label> <input name="startDate" type="date" class="form-control"> 
                                    <label>Hourly Rate</label> <input name="hourlyRate" type="number"class="form-control" > 
                                    <p class="help-block text-danger">${addError}</p> 
                                    <button onClick="submitAddEmployee()" class="btn btn-success btn-lg">Submit New Employee</button>
                                </form>                     
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Edit Employee</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" >
                            <div class="panel-body" style="text-align:center;max-width:500px;margin-left:auto;margin-right:auto">
                                <p>Note: Employee must exist to be edited.</p>
                                <form name="editEmployee" method="GET" action="managerEditEmployee">
                                    <label >SSN</label> <input name="SSN" type="text" class="form-control "> 
                                    <label >Role</label> <input name="role" type="text" class="form-control"> 
                                    <label>Start Date</label> <input name="startDate" type="date" class="form-control"> 
                                    <label>Hourly Rate</label> <input name="hourlyRate" type="text"class="form-control" > 
                                    <p class="help-block text-danger">${editError}</p> 
                                    <button onClick="submitEditEmployee()" class="btn btn-success btn-lg">Submit Employee Edit</button>
                                </form>                                    
                            </div>
                        </div>
                    </div>   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Delete Employee</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" >
                            <div class="panel-body" style="text-align:center;max-width:500px;margin-left:auto;margin-right:auto">
                                <p>Note: Person associated with employee will also be terminated.</p>
                                <form name="deleteForm" method="GET" action="managerDeleteEmployee" role="form">
                                    <label >SSN</label><input type="text" name="SSN" class="form-control ">  
                                    <button onClick="submitDeleteEmployee()" class="btn btn-success btn-lg">Submit SSN of employee to dismiss</button>
                                </form>                                    
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">View Sales Report</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">View All Persons</a>
                            </h4>
                        </div>
                        <div id="collapse5" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <td>SSN</td> <td>First Name</td> <td>Last Name</td> <td>State</td> <td>City</td> <td>Street</td> <td>Zip code</td> <td>Email</td>
                                    </thead>
                                    <c:forEach items="${allPersons}" var="onePerson">
                                    <tr>
                                        <td>${onePerson.SSN}</td> <td>${onePerson.firstName}</td> <td>${onePerson.lastName}</td> <td>${onePerson.state}</td> <td>${onePerson.city}</td> <td>${onePerson.street}</td>
                                        <td>${onePerson.zipcode}</td> <td>${onePerson.email}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>                   
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">View Dates on a Calendar Date</a>
                            </h4>
                        </div>
                        <div id="collapse6" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>                  
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">View Dates Involving a Particular Customer</a>
                            </h4>
                        </div>
                        <div id="collapse7" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">Revenue Generated by Dates on a Calendar Date</a>
                            </h4>
                        </div>
                        <div id="collapse8" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse9">Revenue Generated by Dates Involving Particular Customer</a>
                            </h4>
                        </div>
                        <div id="collapse9" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>                    
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse10">Top Customer Representative by Revenue</a>
                            </h4>
                        </div>
                        <div id="collapse10" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>               
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse11">Top Customer by Revenue</a>
                            </h4>
                        </div>
                        <div id="collapse11" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse12">View Most Active Customers</a>
                            </h4>
                        </div>
                        <div id="collapse12" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <td>SSN</td> <td>First Name</td> <td>Last Name</td> <td>State</td> <td>City</td> <td>Street</td> <td>Zip code</td> <td>Email</td>
                                    </thead>
                                    <c:forEach items="${activePerson}" var="actPerson">
                                    <tr>
                                        <td>${actPerson.SSN}</td> <td>${actPerson.firstName}</td> <td>${actPerson.lastName}</td> <td>${actPerson.state}</td> <td>${actPerson.city}</td> <td>${actPerson.street}</td>
                                        <td>${actPerson.zipcode}</td> <td>${actPerson.email}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse13">View Customers Who Have Dated A Particular Customer</a>
                            </h4>
                        </div>
                        <div id="collapse13" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse14">View Highest Rated Customers</a>
                            </h4>
                        </div>
                        <div id="collapse14" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <td>SSN</td> <td>First Name</td> <td>Last Name</td> <td>State</td> <td>City</td> <td>Street</td> <td>Zip code</td> <td>Email</td>
                                    </thead>
                                    <c:forEach items="${highPerson}" var="hiPerson">
                                    <tr>
                                        <td>${hiPerson.SSN}</td> <td>${hiPerson.firstName}</td> <td>${hiPerson.lastName}</td> <td>${hiPerson.state}</td> <td>${hiPerson.city}</td> <td>${hiPerson.street}</td>
                                        <td>${hiPerson.zipcode}</td> <td>${hiPerson.email}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse15">View Highest Rated Calendar Dates to Have a Date On</a>
                            </h4>
                        </div>
                        <div id="collapse15" class="panel-collapse collapse" >
                            <div class="panel-body">
                                <p>s</p>
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>                   
          
        <script> 
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

