<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "property", "property");  
	 System.out.println("Connection Established");

	 PreparedStatement ps = con.prepareStatement("select * from property where email=? or phone=?");
	 ps.setString(1, email);
	 ps.setString(2, phone);
	 
	 ResultSet rs = ps.executeQuery();
	 
	 if(rs.next())
	 {
             
		 %>
			
			<%  
             RequestDispatcher rd = request.getRequestDispatcher("/Register.html");
        rd.forward(request, response);
	 }
	 else
	 {
		 PreparedStatement pstmt = con.prepareStatement("insert into property values(?,?,?,?)");
		 
		
		 pstmt.setString(1, name);
		 pstmt.setString(2, email);
		 pstmt.setString(3, pwd);
		 pstmt.setString(4, phone);
		
		 
		 int i = pstmt.executeUpdate();
		 RequestDispatcher rd = request.getRequestDispatcher("/login.html");
        rd.forward(request, response);
		 if(i>0)
		 {
			%>
			<h3>User Registration Successful</h3><br>
	
			<% 
		 }
		 else
		 {
				%>
				<h3>User Registration UnSuccessful</h3><br>
		<a href="index.html">Try to Register Again</a>
				<% 
		 }
		
	 }
	 
	 
	 
	 
}
catch(Exception e)
{
	out.println(e);
}

%>