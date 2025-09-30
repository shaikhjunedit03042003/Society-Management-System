package com.society.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.society.utils.DBConnections;
import com.society.utils.UtilQueries;

@WebServlet("/flatservlet")
public class FlatServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");
		
		//Flat Information
		String buildingName = req.getParameter("bname");
		String flat_no =req.getParameter("flatno");
		String flat_Type = req.getParameter("flattype");
		String parking_Type = req.getParameter("parkingno");
		String flat_Owner =req.getParameter("Ownername");
		int flat_Floor =Integer.parseInt(req.getParameter("flat_floor"));
		int no_Of_Gallery =Integer.parseInt(req.getParameter("no_of_galary"));
		
		if(addFlat(flat_no, buildingName, flat_Type, parking_Type, flat_Owner, no_Of_Gallery, flat_Floor)==1)
		{
			req.setAttribute("errorMessage", "Flat Added Successfully!!!!");
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/menu.jsp");
			rd.forward(req, res);
		}
		else
		{
			req.setAttribute("flatError", "This Flat Number already exist in "+buildingName+" Building");
			RequestDispatcher rd = req.getRequestDispatcher("Flat.jsp");
			rd.forward(req, res);
		}
	}
	
	public int addFlat(String flatno,String buildName,String Flat_Type,String parking_Type,String Flat_Owner,int No_Of_Gallery,int Flat_Floor)
	{
		try
		{
			if(flatExist(buildName,flatno)!=1) {
			PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.ADD_FLAT);
			ps.setString(1, buildName);
			ps.setString(2, Flat_Type);
			ps.setString(3, parking_Type);
			ps.setString(4, Flat_Owner);
			ps.setInt(5, No_Of_Gallery);
			ps.setInt(6, Flat_Floor);
			ps.setString(7, flatno);
			
			if(ps.executeUpdate()>0)
			{
				return 1;
			}
		}
		}
		catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error in Buiding In Flat: "+e.getMessage());
		}
		return 0;
	}
	
	public int flatExist(String buildName,String fno)
	{
	
		try{
		PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.FLAT_EXIST);
		ps.setString(1,buildName);
		ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			if((rs.getString(2)).equals(buildName)&& rs.getString(1).equals(fno))
			{
				return 1;
			}
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error occur in Flat Exit method: "+e.getMessage());
		}
		return 0;
		
	}
	
}
