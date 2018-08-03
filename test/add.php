<html>
<head>
    <title>Add Data</title>
</head>
 
<body>
<?php
//including the database connection file
include_once("config.php");
 
if(isset($_POST['Submit'])) {    
    $name = $_POST['name'];
    $age = $_POST['age'];
	$ph = $_POST['contact'];
    $cm = $_POST['cm'];
	$pur = $_POST['purpose'];
    $cit = $_POST['cit'];
    $ta = $_POST['ta'];
	
    $adhar = $_POST['adhar'];
    $email = $_POST['email'];
    $belongings = $_POST['belongings'];
        
    // checking empty fields
    if(empty($name) || empty($age) || empty($ph) || empty($cm) || empty($pur) || empty($cit) || empty($ta)  || empty($adhar)|| empty($email)) {                
        if(empty($name)) {
            echo "<font color='red'>Name field is empty.</font><br/>";
        }
        
        if(empty($age)) {
            echo "<font color='red'>Age field is empty.</font><br/>";
        }
         if(empty($ph)) {
            echo "<font color='red'>Contact field is empty.</font><br/>";
        }
        
        if(empty($cm)) {
            echo "<font color='red'>Coming address field is empty.</font><br/>";
        }
		if(empty($pur)) {
            echo "<font color='red'>Purpose field is empty.</font><br/>";
        }
        
        if(empty($cit)) {
            echo "<font color='red'>Check in time field is empty.</font><br/>";
        }
        
        if(empty($ta)) {
            echo "<font color='red'>To Address field is empty.</font><br/>";
        }
		
        
        if(empty($adhar)) {
            echo "<font color='red'>Adhar field is empty.</font><br/>";
        }
        
        if(empty($email)) {
            echo "<font color='red'>Email field is empty.</font><br/>";
        }
          
        //link to the previous page
        echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
    } else {      
        // if all the fields are filled (not empty)             
        //insert data to database
        $time= strtotime($cit);
        $cdate=date('Y-m-d H:i:s', $time);     
        $result = mysqli_query($mysqli, "INSERT INTO users(name,age,ph,cm,pur,cit,ta,adhar,email,belongings) VALUES('$name','$age','$ph','$cm','$pur','$cdate','$ta','$adhar','$email','$belongings')");
        
        //display success message
        echo "<font color='green'>Data added successfully.";
        echo "<br/><a href='index.php'>View Result</a>";
    }
}
?>
</body>
</html>