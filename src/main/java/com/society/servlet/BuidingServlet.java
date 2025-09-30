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

@WebServlet("/buildingservlet")
public class BuidingServlet extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		String buildingName = req.getParameter("buildingName");
		int no_of_flat = Integer.parseInt(req.getParameter("no_of_flat"));
		int no_of_floor =Integer.parseInt(req.getParameter("no_of_floor"));
		
		if(addBuilding(buildingName, no_of_flat, no_of_floor)==1)
		{
			System.out.println("Successfully Added Building and Flats");
			req.setAttribute("errorMessage", "Successfully Added Building");
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/menu.jsp");
			rd.forward(req, res);
		}
		else {
			req.setAttribute("buildError", "Building already exist!!!");
			RequestDispatcher rd = req.getRequestDispatcher("Building.jsp");
			rd.forward(req, res);
		}
		
	}
	
	public int addBuilding(String buildName,int no_of_flat,int no_of_floor)
	{
		try
		{
			if (buildingExist(buildName) != 1) {

			PreparedStatement ps=DBConnections.getConnection().prepareStatement(UtilQueries.ADD_BUILDING);
			ps.setString(1, buildName);
			ps.setInt(2, no_of_flat);
			ps.setInt(3, no_of_floor);
			if(ps.executeUpdate()>0)
			{
				return 1;
			}
			}
		}
		catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error in Buiding : "+e.getMessage());
		}
		return 0;
	}
	
	
	public int buildingExist(String bname) {

		try {
			PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.BUILDING_DETAILS);
			ps.setString(1, bname);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
			while (rs.next()) {
				if (rs.getString(2).equals(bname)) {
					return 1;
				}
			}
			}
			else
			{
				return 0;
			}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error occur in Building Exit method: " + e.getMessage());
		}
		return 0;

	}
	
}
