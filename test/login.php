<?php
if(isset($_POST['submit'])){
    $username = $_POST['uname'];
    $password = $_POST['password'];
    $role =$_POST['role_type'];
    
    
    
    if($username == "admin1" && $password == "pass1" && $role == "admin" ){
        
        header('location: index.php');
        
        
    }
    
    elseif($username == "guard1" && $password == "pass1" && $role == "guard" ){
        header('location: securityHome.php');
        
    }
    else{
        echo "invalid ";
    }
    
}

?>


<html>
<head>Login Here
<title>Login
</title>
</head>
<body>
<form action = "" method = "POST">
<label>UserName</label>
<input type ="text" name="uname"><br>
<label>Password</label>
<input type = "password" name= "password"><br>
<label> Role </label>

<select name = "role_type" >
<option value = "admin"> Admin </option>
<option value = "guard"> Guard </option>
</select>

<input type = "submit" name="submit" value="Login">
</form></body>
</html>