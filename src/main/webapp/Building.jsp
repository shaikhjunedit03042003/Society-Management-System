<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="/jsp/header.jsp" />
<jsp:include page="/jsp/sideBar.jsp" />
<html>
<head>
<title>Building Information</title>
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

.id2 {
	position: absolute;
	top: 130px;
	left: 20%;
	font-size: 40px;
	color: RED;
}

.d {
	width: 2320px;
	height: 40px;
	background-color: cadetblue;
	padding-left: 20px;
	color: #FF5733;
	font-weight: bold;
}

.f {
	width: 700px;
	height: 40px;
	background-color: cornflowerblue;
}
</style>
</head>
<body>
	<h1></h1>

	
		<div id="id1">
			<div class="id2">
				BUILDING INFORMATION
				
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="searchBuilding.jsp" method="post">
						<div style="margin-left: 1000px">
							<select id="bldname" type="text" name="bldname" required>
								<option disabled selected>BUILDING NAME</option>
								<%
								try {
									String bname = request.getParameter("bname");
									System.out.println("Building Name: " + bname);
									PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.Display_Building);
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
					<form action="buildingservlet" method="post">
			<table style="margin-top: 31px; margin-left: 10px">
				<br>
				<br>
				<tr>
				<br>
				<br>
				<tr>
				
					<td class="d">BUILDING NAME</td>
					<td class="f"><select
						style="margin-left: 30px; border-radius: 5px; width: 300px; heigh: 30px"
						type="text" name="buildingName" required>
							<option disabled selected>BUILDING NAME</option>
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							<option>E</option>
							<option>F</option>
							<option>G</option>
							<option>H</option>
							<option>I</option>
							<option>J</option>
							<option>K</option>
							<option>L</option>
							<option>M</option>
							<option>N</option>
							<option>O</option>
							<option>P</option>
							<option>Q</option>
							<option>R</option>
							<option>S</option>
							<option>T</option>
							<option>U</option>
							<option>W</option>
							<option>X</option>
							<option>Y</option>
							<option>Z</option>
					</select></td>
				</tr>
				<tr>
					<td class="d">NO.OF FLATS</td>
					<td class="f"><input
						style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
						type="number" placeholder="NO OF FLATS" name="no_of_flat" required></td>
				</tr>

				<tr>
					<td class="d">NO.OF FLOORS</td>
					<td class="f"><input
						style="margin-left: 30px; border-radius: 5px; width: 300px; height: 30px"
						type="number" placeholder="NO OF FLOORS" name="no_of_floor"
						required></td>
				</tr>
			</table>
			<!--<jsp:include page="Flats.jsp"/>-->
			<input type="submit" value="Submit"
				style="margin-left: 576px; margin-top: 33px; background-color: red; border-radius: 25px; font-size: 30px; width: 120px; height: 41px">

			<a href="Home.html"><input type="reset" value="Cancel"
				style="background-color: green; border-radius: 25px; font-size: 30px; width: 120px; height: 41px"></a>
			<h2>
				<%
				String error = (String) request.getAttribute("buildError");
				if (error != null) {
					out.print(error);
				}
				%>
			</h2>

		</div>

	</form>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />