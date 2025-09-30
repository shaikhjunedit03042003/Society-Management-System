<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	<script>
$(document).ready(function(){
$("#add_details").on('submit',function(event)
{
	alert("Hiiii"+$("#flatno").val());
	$.ajax({
		  type: "post",
		  url: "FlatInsertion.jsp",
                    data:{
                    	flatno : $("#flatno").val()},
						success: function(data){  
                       alert("Testing ");
					    $("#table_data").append("<tr><td>"+$("#flatno").val()+"</td></tr>");    
                   }
                });

				
});
});
</script>

<html>
<form method="post" id="add_details">
<label>Flat No.
</label>

<input type="text"  name="flatno" id="flatno" >

<input type="submit" name="add-row" id="add-row" value="Add"> 

<table border="1 px">
<thead>
<th>Flat No.</th>
</thead>
<tbody id="table_data">

</tbody>
</table>
</form>
</html>