package com.society.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.society.utils.DBConnections;
import com.society.utils.UtilQueries;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter pw = res.getWriter();
		res.setContentType("text/html");

		String user = req.getParameter("username");
		String pass = req.getParameter("password");
		//pw.println(user);
		//pw.println(pass);

		if (login(user, pass).equals("Success")) {
			System.out.println("Successfully Login");
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/menu.jsp");
			rd.forward(req, res);
		} else {
			System.out.println("Username or Password incorrect");
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/index.jsp");
			req.setAttribute("errorMessage", "Username or Password incorrect");
			rd.include(req, res);

		}
		pw.close();

	}

	public String login(String user, String pass) {
		String response="";
		try {
			PreparedStatement stmt = DBConnections.getConnection().prepareStatement(UtilQueries.GET_USER_PASS);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(user) && rs.getString(2).equals(pass)) {
					response="Success";
				}
				else
				{
					response="Failed";
				}
			}
		}

		catch (Exception e) {
			System.out.println("Error Occured in Login Page"+e.getMessage());
		}
		return response;
	}

}



