<?php
date_default_timezone_set('Asia/Kolkata');
include_once("config.php");
$id = $_GET['id'];
 
$checkoutdate=date('H:i:s');
$sql = "update users set cot='$checkoutdate' where ID = $id";

if (mysqli_query($mysqli, $sql)) {
    echo "GoodBye....";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($mysqli);
}

mysqli_close($mysqli);

?>
<a href="securityHome.php">Visitors</a>