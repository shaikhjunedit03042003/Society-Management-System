<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="/jsp/header.jsp" />
<jsp:include page="/jsp/sideBar.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flat</title>
<style>
#id1
{
	height: 100%;
	background-image: url("menu1.jpeg");
	background-repeat: no-repeat;
	background-size: auto;
	background-size: 150px;
	background-size: cover;
	width: 100%;
	height: 100vh;
	margin-top:-21px;
}
#tblHistory{
	width: auto;
}

</style>

</head>
<body>

<div id="id1">
<%

try{
	if(!request.getParameter("bldname").equals(""))
	{
	 //String fno=request.getParameter("fno");
	 String bname=request.getParameter("bldname");
	 PreparedStatement ps=DBConnections.getConnection().prepareStatement("select * from building where Buld_name=?");
	 ps.setString(1, bname);
	 
	 ResultSet rs = ps.executeQuery();
	 while(rs.next())
	 {
		 request.setAttribute("searchBuilding", rs.getString(2));
		 
	 %>
<table id="tblHistory" border=1>
<tr style="background-color:orange;color:white;font-size:25px">
	<th>Building Id</th>
	<th>Building name</th>
	<th>No.Of Flats</th>
	<th>No.Of Flor</th>
	
	
</tr>

	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getInt(3) %></td>
	<td><%=rs.getInt(4) %></td>
	</tr>
	
<%}	
}
}
catch(SQLException e)
{
	System.out.println("Building Details:"+e.getMessage());
}

%>
<h2><%
if(request.getAttribute("searchBuilding")==null)
{
out.print("BUILDING  NOT FOUND");
%></h2><%}%>
</table>
</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />