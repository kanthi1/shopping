<%@ page import="java.sql.*" %>
<%
String email = (String)session.getAttribute("email");
String pwd = (String)session.getAttribute("pwd");
 if(email==null || pwd==null)
{
    response.sendRedirect("usession1.html");
}
%>
<html>
    <head>
        <title>Simple JSP Application</title>
    </head>
<table align=center width="800">
<tr align=center bgcolor="#eeeeee" border=1>
<th>EMAIL ID</th>
<th>PROBLEM</th>
</tr>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "property", "property");  
System.out.println("Connection Established");
 
 PreparedStatement pstmt = con.prepareStatement("select * from complaint");
ResultSet rs = pstmt.executeQuery();
 while(rs.next())
{
	%>
	<tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("problem")%></td>
	</tr>
	<%
}

%>




</table>


    </body>
</html>



