<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/styles.css">
<title>Update Fee</title>
</head>
<body>
	<jsp:include page="adminMenu.jsp" />
	<div class="main">
		<div>
			<h1>FEES</h1>
		</div>
		<div></div>
		<div>
		
			<form action="" method="post" id="getStudents">
				<label>Name</label><input type="text"><label>DOJ</label><input
					type="date"> <label>Branch</label> <select>
					<option>CSE</option>
					<option>ECE</option>
					<option>EEE</option>
					<option>MEE</option>
				</select>
				<button type="submit">Find</button>
				<input type="reset" value="Clear">
			</form>
		</div>
		<table class="table table-hover">
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
			<tbody>
				<tr>
					<td>1</td>
					<td>John</td>
					<td>Doe</td>
					<td>99878367862</td>
					<td>John</td>
					<td>25000</td>
					<td>10000</td>
					<td>john@example.com</td>
					<td>edit</td>
					<td>del</td>
				</tr>
			</tbody>
		</table>
<div id="somediv"></div>
	</div>
	


<script>
$(window).on('load', function(){
	console.log("jquery");
	$.ajax({
		type : "POST",
		
		url : "StudentFinder",
		data : $("#regstd").serialize(), 									
		success : function(data) {
			console.log(data);
			console.log(data[1])
			$("#somediv").html(data).addClass("alert alert-success");
			
		}
	});
});
</script>
</body>
</html>