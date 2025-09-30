<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<style type="text/css" media="screen">
#header {
	background: #33FFA5;
	color: slateblue;
	padding: 20px;
	text-align: center;
	height: 71px;
}
</style>
</head>
<body>

	<div id="header">
		<table>
			<tr>
				<td><img src="logo.jpg" style="width: 200px; height: 81px"></td>
				<td><center>
						<marquee direction=left>
						<h1>SOCIETY MANAGEMENT SYSTEM</H1>
						</marquee>
					</center></td>
				<td><br>
					<form action="logoutservlet" method="get">
						<input
							style="background-color: slateblue; color: white; margin-left: 900px; margin-top: -40px; width: 100px; font-size: 14px; font-weight: bold;"
							type="submit" name="logout" value="Logout" />
					</form>



					


					 <br>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>
