package com.Servlets.fems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class BranchRegistrationServlet
 */
@WebServlet("/BranchRegistrationServlet")
public class BranchRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		System.out.println("I am from BranchRegistrationServlet");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String bname=request.getParameter("branchname");
		String baddress=request.getParameter("branchaddress");
		String bdetails=request.getParameter("branchdetails");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/feemanagment_db","root","");
			PreparedStatement pst=(PreparedStatement) con.prepareStatement("insert into branches(branch_name,branch_address,branch_details) values(?,?,?)");
			pst.setString(1, bname);
			pst.setString(2, baddress);
			pst.setString(3,bdetails);
			int i=pst.executeUpdate();
			if(i!=0){
			out.println(bname+ ":   is added successfully");
			con.close();
			}else{
				out.println("barnch is not added successfully");
			}
		} catch (Exception e) {
	     e.printStackTrace();
		}
	}

}
