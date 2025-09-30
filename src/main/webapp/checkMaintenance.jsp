<%@page import="java.sql.*"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String flatno = request.getParameter("flatno");
String ownername = request.getParameter("ownername");

try {
	PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.OBF_DETAILS);
	ps.setString(1, ownername);
	ps.setString(2, flatno);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
	if (rs.getString(5).equals(flatno) && (rs.getString(2)).equals(ownername)) {
	out.print("Success");
	System.out.println("Success in Check maintenance!!!");
		}
	}
		else{
	out.print("Failed");
		}
} catch (SQLException e) {
	// TODO: handle exception
	System.out.println("Error occur in Maintenance method: " + e.getMessage());
}
%>
