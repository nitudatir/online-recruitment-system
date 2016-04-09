<%@ page import="java.sql.*" session="false" %>
<html>
<body>

<% String s,s1;
Connection con;
PreparedStatement ps;
ResultSet rs;
s=request.getParameter("uname");
s1=request.getParameter("Password");
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con= DriverManager.getConnection("jdbc:odbc:gourav");
ps=con.prepareStatement("Select * from applicant where Username=? and Password=?");
ps.setString(1,s);
ps.setString(2,s1);
rs=ps.executeQuery();
if(rs.next())
{
HttpSession session=request.getSession();
session.setAttribute("aid",s);
response.sendRedirect("Aprofile.jsp");
}
else
{
out.println("ur username and password r incorrect");}
%>
<%@ include file="home.jsp" %>
<%
}
catch(Exception e)
{
System.out.println(e);
}
%>
</body>
</html>