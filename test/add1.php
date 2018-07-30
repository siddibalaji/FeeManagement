<html>
<head>
    <title>Add Data</title>
</head>
 
<body>
<?php date_default_timezone_set('Asia/Kolkata');?>
    <a href="index.php">Home</a>
    <br/><br/>
 
    <form action="add.php" method="post" name="form1">
        <table width="25%" border="0">
            <tr> 
                <td>Name</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr> 
                <td>Age</td>
                <td><input type="text" name="age"></td>
            </tr>
			 <tr> 
                <td>Contact</td>
                <td><input typet="text" name="contact"></td>
            </tr>
			 <tr> 
                <td>Coming From</td>
                <td><input type="text" name="cm"></td>
            </tr>
			 <tr> 
                <td>Purpose</td>
                <td><input type="text" name="purpose"></td>
            </tr>
			 <tr> 
                <td>Check In Time</td>
                <td><input type="text" name="cit" value="<?php echo date('Y-m-d H:i:s')?>" readonly></td>
            </tr>
			<tr> 
                <td>To Address</td>
                <td><input type="text" name="ta"></td>
            </tr>
			 
			<tr> 
                <td>Adhar/Pan Card No</td>
                <td><input type="text" name="adhar"></td>
            </tr>
            <tr> 
                <td>Email</td>
                <td><input type="text" name="email"></td>
            </tr>
            
            <tr> 
                <td>Belongings</td>
                <td><textarea name="belongings" id="belongings"></textarea></td>
            </tr>
            <tr> 
                <td></td>
                <td><input type="submit" name="Submit" value="Add"></td>
            </tr>
        </table>
    </form>
</body>
</html>