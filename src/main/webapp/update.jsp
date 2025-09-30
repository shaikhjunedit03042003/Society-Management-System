<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flat</title>
<style>
#idupdate
{
background-image:url("menu1.jpeg");
  background-repeat: no-repeat;
  background-size: cover;
  height:650px;
  margin-top:-20px;
}

.tblupdate
{
margin-top: :100px;
}

</style>

</head>
<body>
<br>
<div id="idupdate">
<form action="updateowner" method="post">
<table id="tblupdate" border=1 style="margin-left: 500px;">
<%
try{
	 String fno=request.getParameter("fno");
	 PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.DISPLAY_OWNER_DETAILs);
	 ps.setString(1, fno);
	 ResultSet rs = ps.executeQuery();
	 while(rs.next())
	 {%>
	<tr class="firsttr">
	<th>Owner Id</th><td><input type="text" readonly="readonly" name="oid" value="<%=rs.getInt(1) %>"></td>
	</tr>
	<tr><th>First name</th><td><input type="text" name="fname" value="<%=rs.getString(2) %>"></td></tr>
	<tr><th>Last name</th><td><input type="text" name="lname" value="<%=rs.getString(3) %>"></td></tr>
	<tr><th>Gender</th><td><input type="text" name="gender" value="<%=rs.getString(4) %>"></td></tr>
	<tr><th>Flat No.</th><td><input type="text" readonly name="fno" value="<%=rs.getString(5) %>"></td></tr>
	<tr><th>Mobile Number</th><td><input type="text" name="Contact_No" value="<%=rs.getString(6) %>"></td></tr>
	<tr><th>Building Name</th><td><input type="text" readonly name="Building_name" value="<%=rs.getString(7) %>"></td></tr>
	<tr><th>No of Parking</th><td><input type="text" name="Parking_No" value="<%=rs.getInt(8) %>"></td></tr>
	<tr>
	<td colspan="2"><input type="submit" name="update" value="Update" style="color:slateblue;width:100%"></td>
	</tr>
	
<%}
}
catch(SQLException e)
{
	System.out.println("Owner Details:"+e.getMessage());
}
%>
</table>
</div>
</body>
</html>
