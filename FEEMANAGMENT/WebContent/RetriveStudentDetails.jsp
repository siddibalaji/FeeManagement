<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
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
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/styles.css">
  <style>
  #addbutton{
  margin-left:999px;
  }
  </style>
</head>
<body>

<div>
<button type="button" id="addbutton" class="btn btn-info btn-lg" data-toggle="modal" data-target="#registrationform">+Add Student</button><jsp:include page="adminMenu.jsp" />
</div>
 
<table  class="table table-hover">

<thead>
      <tr>
      <th>#</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Contact</th>
        <th>DOJ</th>
        <th>Fee</th>
        <th>Balance</th>
        <th>Email</th>
        <th>Edit</th>
        <th>Del</th>
      </tr>
    </thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from user";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("phone_number") %></td>
<td><%=resultSet.getString("doj") %></td>
<td><%=resultSet.getString("totalfee") %></td>
<td><%=resultSet.getString("balance") %></td>
<td><%=resultSet.getString("email") %></td>
<td><a href="Update.jsp?id=<%=resultSet.getString("id")%>">update</a></td>
<td><a href="delete.jsp?id=<%=resultSet.getString("id") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>