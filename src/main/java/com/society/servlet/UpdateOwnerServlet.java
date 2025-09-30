package com.society.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.society.utils.DBConnections;
import com.society.utils.UtilQueries;

@WebServlet("/updateowner")
public class UpdateOwnerServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String gender = req.getParameter("gender");
		String contact = req.getParameter("Contact_No");
		int parkings =Integer.parseInt(req.getParameter("Parking_No"));
		String fno =req.getParameter("fno");
		
		
		if (updateOwner(fname,lname,gender,contact,parkings,fno).equals("Updated")) {
			System.out.println("Successfully Updated Owner");
			RequestDispatcher rd = req.getRequestDispatcher("/searchFlat.jsp");
			rd.forward(req, res);
		} else {
			
			RequestDispatcher rd = req.getRequestDispatcher("/update.jsp");
			req.setAttribute("errorMessage", "Owner Details Not updated");
			rd.include(req, res);

		}
		pw.close();

	}
	
	public String updateOwner(String fname,String lname,String gender,String contact,int parkings,String fno) {
		String response="";
		try {
			PreparedStatement stmt = DBConnections.getConnection().prepareStatement(UtilQueries.UPDATE_DETAILS);
			stmt.setString(1, fname);
			stmt.setString(2, lname);
			stmt.setString(3, gender);
			stmt.setString(4, contact);
			stmt.setInt(5, parkings);
			stmt.setString(6, fno);
			if(stmt.executeUpdate()>0)
			{
				response="Updated";
			}
			else
			{
				response="Failed";
			}
			
		}
		 catch (SQLException e) {
			// TODO: handle exception
		}
		return response;
	}
}
