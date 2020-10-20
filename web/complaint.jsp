<%
String email = (String)session.getAttribute("email");
String pwd = (String)session.getAttribute("pwd");
if( email==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
%>
<html>
    <head>
        <title>Register Space</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    
     <body>
       <div class="container">
  <h2 style="color:red">Register Complaint</h2>
  <form action="compreg.jsp">
    <div class="form-group">
      <label for="type">PROBLEM</label>
      <select id="type" name="type">
          <option value="Selet">---Select---</option>
    <option value="electrical">electrical</option>
    <option value="carperntry">carperntry</option>
    <option value="plumbing">plumbing</option>
    <option value="security">security</option>
    <option value="AC">AC</option>

  </select>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

    </body>
</html>