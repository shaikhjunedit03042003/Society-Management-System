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
<title>Owner Details</title>
<style>
#id1
{
height: 700px;
background-image:url("menu1.jpeg");
background-repeat:no-repeat;
background-size:auto;
background-size:220px ;
background-size: cover;
}

.id2{
position:center;
top:20px;
left:20%;
font-size:40px;
color:green;
}
.d{
width:200px;
height:40px;
background-color:cadetblue;
padding-left:20px;
color:blue;
font-weight:bold;
}
.f{
width:500px;
height:40px;
background-color:cornflowerblue;

}
caption
{
font-size:33px;
color:#FF5733;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
</script>
	<script>
	$(document).ready(function(){
		
		$("#any_other_charge").on('change', function(){
			 const fixedcharge=parseInt($("#fixedcharge").val());
			 const servicemain=parseInt($("#servicemain").val());
			 const ClubHouseCharge=parseInt($("#ClubHouseCharge").val());
			 const Fine=parseInt($("#Fine").val());
			 const any_other_charge=parseInt($("#any_other_charge").val());
			 console.log(fixedcharge + servicemain);
			 const totalamount = fixedcharge + servicemain + ClubHouseCharge + Fine + any_other_charge;
			 alert(totalamount);
			 $("#totalamount").val(totalamount);
		});
		
	});
	
	function checkFlatOwner(){
			  var flatno = $("#flatno").val();
			  var ownername = $("#ownername").val();
		     $.ajax({
		       type: 'post',
		       url: 'checkMaintenance.jsp',
		       data: {flatno: flatno,
		    	   ownername:ownername,},
		       	   success: function(output){
					if(output.trim()==='Success')
		    	   {	
						alert("Go Ahead!!!");
		    	   }
					else
						{
						alert("Flat Number and Owner details not matched!!!!");
						$("#flatno").val("");
						$("#ownername").val("");
						}
		       }
		     }); 
		   }
		
	</script>
</head>
<body>
<form action="maintenanceservlet" method="post">
<div id="id1">
<table id="table1" border="1px" width="955px">
<caption>Maintenance Management</caption>
<tr style="background-color:#FFC300;">
<th>Flat No.</th>
<th>Owner Name</th>
<th>Monthly Date</th>
<th>Fixed Maintenance</th>
<th>Service Maintenance</th>
<th>Hall/Club House Charge</th>
<th>Fine</th>
<th>Any Other Charge</th>
<th>Total Amount</th>
</tr>
<tr>
<td>

<select id="flatno" type="text" name="flatno" required>
								<option disabled selected>SEARCH FLATS</option>
								<%
								try {
									String flatno = request.getParameter("flatno");
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
							</select>

</td>
<td><input type="text" style="width:100%" name="ownername" id="ownername" placeholder="Please Enter First Name" required></td>
<td><input type="date" style="width:100%" name="datemonthly" id="datemonthly" onchange="checkFlatOwner();" required></td>
<td><input type="number" style="width:100%" name="fixedcharge" id="fixedcharge" required></td>
<td><input type="number" style="width:100%" name="servicemain" id="servicemain" required></td>
<td><input type="number" style="width:100%" name="ClubHouseCharge" id="ClubHouseCharge" required></td>
<td><input type="number" style="width:100%" name="Fine" id="Fine"></td>
<td><input type="number" style="width:100%" name="any_other_charge" id="any_other_charge" required></td>
<td><input type="number" style="width:100%" name="totalamount" id="totalamount" required></td>
</tr>
</table>
 
 <input type="submit" value="Submit"
 style="margin-left:576px;margin-top:33px;background-color:red;border-radius:25px;
 font-size:30px;width:120px;height:41px">
 <a href="Maintenace.html"> <input type="reset" value="Cancel"
 style="background-color:green;border-radius:25px;
 font-size:30px;width:120px;height:41px"></a>
 
 	<h2><% String error=(String)request.getAttribute("mainError");
				if(error!=null){
					out.print(error);
				}
				 %></h2>
</div>
</form>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />