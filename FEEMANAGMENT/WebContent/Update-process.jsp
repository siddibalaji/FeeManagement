<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/feemanagment_db";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String id = request.getParameter("id");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String number = request.getParameter("number");
String date=request.getParameter("date");
String fee=request.getParameter("totalfee");
String balance=request.getParameter("balance");
String email=request.getParameter("email");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update user set id=?,firstname=?,lastname=?,phone_number=?,doj=?,totalfee=?,balance=?,email=? where id="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, firstname);
ps.setString(3, lastname);
ps.setString(4,number);
ps.setString(5, date);
ps.setString(6, fee);
ps.setString(7, balance);
ps.setString(8, email);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
response.sendRedirect("Student.jsp");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>