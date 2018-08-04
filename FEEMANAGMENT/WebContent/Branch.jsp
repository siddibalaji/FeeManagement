
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
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
h2{
border-bottom: 5px solid green;
padding-bottom:20px;
}
.table table-hover{

}
</style>
</head>
<body>
<jsp:include page="adminMenu.jsp" />

<div class="main">
<div class="container">

<!-- Modal -->
  <div class="modal fade" id="Branchform" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add Branch</h4>
        </div>
        <div class="modal-body">
          <div class="container">
		<div class="col-lg-5 col-sm-5 col-md-5">
			<form id="branchdetailsformid" >
			<legend>Branch Details</legend>
				<div class="form-group well well-sm well well-sm">
					<input type="text" name="branchname" id="branchname"
						placeholder="Enter Your Branch Name.." class="form-control" required >
				</div>
				<div class="form-group well well-sm well well-sm">
					<input type="textarea" name="branchaddress" id="branchaddress"
						placeholder="Enter Your Branch Address.." class="form-control" required >
				</div>
				<div class="form-group well well-sm well well-sm">
					<input type="textarea" name="branchdetails" id="branchdetails"
						placeholder="Enter Your Branch Details.." class="form-control" required >
				</div>
				<div class="btn">
					<button type="submit" name="subm" id="subm" class="btn btn-info">Save
						</button>
            <div id="response"></div>
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
</div>



  <h2>Branch</h2> 
  <div align="right">
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#Branchform">+Add</button>   
  </div> 
  
  <div align="left" class="search-container">
  <form>
  <input type="text" placeholder="Search.." name="search">
  <button type="submit"><i class="fa fa-search"></i></button>
  </form>
  </div>
    
  <!-- *******************************//fetch the branch details here...------------- -->   
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Branch</th>
        <th>Address</th>
        <th>Details</th>
        <th>Action</th>
      </tr>
    </thead>
    <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from branches";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("branch_name") %></td>
<td><%=resultSet.getString("branch_address") %></td>
<td><%=resultSet.getString("branch_details") %></td>
<td><a href="branchupdate.jsp?id=<%=resultSet.getString("id")%>"><button type="button" class="update">Update</button></a></td>
<td><a href="deletebranch.jsp?id=<%=resultSet.getString("id")%>"><button type="button" class="delete">Delete</button></a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<!-- fetch is completed -->

</div>

<script>
	 $(document).ready(function(){
	$("#branchdetailsformid").submit(function(e) {
    
		$('#response').html("<b>Loading response...</b>");		 
	    var url = "BranchRegistrationServlet"; // the script where you handle the form input.

	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#branchdetailsformid").serialize(), // serializes the form's elements.
	           success: function(data)
	           {
		           $("#response").html(data).addClass("alert alert-success");		        	   
		           $("#branchdetailsformid")[0].reset();
		           
		           $("#response").fadeOut(300);
		           console.log("registarion form");
	           }
	         });
           
	    e.preventDefault(); // avoid to execute the actual submit of the form.
           
  });
}).delay(300);
	</script>
</body>
</html>
