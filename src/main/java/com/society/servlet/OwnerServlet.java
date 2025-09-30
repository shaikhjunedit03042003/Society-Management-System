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
import javax.servlet.http.HttpSession;

import com.society.bean.Owner;
import com.society.utils.DBConnections;
import com.society.utils.UtilQueries;

@WebServlet("/ownerservlet")
public class OwnerServlet extends HttpServlet {
	
	int bid=0;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String contact = req.getParameter("contact");
		String flatno = req.getParameter("flatno");
		String bldname = req.getParameter("bldname");
		int parking = Integer.parseInt(req.getParameter("parking"));
		String gender = req.getParameter("gender");

		Owner owner = new Owner();
		owner.setFname(fname);
		owner.setLname(lname);
		owner.setGender(gender);
		owner.setParking_no(parking);
		owner.setBuilding_name(bldname);
		owner.setContact_no(contact);
		owner.setFlat_no(flatno);
		System.out.println(toString());

		if (addOwner(owner).equals("success")) {
			req.setAttribute("errorMessage", "Owner Added Successfully!!!!");
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/menu.jsp");
			rd.forward(req, res);

		} else {
			pw.print("Please login first");
			req.setAttribute("ownermessage", "Flat OR Building is already exist / Something went Wrong in Owner Details");
			req.getRequestDispatcher("Owner.jsp").include(req, res);
		}

	}

	public String addOwner(Owner owner) {
		String response = "";
		try {
			if (buildingExist(owner.getBuilding_name()).equals("success")) {
				System.out.println("Buiding Exist: " + owner.getBuilding_name());
				PreparedStatement stmt = DBConnections.getConnection().prepareStatement(UtilQueries.ADD_OWNER_DETAILS);
				stmt.setString(1, owner.getFname());
				stmt.setString(2, owner.getLname());
				stmt.setString(3, owner.getGender());
				stmt.setString(4, owner.getFlat_no());
				stmt.setString(5, owner.getContact_no());
				stmt.setString(6, owner.getBuilding_name());
				stmt.setInt(7, owner.getParking_no());
				stmt.setInt(8, bid);
				stmt.execute();
				response = "success";
			}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error in Owner Details" + e.getMessage());
			e.printStackTrace();
			response = "fail";
		}
		return response;
	}

	public String buildingExist(String bname) {
		String response = "";
		try {
			PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.BUILDING_DETAILS);
			ps.setString(1, bname);
			ResultSet rs = ps.executeQuery();
		
				while (rs.next()) {
					if (rs.getString("Buld_name").equals(bname)) {
						bid=rs.getInt("bid");
						response = "success";
					}
				}
			
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error occur in Building Exit method: " + e.getMessage());
		}
		return response;
	}
}
