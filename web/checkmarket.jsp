<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "property", "property");  
	 System.out.println("Connection Established");

	 PreparedStatement ps = con.prepareStatement("select * from marketing where email=?and password=?");
	 ps.setString(1, email);
	 ps.setString(2, pwd);
         
	 
	 ResultSet rs = ps.executeQuery();

	  if(rs.next())
	  {       
		 session.setAttribute("email", email);
		 session.setAttribute("pwd", pwd);
		 session.setMaxInactiveInterval(100);
		 response.sendRedirect("marketdashboard.jsp");
	  }
         }
catch(Exception e)
{
	out.println(e);
}

%>