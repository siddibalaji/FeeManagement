package com.sp.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSetMetaData;
import com.sp.dto.StudentBean;


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
			ResultSetMetaData md=(ResultSetMetaData) rs.getMetaData();
			System.out.println(md.getColumnCount());
			System.out.println(md.getColumnName(5));
			System.out.println(rs);
			StudentBean obj=new StudentBean();
			List<Object> list= obj.resultSetToArrayList(rs);
			System.out.println(list);	
			out.println(list);
		} catch (Exception e) {
			out.println("Error goes her"+e);
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
