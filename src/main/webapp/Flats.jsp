<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.flatinfo {
	position: absolute;
	top: 340px;
	left: 20%;
	font-size: 40px;
	color: RED;
}
</style>
</head>
<body>
			<div class="flatinfo">FLATS INFORMATION</div>
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
					<td><input type="text" style="width:100%" id="flatno" name="flatno" required="required"></td>
					<td><select  style="width:100%" id="bname" name="buildingName">
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

</body>
</html>