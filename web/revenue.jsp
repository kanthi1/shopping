<%@page import="java.time.temporal.ChronoUnit"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.* " %>
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
<th>START DATE</th>
<th>END DATE</th>
<th>INCOME</th>
</tr>
<%

Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "property", "property");  
System.out.println("Connection Established");
 
 PreparedStatement pstmt = con.prepareStatement("select * from space where email=?");
  pstmt.setString(1, email);
ResultSet rs = pstmt.executeQuery();
 while(rs.next())
{
    String y=rs.getString("startdate");
    String type=rs.getString("typeofland");
    LocalDate myObj = LocalDate.now(); 
     String x=myObj.toString();
       int sum=0,c;
     LocalDate dateBefore = LocalDate.parse(y);
	LocalDate dateAfter = LocalDate.parse(x);
	long days = ChronoUnit.DAYS.between(dateBefore, dateAfter);
	System.out.println(days);
     int dd=(int)days;
	if(type.equals("Shop-Small"))
	{
	    if(dd<7){
	    sum=dd*1000;
            System.out.println(sum);
            %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
            }
	    else
	    {
	    c=dd/7;
	    dd=dd-c;
	    dd=dd*1000;
	    sum=dd+c*750*24;
            System.out.println(sum);
            %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
	    }
	    
	}
        if(type.equals("Shop-Medium"))
	{
	    if(dd<7)
            {
	    sum=dd*3000;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
            }
	    else
	    {
	    c=dd/7;
	    dd=dd-c;
	    dd=dd*1000;
	    sum=dd+c*1250;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
	    }
	    
	}
        if(type.equals("Shop-Large"))
	{
	    if(dd<7)
            {
	    sum=dd*10000;
             %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
            }
	    else
	    {
	    c=dd/7;
	    dd=dd-c;
	    dd=dd*1000;
	    sum=dd+c*3000;
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
              
	    }
	    
	}
        if(type.equals("Atrium?North and West"))
	{
	    if(dd<7){
	    sum=dd*600*24;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
            }
	    else
	    {
	    c=dd/7;
	    dd=dd-c; 
	    dd=dd*1000;
	    sum=dd+c*2000*24;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
	    }
	    
	}
        if(type.equals("Atrium?South"))
	{
	    if(dd<7)
            {
	    sum=dd*750*24;
             System.out.println(sum);
             %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
            }
	    else
	    {
	    c=dd/7;
	    dd=dd-c;
	    dd=dd*1000;
	    sum=dd+c*1500*24;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
	    }
	    
	}
        if(type.equals("Cinema Theater"))
	{
	   
	    c=dd/7;
	    c=c*100000;
	      System.out.println(c);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=c%></td>
	</tr>
             <%
	} 
        if(type.equals("Marketing Banners"))
	{
	    if(dd<7)
            {
	    sum=dd*100*1000;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
            }
	    else
	    {
	    c=dd/7;
	    dd=dd-c;
	    dd=dd*1000*100;
	    sum=dd+c*100*2500;
              System.out.println(sum);
              %>
             <tr align=center bgcolor="#eeeeee">
	<td><%=rs.getString("email")%></td>
        <td><%=rs.getString("startdate")%></td>
        <td><%=x%></td>
         <td><%=sum%></td>
	</tr>
             <%
	    }
	    
	}
}
 %>  
         


