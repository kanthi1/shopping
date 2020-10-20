<%@ page import="java.sql.*" %>
<%
String email = (String)session.getAttribute("email");
String pwd = (String)session.getAttribute("pwd");
if( email==null || pwd==null)
{
    response.sendRedirect("usession.html");
}
%>
<%
String name = request.getParameter("name");
String type = request.getParameter("type");
String from = request.getParameter("from");
String to = request.getParameter("to");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "property", "property");  
	 System.out.println("Connection Established");
 PreparedStatement ps = con.prepareStatement("select * from space where typeofland=? and startdate=? or enddate=?");
	 ps.setString(1, email);
	 ps.setString(2, type);
         ps.setString(3,to);
	 
	 ResultSet rs = ps.executeQuery();
	 
	 if(rs.next())
	 {
             
		 %>
                 <h3><b>the slot not available try another slot</b></h3>
                 <p><a href="RegiSpace.jsp"> register again </a></p>
			<%  
            
	 }
         
         else
         {
		 PreparedStatement pstmt = con.prepareStatement("insert into space values(?,?,?,?,?)");
		 
		
		 pstmt.setString(1, email);
		 pstmt.setString(2, name);
		 pstmt.setString(3,type);
		 pstmt.setString(4, from);
		pstmt.setString(5, to);
		 
		 int i = pstmt.executeUpdate();
		
		 if(i>0)
		 {
                      response.sendRedirect("dashboard.jsp");
			%>
	
			<% 
		 }
		 else
		 {
				%>
				<h3>User Registration UnSuccessful</h3><br>
		<a href="RegiSpace.html">Try to Register Again</a>
				<% 
		 }
		
	 }
}
	 
	 
	 
	 
catch(Exception e)
{
	out.println(e);
}

%>