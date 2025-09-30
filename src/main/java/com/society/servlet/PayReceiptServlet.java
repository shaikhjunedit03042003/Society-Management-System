package com.society.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
@WebServlet("/getpdf")
public class PayReceiptServlet<PDF, Page> extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res, Object out) throws ServletException, IOException {
		String fileType = "";

		res.setContentType("application/pdf");
		
		res.addHeader("Content-Disposition", "attachment; filename=IDCards.pdf");
		res.setStatus(HttpServletResponse.SC_OK);
		
		ServletOutputStream sout=res.getOutputStream();
		
		  PDF pdf=new PDF(out);

	        Page pag=new Page(pdf);

	        pag.add(new MoveTo(pdf,150,730));

	        pag.add(new Text(pdf,"Hello User"));

	        pag.add(new Text(pdf,"This is a content of PDF Formated"));

	        pag.add(new Text(pdf,"This application is created by Sandeep"));

	        pag.add(new Text(pdf,"Thanks to visit this application"));

	        pdf.add(pag);

	        pdf.writePDF();

	        out.close();    
		
		
	}

}*/
