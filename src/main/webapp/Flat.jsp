<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="/jsp/header.jsp" />
<jsp:include page="/jsp/sideBar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flats Information</title>
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
	margin-top:-21px;
}

.id2 {
	position: absolute;
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
	width: 500px;
	height: 40px;
	background-color: cornflowerblue;
}
</style>
</head>
<body>
	<h1></h1>
	<form action="flatservlet" method="post">
		<div id="id1">
			<div class="id2">FLATS INFORMATION</div>
			<br>
			<br>
			<table border="2px" width="955px"
				style="margin-top: 40px; margin-left: 50px">

				<tr style="background-color: orange; color: white">
					<th>Owner Name</th>
					<th>Owner ID</th>
					<th>Mobile</th>
					<th>Flat No</th>
					<th>Building Name</th>
					<th>Flat Type</th>
					<th>Parking NO.</th>
					<th>No.of Galary</th>
					<th>Flat_Floor</th>

				</tr>
				<tr>
					<td><input type="text" style="width:100%" id="Ownername"
						name="Ownername"></td>
					<td><input type="text" style="width:100%" id="Ownerid" name="Ownerid"></td>
					<td><input type="text" style="width:100%" id="mobile" name="mobile"></td>
					<td><input type="text" style="width:100%" id="flatno" name="flatno"></td>
					<td><select  style="width:100%" id="bname" name="bname">
							<option></option>
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
							<option>L</option>
					</select></td>
					
					<td><select  style="width:100%" id="flattype" name="flattype">
							<option></option>
							<option>1BHK</option>
							<option>2BHK</option>
							<option>3BHK</option>
							<option>1RK</option>
					</select></td>

					<td><input type="text" style="width:100%" id="parkingno"
						name="parkingno"></td>
					<td><input type="text" style="width:100%" id="no_of_galary"
						name="no_of_galary"></td>
					<td><input type="text" style="width:100%" id="flat_floor"
						name="flat_floor"></td>


				</tr>
			</table>


			<input type="submit" value="Submit"
				style="margin-left: 400px; margin-top: 33px; background-color: red; border-radius: 25px; font-size: 30px; width: 120px; height: 41px">

			<a href="Home.html"><input type="reset" value="Cancel"
				style="background-color: green; border-radius: 25px; font-size: 30px; width: 120px; height: 41px">
				</a>
				<h2><% String error=(String)request.getAttribute("flatError");
				if(error!=null){
					out.print(error);
				}
				 %></h2>
				</div>
				
	</form>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />
