package com.society.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.society.utils.DBConnections;
import com.society.utils.UtilQueries;

@WebServlet("/maintenanceservlet")
public class MaintenanceServlet extends HttpServlet {
	
	int fixed_m=0;
	int service_m=0;
	int club_house=0;
	int fine=0;
	int any_other=0;
	int tempTotal=0;
	LocalDate tempdate;
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		// Maintenance Information
		String ownername = req.getParameter("ownername");
		String flatno =req.getParameter("flatno");
		String datemonthly = req.getParameter("datemonthly");
		int fixedcharge = Integer.parseInt(req.getParameter("fixedcharge"));
		int servicemain = Integer.parseInt(req.getParameter("servicemain"));
		int clubHouseCharge = Integer.parseInt(req.getParameter("ClubHouseCharge"));
		int fine = Integer.parseInt(req.getParameter("Fine"));
		int any_other_charge = Integer.parseInt(req.getParameter("any_other_charge"));
		int totalamount = Integer.parseInt(req.getParameter("totalamount"));

		if (addMaintenance(flatno, ownername, datemonthly, fixedcharge, servicemain, clubHouseCharge, fine,
				any_other_charge, totalamount) == 1) {
			req.setAttribute("errorMessage",
					"Maintenance Added Successfully For Flat No." + flatno + " Name: " + ownername + "!!!!");
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/menu.jsp");
			rd.forward(req, res);
		} else {
			req.setAttribute("mainError", "Current Date should be greater than previous Date!");
			RequestDispatcher rd = req.getRequestDispatcher("maintenance.jsp");
			rd.forward(req, res);
		}

	}

	public int addMaintenance(String flatno, String ownerName, String monthlydate, int fixedcharge, int servicemain,
			int ClubHouseCharge, int Fine, int any_other_charge, int totalamount) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate currentDate = LocalDate.parse(monthlydate,dtf);
		
		String update_main = "update maintenance set total_amount=total_amount+'" + totalamount + "',monthly_date='"+currentDate+"' where ownername='"
				+ ownerName + "' and fno='" + flatno + "'";
		try {

			PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.ADD_MAINTENANCE);
			ps.setString(1, flatno);
			ps.setString(2, ownerName);
			ps.setString(3, monthlydate);
			ps.setInt(4, fixedcharge);
			ps.setInt(5, servicemain);
			ps.setInt(6, ClubHouseCharge);
			ps.setInt(7, Fine);
			ps.setInt(8, any_other_charge);
			ps.setInt(9, totalamount);
			
			if (maintenanceUpdate(flatno,ownerName) == 1) {
				ps.setString(1, flatno);
				ps.setString(2, ownerName);
				ps.setString(3, monthlydate);
				ps.setInt(4, fixedcharge+fixed_m);
				ps.setInt(5, servicemain+service_m);
				ps.setInt(6, ClubHouseCharge+club_house);
				ps.setInt(7, Fine+fine);
				ps.setInt(8, any_other_charge+any_other);
				ps.setInt(9, totalamount+tempTotal);
				if(currentDate.compareTo(tempdate)>0)
				{
				if (ps.executeUpdate() > 0) {
					return 1;
				}
				}
				else
				{
					return 0;
				}
			}
			else
			{
				if (ps.executeUpdate() > 0) {
					return 1;
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error in Maintenance : " + e.getMessage());
		}
		return 0;
	}

	public int flatBuildingSame(String oname, int fno) {

		try {
			PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.OBF_DETAILS);
			ps.setString(1, oname);
			ps.setInt(2, fno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if (rs.getInt(5) == fno && (rs.getString(2)).equals(oname)) {
					return 1;
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error occur in Flat Exit method: " + e.getMessage());
		}
		return 0;

	}

	public int maintenanceUpdate(String flatno,String oname) {

		try {
			PreparedStatement ps = DBConnections.getConnection().prepareStatement(UtilQueries.MAINTENANCE_DETAILS);
			ps.setString(1, flatno);
			ps.setString(2, oname);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if (rs.getString("fno").equals(flatno)) {
					fixed_m=rs.getInt("fixed_m");
					service_m=rs.getInt("service_m");
					club_house=rs.getInt("club_house");
					fine=rs.getInt("fine");
					any_other=rs.getInt("any_other");
					tempTotal=rs.getInt("total_amount");
					tempdate=LocalDate.parse(rs.getString("monthly_date"));
					return 1;
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error occur in Maintenance Exit method: " + e.getMessage());
		}
		return 0;

	}
	
	
	
	public int existingMaint(String fno)
	{
		String CHECK_MAINTENANCE="select total_amount,monthly_date from maintenance where fno=? order by monthly_date desc limit 0,1;";
			
		try {
			PreparedStatement ps = DBConnections.getConnection().prepareStatement(CHECK_MAINTENANCE);
			ps.setString(1, fno);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
			if (rs.getString(2).equals(fno)) {
				
				return 1;
				
			}
			}
				else{
			return 0;
				}
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error occur in Maintenance method: " + e.getMessage());
			return 0;
		}
			return 0;
	}

}
