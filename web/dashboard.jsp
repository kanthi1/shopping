<%@ page import="java.sql.*" %>

<%
String email = (String)session.getAttribute("email");
String pwd = (String)session.getAttribute("pwd");
if( email==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
 %>
 		<!DOCTYPE html>
<html lang="en">
<head>
  <title>Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
   
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
          <li><a>DASHBOARD</a></li>
      </ul>
         <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron">
  <div class="container text-center">
      <h1><b>Welcome</b></h1>      
    <p>
        <%
  out.println("<b>"+email+"</b>");
 %>
       </p>
  </div>
</div>

</div><br>

<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-sm-3">
      
        <img src="https://cdn2.vectorstock.com/i/1000x1000/59/81/green-tick-check-mark-icon-simple-style-vector-8375981.jpg" class="img-responsive" style="width:100%" style="height: 70%" alt="register">
      <p><a href="RegiSpace.jsp">Register Space</a></p>
    </div>
    <div class="col-sm-3"> 
     
      <img src="https://www.clipartkey.com/mpngs/m/219-2194375_money-bag-animation-drawing-clip-art-animated-transparent.png" class="img-responsive" style="width:100%"  style="height: 70%"alt="Image">
        <p><a href="revenue.jsp">Revenue Generated</a></p>
    </div>
    <div class="col-sm-3"> 
     
      <img src="https://blog.advids.co/wp-content/uploads//2017/05/customer.jpg" class="img-responsive" style="width:100%" alt="Image">
       <p><a href="complaint.jsp">Register Complaint</a></p>
    </div>
    
  </div>
</div><br><br>

<footer class="container-fluid text-center">
  <p></p>
</footer>

</body>
</html>