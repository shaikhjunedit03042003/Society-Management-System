<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="/jsp/header.jsp" />
<jsp:include page="/jsp/sideBar.jsp" />
    
<!DOCTYPE html>
<html>
<head>
<style>
#id1 {
	height: 100%;
	background-image: url("menu1.jpeg");
	background-repeat: no-repeat;
	background-size: auto;
	background-size: 150px;
	background-size: cover;
	width: 100%;
	height: 100vh;
	margin-top: -21px;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="id1">
<form action="OwnerPayHistory.jsp" method="get">
<div style="margin-left:700px"> 
<input type="date" placeholder="Start Date" name="startD" style="margin-left: -200px;"required="required"/><input type="date" placeholder="End Date" name="dateE" required="required"/>

<select id="fno" type="text" name="fno" required>
								<option disabled selected>FLAT NO SEARCH</option>
								<%
								try {
									String flatno = request.getParameter("fno");
									System.out.println("Flat NO: " + flatno);
									PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.FLAT_DETAILS);
									ResultSet rs = ps.executeQuery();
									while (rs.next()) {
								%>
								<option>
									<%=rs.getString(1)%>
								</option>
								<%
								}
								} catch (SQLException e) {
								e.printStackTrace();
								}
								%>
							</select>


<input type="submit" value="Search"/>
</div>
</form>
</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />