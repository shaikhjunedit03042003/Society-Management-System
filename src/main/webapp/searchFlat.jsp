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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
	<script>
	$(document).ready(function(){
		$('.deleteId').click(function (){
			  if(confirm("Are you sure you want to delete this?")){
				  var id = this.id; 
					alert(id);
			     $.ajax({
			       type: 'post',
			       url: 'DeleteOwner.jsp',
			       data: {id: id,},
			       success: function(data){
					alert(data);
					location.reload(); 
			       }
			     }); 
			   }
			   else{
			      return false;
			   }
		});
			
	});
	</script>
</head>
<body>

<div id="id1">
<%

try{
	if(!request.getParameter("fno").equals(""))
	{
	 String fno=request.getParameter("fno");
	 String bname=request.getParameter("bname");
	 PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.DISPLAY_OWNER_DETAILs);
	 ps.setString(1, fno);
	 
	 ResultSet rs = ps.executeQuery();
	 while(rs.next())
	 {
		 request.setAttribute("searchFlat", rs.getString(5));
		 
	 %>
<table id="tblHistory" border=1>
<tr style="background-color:orange;color:white;font-size:25px">
	<th>Owner Id</th>
	<th>First name</th>
	<th>Last name</th>
	<th>Gender</th>
	<th>Flat No.</th>
	<th>Mobile Number</th>
	<th>Building Name</th>
	<th>No of Parking</th>
	
</tr>

	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><%=rs.getString(6) %></td>
	<td><%=rs.getString(7) %></td>
	<td><%=rs.getInt(8) %></td>
	<td><a href="update.jsp?fno=<%=fno %>"><button style="color:slateblue">Edit</button></a></td>
	<td><input type="button" style="color:red" id="<%=rs.getInt(1)%>" class="deleteId" value="Delete"></td>
	</tr>
	
<%}	
}
}
catch(SQLException e)
{
	System.out.println("Owner Details:"+e.getMessage());
}

%>
<h2><%
if(request.getAttribute("searchFlat")==null)
{
out.print("FLAT NUMBER NOT FOUND");
%></h2><%}%>
</table>
</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />