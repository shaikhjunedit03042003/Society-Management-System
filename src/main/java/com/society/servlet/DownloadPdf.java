/*package com.society.servlet;



import java.io.*; 
import java.util.Date; 
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
  
public class DownloadPdf extends HttpServlet { 
    private static final long serialVersionUID = 1L; 
    @Override
    protected void doGet(HttpServletRequest request, 
                         HttpServletResponse response) 
        throws ServletException, IOException 
    { 
  
        response.setContentType("application/pdf"); 
  
        response.setHeader( 
            "Content-disposition", 
            "inline; filename='Downloaded.pdf'"); 
  
        try { 
  
            Document document = new Document(); 
  
            PdfWriter.getInstance( 
                document, response.getOutputStream()); 
  
            document.open(); 
  
            document.add(new Paragraph("GeeksforGeeks")); 
            document.add(new Paragraph( 
                "This is a demo to write data to pdf\n using servlet\nThank You")); 
  
            document.close(); 
        } 
        catch (DocumentException de) { 
            throw new IOException(de.getMessage()); 
        } 
    } 
}*/