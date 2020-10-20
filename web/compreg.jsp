<%
String email = (String)session.getAttribute("email");
String pwd = (String)session.getAttribute("pwd");
if( email==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
 %>
 <%@ page import="java.sql.*" %>

<%
String problem = request.getParameter("type");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "property", "property");  
	 System.out.println("Connection Established");
         
          PreparedStatement pstmt = con.prepareStatement("insert into complaint values(?,?)");
		 
		
		 pstmt.setString(1, email);
		 pstmt.setString(2, problem);
		
	
		
		 
		 int i = pstmt.executeUpdate();
		 
		 if(i>0)
		 {
			response.sendRedirect("dashboard.jsp");
		 }
		 else
		 {
                     
                    response.sendRedirect("complaint.jsp");
		 }
		
	 }
	 
	 
	 
	 
catch(Exception e)
{
	out.println(e);
}
         %>