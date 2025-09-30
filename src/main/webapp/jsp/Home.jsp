<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>

<style>
#id1
{
height:100%;
background-image:url("Font2.jpg");
background-repeat:no-repeat;
background-size:auto;
background-size:150px ;
background-size:cover;
width: 100vw;
height: 100vh;
}
.id2{
position:absolute;
top:20px;
left:29%;
font-size:50px;
color:purple;
}

.menu
{
margin-right:150px;
width:300px;
height:200px;
background-color:pink;
padding-top:50px;


}

</style>
</head>
<body>
<h1></h1>
<div id="id1">
<div class="id2">

   Society Management System
 </div>
 <br><br>
 <div class ="menu">
 <left-side>
 <a href="Building.html"> <input type="submit" value="Building Information" style="background-color:slateblue;border-radius:60px;font-size:80pxwidth:190px"></a>
 <br/><br/>
 <a href="Flats.html"> <input type="submit" value=" Flats Information" style="background-color:slateblue;border-radius:60px;font-size:80pxwidth:190px"></a>
 <br/><br/>
 
  <a href="Owner.jsp"> <input type="submit" value="Owner Flats" style="background-color:slateblue;border-radius:60px;font-size:80pxwidth:190px"></a>
<br/><br/>
  <a href="Maintenace.html"> <input type="submit" value="Maintenace of  Flats" style="background-color:slateblue;border-radius:60px;font-size:80pxwidth:190px"></a>
<br/><br/>
  <a href="Ownerpyment.html"> <input type="submit" value="Owner Payment Flats" style="background-color:slateblue;border-radius:60px;font-size:80pxwidth:190px"></a>

 </div>
 
</div>

</body>
</html>