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
<title>Insert title here</title>
<style>
#idpayment
{
background-image:url("menu1.jpeg");
  background-repeat: no-repeat;
  background-size: cover;
  height:650px;
  margin-top:-20px;
  position: static;
}

#tblHistory{
	margin-top:10px;
	width: 1056px;
}
</style>

</head>
<body>


<div id="idpayment">
<form>
 
<table id="tblHistory" border=1>
<tr style="background-color:orange;color:white;font-size:25px">
	<th>Owner Id</th>
	<th>Owner name</th>
	<th>Owner Mobile</th>
	<th>Flat Number</th>
	<th>Pending Amount</th>
	<th>Modified Date</th>
</tr>
<%
try{
	 PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.DISPLAY_PAY_HISTORY);
	 ResultSet rs = ps.executeQuery();
	 while(rs.next())
	 {%>
	<tr><td><%=rs.getInt(1)%></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getInt(5) %></td>
	<td><%=rs.getString(6) %></td>
	</tr>
	
<%}
}
catch(SQLException e)
{
	System.out.println("Payment History Details:"+e.getMessage());
}
%>
</table>
</form>
</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />