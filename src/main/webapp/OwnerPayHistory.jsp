<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="/jsp/header.jsp" />
<jsp:include page="/jsp/sideBar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Maintenance Search</title>


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

#tblHistory {
	width: auto;
}
</style>

</head>
<body>

	<div id="id1">

		<table id="tblHistory" border=1>
			<tr style="background-color: orange; color: white; font-size: 25px">
				<th>Owner name</th>
				<th>Owner Mobile</th>
				<th>Flat Number</th>
				<th>Fixed Maintenace</th>
				<th>Service Maintenace</th>
				<th>Club House</th>
				<th>Fine</th>
				<th>Any Other</th>
				<th>Pending Amount</th>
				<th>Modified Date</th>
			</tr>
			<%
			String startD = request.getParameter("startD");
			String endE = request.getParameter("dateE");
			String fno = request.getParameter("fno");
			
			String DISPLAY_OWNER_PAY_HISTORY= "select fname,Contact_No,Flat_No,fixed_m,service_m,club_house,fine,any_other,total_amount,monthly_date from Maintenance m inner join owners o on o.Flat_No=m.fno where fno='"+fno+"' and monthly_date between '"+startD+"' and '"+endE+"'";
			try {
				if(!request.getParameter("fno").equals(""))
				{
				
				Statement ps = DBConnections.getConnection().createStatement();
				
				ResultSet rs = ps.executeQuery(DISPLAY_OWNER_PAY_HISTORY);
				System.out.println("maintenance Details:" + DISPLAY_OWNER_PAY_HISTORY);
				while (rs.next()) {
					System.out.println("maintenance Details:");
					request.setAttribute("searchFlat", rs.getString(3));
			%>

			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getInt(4)%></td>
			<td><%=rs.getInt(5)%></td>
			<td><%=rs.getInt(6)%></td>
			<td><%=rs.getInt(7)%></td>
			<td><%=rs.getInt(8)%></td>
			<td><%=rs.getInt(9)%></td>
			<td><%=rs.getString(10)%></td>
			</tr>

			<%
			}
			}
			} catch (SQLException e) {
			System.out.println("maintenance Details:" + e.getMessage());
			}
			%>
			<h2>
				<%
				if (request.getAttribute("searchFlat") == null) {
					out.print("FLAT NUMBER NOT FOUND IN MAINTENANCE OR  IN-VALIDE DATE SELECT");
				%>
			</h2>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />