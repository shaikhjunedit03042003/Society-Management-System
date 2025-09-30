<%@page import="com.society.utils.UtilQueries"%>
<%@page import="com.society.utils.DBConnections"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int id=Integer.parseInt(request.getParameter("id"));
try
{
PreparedStatement st=DBConnections.getConnection().prepareStatement(UtilQueries.DELETE_OWNER);
st.setInt(1, id);
int i=st.executeUpdate();
if(i>0)
{
out.println("Data Deleted Successfully!");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
