package com.Servlets.fems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class StudentRegistrationServlet
 */
@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		System.out.println(" I am from StudentRegistrationServlet");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String doj=request.getParameter("doj");
		String phone_number=request.getParameter("number");
		String fathername=request.getParameter("fname");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email"); 
		String clas=request.getParameter("class");
		String section=request.getParameter("section");
		String totalfee=request.getParameter("totalfee");
		String advancefee=request.getParameter("advancefee");
		String balance=request.getParameter("balance");
		String feeremarks=request.getParameter("feeremark");
		String aboutstudent=request.getParameter("aboutstudent");
		String address=request.getParameter("address"); 
		out.println(fathername);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/feemanagment_db","root","");
			String sql="INSERT INTO user(firstname,lastname,doj,phone_number,fathername,gender,email, class,section, totalfee,advancefee,balance,feeremarks,aboutstudent,address) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst= (PreparedStatement) con.prepareStatement(sql);
			
			 pst.setString(1,firstname);  
	          pst.setString(2,lastname);        
	          pst.setString(3,doj);
	          pst.setString(4,phone_number);
	          pst.setString(5,fathername);
	          pst.setString(6,gender);
	          pst.setString(7,email);
	          pst.setString(8,clas);
	          pst.setString(9,section);
	          pst.setString(10,totalfee);
	          pst.setString(11,advancefee);
	          pst.setString(12,balance);
	          pst.setString(13,feeremarks);
	          pst.setString(14,aboutstudent);
	          pst.setString(15,address);


			int i=pst.executeUpdate();
			System.out.println(i);
			if(i!=0){
				out.println("values are inserted successfully");
				con.close();
			}else{
				out.print("somthing went wrong");
			}
			
		} catch (Exception e) {
			out.println(e);
		}

		
		
	}

}
