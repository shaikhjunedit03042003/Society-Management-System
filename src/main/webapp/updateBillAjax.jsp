<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.society.utils.DBConnections"%>
<%@page import="com.society.utils.UtilQueries"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


 <%
 int payamount=Integer.parseInt(request.getParameter("payamount"));
 int mainId=(Integer)session.getAttribute("mainId");
 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	LocalDate currentDate = LocalDate.now();
 String DISPLAY_AMOUNT="select total_amount from maintenance where maitainence_ID='"+mainId+"'";
 String UPDATE_MAINTENANCE="update Maintenance set total_amount=total_amount - '"+payamount+"',monthly_date='"+currentDate+"' where maitainence_ID='"+mainId+"'";
 int tempamount=0;
 
 try{
	 Statement ps1=DBConnections.getConnection().createStatement();
	 ResultSet rs=ps1.executeQuery(DISPLAY_AMOUNT);
	 if(rs.next())
	 {
		tempamount=rs.getInt("total_amount");
	 }
	 System.out.println("Total Amount2: "+tempamount);
	 Statement ps=DBConnections.getConnection().createStatement();
	if(tempamount>=payamount){	
		 System.out.println("Total Amount2 Success: "+tempamount);
  if (ps.executeUpdate(UPDATE_MAINTENANCE) > 0) {
   out.print("You are successfully updated");
  }
	}
	else
	{
		 out.print("Please check the pay amount it should be less than pending amount");	
	}
 }
 catch(SQLException e)
 {
	 System.out.println("Testing Flat:"+e.getMessage());
 }
 %>
