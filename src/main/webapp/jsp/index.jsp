<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Society Management System</title>
<style>
#id1 {
	height: 100%;
	background-image: url("Font2.jpg");
	background-repeat: no-repeat;
	background-size: auto;
	background-size: 150px;
	background-size: cover;
	width: 100vw;
	height: 100vh;
}
h1   {color: blue;}
.id2 {
	position: absolute;
	top: 20px;
	left: 29%;
	font-size: 50px;
	color: purple;
}

.login {
	margin-left: 200px;
	width: 600px;
	height: 400px;
	background-color: orange;
	padding-top: 100px;
	position: absolute;
	top: 55%;
	left: 25%;
	transform: translate(-25%, -50%);
}

#username {
	width: 200px;
	height: 40px;
	border-radius: 15px;
	margin-left: 60px;
}

#password {
	width: 200px;
	height: 40px;
	border-radius: 15px;
	margin-left: 60px;
}

label {
	font-size: 30px;
}
</style>
</head>
<body>
	<form action="loginservlet" method="post">
		<div id="id1">
			<div class="id2">Society Management System</div>

			<br>
			<br>

			<div class="login">
				<center>
					<h2 style="font-size: 50px; color: purplr">Admin Login</h2>
					<label for="username">Username</label> <input type="text"
						name="username" id="username" required> </br>
					</br> <label for="password">Password</label> <input type="password"
						name="password" id="password" required> </br><br>
						<input type="submit" value="Login"
						style="background-color: slateblue; border-radius: 25px; font-size: 30px; width: 120px">
					
					<input type="reset" value="Reset"
						style="margin-left: 50px; border-radius: 25px; background-color: tomato; font-size:30px;width:120px">
						<%
						String errorMessage=(String)request.getAttribute("errorMessage");
						if(errorMessage!=null){
						%>
						<h1><%=errorMessage %></h1>
						<%}%>
					</br> 
				</center>
			</div>
		</div>


	</form>
</body>
</html>