package com.Servlets.fems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchingServlet
 */
@WebServlet("/SearchingServlet")
public class SearchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(" i am from SearchingServlet");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			String search=request.getParameter("name");
			String driver = "com.mysql.jdbc.Driver";
			String connectionUrl = "jdbc:mysql://localhost:3306/";
			String database = "feemanagment_db";
			String userid = "root";
			String password = "";
			try {
			Class.forName(driver);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			Connection connection = null;
			Statement statement = null;
			
			connection = DriverManager.getConnection(connectionUrl+database, userid, password);
			statement=connection.createStatement();
			System.out.println(" i am from SearchingServlet1");
			String sql ="select * from user where firstname="+search+"";
			
			ResultSet rs = statement.executeQuery(sql);
			System.out.println(" i am from SearchingServlet3");
			ResultSetMetaData metadata = rs.getMetaData();
			
			while(rs.next()){
			
		for(int i=0;i<=metadata.getColumnCount();i++){
			rs.getString(i);
		}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
