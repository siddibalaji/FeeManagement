<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  <style type="text/css">
  #srearchform{
	margin-top: 47px;
    margin-bottom: -26px;
}
h2{
border-bottom: 5px solid green;
padding-bottom:20px;
}
  </style>
</head>
<body>
<script type="text/javascript">

function myfunction(){
	var firstname=document.getElementById("firstname");
	var lastname=document.getElementById("lastname").focus();
	
}



</script>

<div>   
  <div class="main">
  <div id="srearchform">
  <div>
			<h2>Student Details</h2>
		</div>
		<div>

			<form action="SearchingServlet" method="post" id="getStudents">
				<span><label>Name</label><input type="text" name="name" onkeyup="myFunction()"></span>
				<label>DOJ</label><input
					type="date"> <label>Branch</label> <select>
					<option>CSE</option>
					<option>ECE</option>
					<option>EEE</option>
					<option>MEE</option>
				</select>
				<button type="submit" name="save" class="btn btn-primary">Search</button>
				<input type="reset" class=" btn btn-warning" value="Clear" >
			</form>
		</div>
	</div>
  <jsp:include page="RetriveStudentDetails.jsp" />
   <jsp:include page="Update.jsp" />
  </div>
  
</div>
<!-- this is for ADD STUDENT DETAILS -->
<div id="registrationform" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add Student</h4>
      </div>
      <div class="modal-body">
       
	<!-- 	<div class="col-lg-4 col-sm-4 col-md-4"> -->
		<!-- </div> -->
	<div class="container">
		<div class="col-lg-5 col-sm-5 col-md-5">
			<form id="registrationformid" >
			<legend>Personal Information</legend>
				<div class="form-group well well-sm well well-sm">
					<input type="text" name="firstname" id="firstname"
						placeholder="Enter Your FirstName" class="form-control" required >
				</div>
				<div class="form-group well well-sm">
					<input type="text" name="lastname" id="lastname"
						placeholder="Enter Your LastName" class="form-control"  >
				</div>
				<div class="form-group well well-sm">
					<input type="date" name="doj" id="doj"
						placeholder="D.O.J" class="form-control"  required>
				</div>
				<div class="form-group well well-sm">
					<input type="text" name="number" id="number"
						placeholder="phone number" class="form-control"  required>
				</div>
				<div class="form-group well well-sm">
					<input type="text" name="fname" id="fname"
						placeholder="Enter your Father Name" class="form-control" required >
				</div>
				<div class="form-group well well-sm">
					<input type="radio" name="gender" id="gen" value="male"  required>Male 
					<input	type="radio" name="gender" id="gen" value="female"  required>Female
				</div>
				<div class="form-group well well-sm">
					<input type="email" name="email" id="email"
						placeholder="Ex:your@gmail.com" class="form-control" required  >
				</div>
				<div class="form-group well well-sm">
					<select name="class" id="class" placeholder="Class"
						class="form-control">
						<option>CSE</option required>
						<option>ECE</option required>
						<option>EEE</option required>
					</select>
				</div>
				<div class="form-group well well-sm">
					<select type="text" name="section" id="section"
						placeholder="Section" class="form-control" required>
						<option>I</option>
						<option>II</option>
						<option>III</option>
					</select>
				</div>
<!-- This is about FeeInformation -->
<legend>Fee Information</legend>
				<div class="form-group well well-sm">
					<input type="text" name="totalfee" id="total Fee"
						placeholder="Totalfee" class="form-control" required >
				</div> 
				<div class="form-group well well-sm">
					<input type="text" name="advancefee" id="advancefee"
						placeholder="advancefee" class="form-control" required >
				</div>
				<div class="form-group well well-sm">
					<input type="text" name="balance" id="balance"
						placeholder="Balance" class="form-control" required >
				</div>
				<div class="form-group well well-sm">
					<input type="text" name="feeremark" id="feeremark"
						placeholder="comments about fee remarks" class="form-control" required >
				</div>
<!-- This is about optional information -->

<legend>Optional Information</legend>
          <div class="form-group well well-sm">
					<input type="textarea" name="aboutstudent" id="aboutstudent"
						placeholder="Aboutstudent" class="form-control" required >
				</div>
				<div class="form-group well well-sm">
					<input type="text" name="address" id="address"
						placeholder="Enter yours address details..." class="form-control" required >
				</div>
				
				<div class="btn">
					<button type="submit" name="subm" id="subm" class="btn btn-info">Add
						Student</button>
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
 

<script>
	 $(document).ready(function(){
	$("#registrationformid").submit(function(e) {
    
		$('#response').html("<b>Loading response...</b>");		 
	    var url = "StudentRegistrationServlet"; // the script where you handle the form input.

	    $.ajax({
	           type: "POST",
	           url: url,
	           data: $("#registrationformid").serialize(), // serializes the form's elements.
	           success: function(data)
	           {
		           $("#response").html(data).addClass("alert alert-success");		        	   
		           $("#registrationformid")[0].reset();
		           
		           $("#response").fadeOut(3000);
		           console.log("registarion form");
	           }
	         });
           
	    e.preventDefault(); // avoid to execute the actual submit of the form.
           
  });
}).delay(3000);
	</script>

</body>
</html>
