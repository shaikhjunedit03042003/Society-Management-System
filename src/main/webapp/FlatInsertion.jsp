<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import="java.sql.Connection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
 String flatno= request.getParameter("flatno");
 try{
 PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.ADD_FLAT);
 System.out.println("Testing Flat: "+flatno);
 ps.setString(1,flatno);
	System.out.println("Testing Flat");
  if (ps.executeUpdate() > 0) {
   out.print("You are successfully registered");
  }
 }
 catch(SQLException e)
 {
	 System.out.println("Testing Flat:"+e.getMessage());
 }
 %>
</body>
</html>