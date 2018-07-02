package com.Servlets.fems;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("I am from LoginServlet");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		if((username.equals("shivaji")) &&(password.equals("admin")))
		{
		out.println("wel come to admin panal");
			
		}else{
			out.println("incorect username or password");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
