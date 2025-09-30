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
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body {font-family: Arial, Helvetica, sans-serif;}

#id1
{
height: 700px;
background-image:url("menu1.jpeg");
background-repeat:no-repeat;
background-size:auto;
background-size:220px ;
background-size: cover;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 40%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

#myBtn
{
width:111px;
height:31px;
background-color:slateblue;
color:white;
}

#submitbtn
{
width:111px;
height:31px;
background-color:slateblue;
color:white;

}


#btnSearch{
	background-color:lightblue;
	width:151px;
	height:30px;	
}

#tblPayment{
	width:600px;
	height:300px;
	padding-left:0px;
	background-color:pink;
}
</style>
</head>

<body>
<form  method="post" id="myForm">
<div id="id1">
<table>
<tr>
<td>
	<select style="margin-left:100px;border-radius:5px;  width:300px;height:30px"  id="bldname"  type="text" name="bldname" required onchange="test()">
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
		
	</select>
</td>
<td>
<!-- <input type="hidden" id="bname" name="bname" value=""> -->
<select style="margin-left:100px;border-radius:5px;  width:300px;height:30px"  id="flatno"  name="flatno" required>
<option disabled selected>Select Flat
<%try{
	String bname=request.getParameter("bname");
	System.out.println("Building Name: "+bname);
	PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.FLAT_DETAILS);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
	%>
	<option> <%=rs.getString(1)%> </option>
	<%
	}
	}
catch(SQLException e)
{
e.printStackTrace();	
}
%>
</option>
</select>

		
</td>
<td>
<input type="submit" id="btnSearch" value="Search">
</td>
</table>

<%
String flatno= request.getParameter("flatno");
String buildName= request.getParameter("bldname");

try{
PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.DISPLAY_DETAILS);
ps.setString(1,flatno);
ps.setString(2,buildName);
ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
  %>
<table  id='tblPayment' border=1 style=''><tr>
<td><label>Owner Id:</label></td>
<td><%=rs.getString("owner_id") %></td>
</tr>
<tr><td><label>Owner Name:</label></td>
<td><%=rs.getString("fname") %></td>
</tr>
<tr><td><label>Mobile Number:</label></td>
<td><%=rs.getString("Contact_No") %></td>
</tr>
<tr><td><label>Building:</label></td>
<td><%=rs.getString("Building_name") %></td>
</tr>
<tr><td><label>Flat Number:</label></td>

<td><%=rs.getString("Flat_No") %></td>
</tr>
<tr><td><label>Pending Amount:</label></td>
<td><%=rs.getInt("total_amount") %></td>
</tr>
<%
session.setAttribute("mainId", rs.getInt("maitainence_ID"));
session.setAttribute("totalamount", rs.getInt("total_amount"));
%>

<tr>
<td colspan="2">
<input type="button" value="Pay" style="margin-left:166px" id="myBtn">
</td>
</tr>
</table>
<%}
}
catch(SQLException e)
{
	 System.out.println("Testing Details In Pay:"+e.getMessage());
}

%>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
      <form class="form-container">
    <h1>Owner Payment</h1>
	<table>
		<tr>
			<td>
				<label><b>Total pending Amount:: &nbsp;&nbsp;&nbsp; <%=session.getAttribute("totalamount")%>   </b></label>
			</td>
			
		</tr>

	   <tr>
			<td>
				<label><b>Amount Pay</b></label>
			</td>
			<td>
				<input type="number" placeholder="Amount Pay" name="payamount" id="payamount" style="margin-left: -45px">
			</td>
		</tr>
	
		<tr>
			<td colspan=2>
				<a href='ownerPayments.jsp'><input type="button"  onclick="ajaxCall()" value="Submit" name="submitbtn" id="submitbtn" ></a>
			</td>
		</tr>
		
		

	</table>
  </form>
  </div>

</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script>
function openForm() {
alert("Data Successfully Updated");
}

function test()
{
var buildname=$("#bldname").val();
alert(buildname);
$("#bname").val(buildname);
}

// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal

$("#myBtn").click(function()
		{
	$('#myModal').modal('show');
		});
		
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

	function ajaxCall()
	{
				var payamount = $("#payamount").val();
				var mainId = <%=session.getAttribute("mainId")%>;
		$.ajax({
			type: "post",
			  url: "updateBillAjax.jsp",
						data:{
							mainId:mainId,
							payamount:payamount,
							},
					   success:function(output){
						   alert(output.trim());
							$("#myModal").css("display", "none");
							$("#bldSel").val(<%=request.getParameter("bldname")%>);
							$("#myForm").submit(); 
							//alert('<?=$bldname ?>');
							<%=session.getAttribute("mainId")%>; 
							// modal.style.display = "block";
					   }
					});
	}

</script>
</div>
</form>
</body>

</html>
