<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from user where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/styles.css">
</head>
<html>
<body>
<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
       <div class="container">
		<div class="col-lg-5 col-sm-5 col-md-5">
			<form id="registrationformid" >
			<legend>Personal Information</legend>
				<div class="form-group well well-sm well well-sm">
					<input type="text" name="firstname" id="firstname"
						placeholder="Enter Your FirstName" class="form-control" value="<%=resultSet.getString("firstname") %>" >
				</div>
			</form>
			</div>
			</div>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<h1>Update</h1>
 <div class="container">
<div class="col-lg-5 col-sm-5 col-md-5">
<form method="post" action="Update-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">
<div class="form-group well well-sm well well-sm">
<strong>ID:</strong><input type="text" name="id" class="form-control" value="<%=resultSet.getString("id") %>">
</div>
<div class="form-group well well-sm well well-sm">
<strong>First name:</strong>
<input type="text" name="firstname" class="form-control" value="<%=resultSet.getString("firstname") %>">

</div>
<div class="form-group well well-sm well well-sm">
<strong>Last name:</strong>
<input type="text" name="lastname" class="form-control"  value="<%=resultSet.getString("lastname") %>">

</div>
<div class="form-group well well-sm well well-sm">
<strong>Contact:</strong>
<input type="text" name="number" class="form-control"value="<%=resultSet.getString("phone_number") %>">

</div>
<div class="form-group well well-sm well well-sm">
<strong>DOJ:</strong>
<input type="date" name="date" class="form-control" value="<%=resultSet.getString("doj") %>">
</div>
<div class="form-group well well-sm well well-sm">
<strong>Fee:</strong>
<input type="text" name="totalfee" class="form-control" value="<%=resultSet.getString("totalfee") %>">

</div>
<div class="form-group well well-sm well well-sm">
<strong>Balance:</strong>
<input type="text" name="balance" class="form-control" value="<%=resultSet.getString("balance") %>">

</div>
<div class="form-group well well-sm well well-sm">
<strong>Email:</strong>
<input type="email" name="email" class="form-control" value="<%=resultSet.getString("email") %>">
</div>
<input type="submit" value="submit">
</form>
</div>
</div>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>