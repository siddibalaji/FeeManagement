<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="css/styles.css">
<title>Update Fee</title>
<style type="text/css">
#success_message{ display: none;}
h2{
border-bottom: 5px solid green;
padding-bottom:20px;
}

</style>
</head>
<body>
	<jsp:include page="adminMenu.jsp" />
	<div class="main">
		<div>
			<h2>FEES</h2>
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
			<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(9) %></td>
					<td><%=rs.getString(8) %></td>
					<td> <button type="button" class="btn btn-info" data-toggle="modal" data-target="#Payfeeform">Pay_Fee</button></td>
					<td>del</td>
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
					$("").html(data).addClass("alert alert-success");

				}
			});
		});
	</script>
	<!-- Modal -->
  <div class="modal fade" id="Payfeeform" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Pay Fee...</h4>
        </div>
        <div class="modal-body">
         <div class="container">
<div class="container">
		<div class="col-lg-5 col-sm-5 col-md-5">
    <form class="well form-horizontal" action=" " method="post"  id="contact_form">


<!-- Form Name -->
<!-- Text input-->

<div class="form-group">
  <label >Name</label>  
  <div >
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="first_name" placeholder="First Name" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->
       
<div class="form-group">
  <label >Contact </label>  
    <div>
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="phone" placeholder="(845)555-1212" class="form-control" type="text">
    </div>
  </div>
</div>
<!-- Text input-->
       
<div class="form-group">
  <label >Take Fee</label>  
    <div >
    <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-rupee"></i></span>
  <input name="takefee" placeholder="take fee..." class="form-control" type="text">
    </div>
  </div>
</div>
<!-- Text input-->
       
<div class="form-group">
  <label >Balance</label>  
    <div >
    <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-rupee"></i></span>
  <input name="balance" placeholder="Balance amount...." class="form-control" type="text">
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label>Paid</label>  
    <div>
    <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-rupee"></i></span>
  <input name="paid" placeholder="Paid amount..." class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label>Date</label>  
    <div >
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <input name="date" placeholder="dd-mm-yyyy" class="form-control"  type="date">
    </div>
  </div>
</div>

<!-- Text area -->
  
<div class="form-group">
  <label>Remark</label>
    <div >
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
        	<textarea class="form-control" name="comment" placeholder="Description..."></textarea>
  </div>
  </div>
</div>

<!-- Success message -->
<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div>

<!-- Button -->
<div class="form-group">
  <label ></label>
  <div>
    <button type="submit" class="btn btn-warning" >Send <span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>


</form>
</div>
    </div><!-- /.container -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
 </div>
 </div>
	
</body>
</html>