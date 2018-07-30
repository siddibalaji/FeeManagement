package com.Servlets.fems;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("I am from LoginServlet");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			if ((username.equals("shivaji")) && (password.equals("admin"))) {
				response.sendRedirect("Student.jsp");
				out.println("Changed in github");

			} else {
				out.println("incorect username or password");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NullPointerException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
