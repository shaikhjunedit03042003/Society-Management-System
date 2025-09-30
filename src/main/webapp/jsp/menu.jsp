<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="/jsp/header.jsp" />
<jsp:include page="/jsp/sideBar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>

<style>

#menuId
{
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
</style>
</head>
<body>
<div id="menuId">
<h2><% String error=(String)request.getAttribute("errorMessage");
				if(error!=null){
					out.print(error);
				}
				 %></h2>
</div>
</body>
</html>
<jsp:include page="/jsp/footer.jsp" />

