<?php
// including the database connection file
include_once("config.php");
 
if(isset($_POST['update']))
{    
   
    $id = $_POST['id'];
     $name = $_POST['name'];
    $age = $_POST['age'];
	$ph = $_POST['contact'];
    $cm = $_POST['cm'];
	$pur = $_POST['purpose'];
    $cit = $_POST['cit'];
    $ta = $_POST['ta'];
	$cot = $_POST['cot'];
    $adhar = $_POST['adhar'];
    $email = $_POST['email'];  
    
    // checking empty fields
    // checking empty fields
    if(empty($name) || empty($age) || empty($ph) || empty($cm) || empty($pur) || empty($cit) || empty($ta) || empty($cot) || empty($adhar)|| empty($email)) {                
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
		if(empty($cot)) {
            echo "<font color='red'>Check out time field is empty.</font><br/>";
        }
        
        if(empty($adhar)) {
            echo "<font color='red'>Adhar field is empty.</font><br/>";
        }
        
        if(empty($email)) {
            echo "<font color='red'>Email field is empty.</font><br/>";
        }   
    } else {    
        //updating the table
        $result = mysqli_query($mysqli, "UPDATE users SET name='$name',age='$age',ph='$ph',cm='$cm',pur='$pur',cit='$cit',ta='$ta',cot='$cot',adhar='$adhar',email='$email' WHERE id=$id");
        
        //redirectig to the display page.
        header("Location: index.php");
    }
}
?>
<?php
//getting id from url
$id1= $_GET['id'];
 
//selecting data associated with this particular id
$result1 = mysqli_query($mysqli, "SELECT * FROM users WHERE id=$id1");
 
while($res = mysqli_fetch_array($result1))
{
    $name = $res['name'];
    $age = $res['age'];
    $ph = $res['ph'];
	$cm = $res['cm'];
    $pur = $res['pur'];
    $cit = $res['cit'];
	$ta = $res['ta'];
    $cot = $res['cot'];
    $adhar = $res['adhar'];
	$email = $res['email'];
}
?>
<html>
<head>    
    <title>Edit Data</title>
</head>
 
<body>
    <a href="index.php">Home</a>
    <br/><br/>
    
    <form name="form1" method="post" action="edit.php">
        <table border="0">
            <tr> 
                <td>Name</td>
                <td><input type="text" name="name" value="<?php echo $name;?>"></td>
            </tr>
            <tr> 
                <td>Age</td>
                <td><input type="text" name="age" value="<?php echo $age;?>"></td>
            </tr>
            <tr> 
                <td>Contact</td>
                <td><input type="text" name="contact" value="<?php echo $ph;?>"></td>
            </tr>
			
			 <tr> 
                <td>Coming From</td>
                <td><input type="text" name="cm" value="<?php echo $cm;?>"></td>
            </tr>
			 <tr> 
                <td>Purpose</td>
                <td><input type="text" name="purpose" value="<?php echo $pur;?>"></td>
            </tr>
			 <tr> 
                <td>Check In Time</td>
                <td><input type="text" name="cit" value="<?php echo $cit;?>"></td>
            </tr>
			<tr> 
                <td>To Address</td>
                <td><input type="text" name="ta" value="<?php echo $ta;?>"></td>
            </tr>
			 <tr> 
                <td>Check Out Time</td>
                <td><input type="text" name="cot" value="<?php echo $cot;?>"></td>
            </tr>
			<tr> 
                <td>Adhar/Pan Card No</td>
                <td><input type="text" name="adhar" value="<?php echo $adhar;?>"></td>
            </tr>
            <tr> 
                <td>Email</td>
                <td><input type="text" name="email" value="<?php echo $email;?>"></td>
            </tr>
            <tr>
                <td><input type="hidden" name="id" value=<?php echo $_GET['id'];?>></td>
                <td><input type="submit" name="update" value="Update"></td>
            </tr>
        </table>
    </form>
</body>
</html>