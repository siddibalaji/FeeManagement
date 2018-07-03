package com.sp.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;


@WebServlet("/StudentFinder")
public class StudentFinder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		System.out.println("Enter to servlet");
		ResultSet rs=null;
		PrintWriter out=response.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/feemanagment_db","root","");
			String sql="select * from user";
			PreparedStatement pst= (PreparedStatement) con.prepareStatement(sql);
			
			 


			rs=pst.executeQuery();
			System.out.println(rs);
			while(rs.next())
			{
				out.println(rs.getString(1));
				out.println(rs.getString(2));
				out.println(rs.getString(3));
				out.println(rs.getString(4));
				out.println(rs.getString(5));
				out.println(rs.getString(6));
				out.println(rs.getString(7));
				out.println(rs.getString(8));
				out.println(rs.getString(9));
				out.println(rs.getString(10));
				out.println(rs.getString(11));
				out.println(rs.getString(12));
				out.println(rs.getString(13));
				out.println(rs.getString(14));
				out.println(rs.getString(15));
				out.println(rs.getString(16));
			}
			
		} catch (Exception e) {
			out.println("Error goes her"+e);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
