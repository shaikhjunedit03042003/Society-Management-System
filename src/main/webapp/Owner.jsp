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
<meta charset="ISO-8859-1">
<title>Owner Detail</title>

<style>
.d {
	width: 220px;
	height: 40px; <!--
	background-color: cadetblue; -->
	padding-left: 20px;
	font-size: 20px;
	color: #FF5733;
	font-weight: bold;
}

.f {
	width: 500px;
	height: 40px; <!--
	background-color: cornflowerblue;
	-->
}

h1 {
	color: #3368FF;
}

#id1 {
	background-image: url("menu1.jpeg");
	background-repeat: no-repeat;
	background-size: cover;
	height: 650px;
	margin-top: -20px;
	position: static;
}
</style>
</head>
<body>

	<div id="id1">
		<u><h1>OWNER DETAILS</h1></u>
		<form action="searchFlat.jsp" method="post">
			<div style="margin-left: 1000px">
				<select id="fno" type="text" name="fno" required>
					<option disabled selected>FLAT NO SEARCH</option>
					<%
					try {
						String flatno = request.getParameter("fno");
						System.out.println("Flat NO: " + flatno);
						PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.Display_Flat);
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
				</select> <input type="submit" value="Search" />
			</div>
		</form>
		<div>
			<form action="ownerservlet" method="post">

				<table style="margin-top: 15px; margin-left: 99px">
					<!-- <tr>
<td class="d">USER ID</td>
<td class="f"><input style="margin-left:30px;border-radius:5px;  width:300px;height:30px"  placeholder="User Id" type="text" name="uid"></td> 		

</tr> -->
					<tr>
						<td class="d">FIRST NAME</td>
						<td class="f"><input
							style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
							placeholder="First Name" type="text" name="fname" required></td>

					</tr>

					<tr>
						<td class="d">LAST NAME</td>
						<td class="f"><input
							style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
							type="text" placeholder="Last Name" name="lname" required></td>
					</tr>

					<tr>
						<td class="d">CONTACT NO</td>
						<td class="f"><input
							style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
							type="tel" placeholder="Mobile Number" maxlength="10"
							name="contact" required></td>
					</tr>


					<tr>
						<td class="d">FLATE NO.</td>
						<td class="f"><input
							style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
							type="text" placeholder="Flat No." name="flatno" required></td>
					</tr>

					<tr>
						<td class="d">BUILDING NAME</td>
						<td class="f"><input
							style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
							type="text" placeholder="Building Name" name="bldname" required></td>
					</tr>
					<tr>
						<td class="d">PARKING NO.</td>
						<td class="f"><input
							style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
							type="text" placeholder="Parking No." name="parking" required></td>
					</tr>

					<tr>
						<td class="d">GENDER</td>
						<td class="f" style="padding-left: 30px; font-size: 20px">Male<input
							type="radio" name="gender" value="Male" /> Female<input
							type="radio" name="gender" value="Female" />
						</td>
					</tr>


				</table>

				<input type="submit" value="Submit"
					style="margin-left: 116px; margin-top: 11px; background-color: #3368FF; color: white; border-radius: 25px; width: 133px; height: 41px">
				<input type="reset" value="Cancel"
					style="background-color: tomato; margin-left: 116px; color: white; border-radius: 25px; width: 133px; height: 41px">
				<%
				String error = (String) request.getAttribute("ownermessage");
				if (error != null) {
				%><h2>
					<%=error%></h2>
				<%
				}
				%>

			</form>
		</div>
</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />