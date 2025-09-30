<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <title></title>
  <style type="text/css" media="screen">
  
  #sidebar {
    float: left;
    width: 15%;
	height:700px;
    background: #33FF86;
    }
  
  

#button{
width:150px;
height:40px;
margin-top:20px;
border-radius:20px;
background-color:dodgerblue;
}

.pass:hover
{
background-color:purple;
color:white;

}

  </style>
</head>
<body>

<div id="sidebar">
<p><marquee direction=left> <h1 style="color:slateblue"> SOCIETY MODULE</h1></marquee></p>
<a href="Building.jsp"><button id="button" class="pass"> Building </button></a>
<!--  <a href="Flat.jsp"><button id="button" class="pass"> Flats </button></a>-->
<a href="Owner.jsp"><button id="button" class="pass">Add Owners</button></a>
<a href="maintenance.jsp"><button id="button" class="pass">Maintanance Management</button></a>
<a href="ownerPayments.jsp"><button id="button" class="pass">Owner Payment</button></a>
<a href="paymentHistory.jsp"><button id="button" class="pass">Payment History</button></a>
<a href="Demo.jsp"><button id="button" class="pass">Search</button></a>
</div>
</body>
</html>