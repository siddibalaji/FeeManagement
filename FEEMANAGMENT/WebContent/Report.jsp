<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
	<jsp:include page="adminMenu.jsp" />
	<div class="main">
	<div class="container">
  <!-- Trigger the modal with a button -->
 

  <!-- Modal -->
  <div class="modal fade" id="Feereportform" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Fee Report</h4>
        </div>
        <div class="modal-body">
          <div class="container">
		<div class="col-lg-5 col-sm-5 col-md-5">
			<form id="Feereportformid" >
			<legend>Student_Info</legend>
				<table class="table table-hover" border="solid 2px">
				<thead ><tr><tr><th>Name<td>siddesh</td></th><th>Branch<td>Warangal</td></th><br></tr></tr>
				<tr><tr><th>Contact<td>9533153142</td></th><th>Joining Date<td>12-12-12</td></th></tr></tr>
				<thead>
			</table>
			<legend>Fee_Info</legend>
			<div class="table-responsive">          
              <table class="table">
    <thead>
      <tr>
        
        <th>Date</th>
        <th>Paid</th>
        <th>Remark</th>
        
      </tr>
    </thead>
    <tbody>
      <tr>
        
        <td>12-12-12</td>
        <td>4500</td>
        <td>3000 remain</td>
        
      </tr>
    </tbody>
  </table>
			</div>
			<legend></legend>
			<table class="table table-hover">
			<thead>
			<tr><th>Total_Fee:<td>4500</td></th></tr>
			<tr><th>Paid_Fee:<td>1500</td></th></tr>
			<tr><th>Balance:<td>0</td></th></tr>
			</thead>
			
			</table>	
				
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
		<div>
			<h1>Report</h1>
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
		<%
			try {
				ResultSet rs = null;
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feemanagment_db", "root", "");
				String sql = "select * from user";
				PreparedStatement pst = (PreparedStatement) con.prepareStatement(sql);

				rs = pst.executeQuery();
		%>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>DOJ</th>
					<th>Contact</th>
					<th>Fee</th>
					<th>Balance</th>
					<th>Email</th>
					<th>Action</th>
					<th>Print</th>
					
				</tr>
			</thead>
			<tbody>
			<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString("totalfee") %></td>
					<td><%=rs.getString("balance") %></td>
					<td><%=rs.getString(8) %></td>
					<td> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#Feereportform">Fee Details</button></td>
					<td><a href="feeprintout.jsp"><img src="D:\GIT HUB\FeeManagement\FEEMANAGMENT\images\p1.jpg"></a></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<%
			} catch (Exception e) {
				out.println("Error goes her" + e);
			}
		%>


		<!-- <div id="somediv"></div> -->
		
	</div>



	<script>
		$(window).on('load', function() {
			console.log("jquery");
			$.ajax({
				type : "POST",
				url : "StudentFinder",
				success : function(data) {
					console.log(data);
					console.log(data[5]);
					$("#somediv").html(data).addClass("alert alert-success");

				}
			});
		});
	</script>
	
</body>
</html>