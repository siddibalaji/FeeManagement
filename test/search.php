<?php
date_default_timezone_set('Asia/Kolkata');
 include_once("config.php");
 if(isset($_POST['search'])){
     $cit=$_POST['startdate'];
     $cot = $_POST['enddate'];     
     $cit .=date(' 2000-01-01');
     $cot .=date(' 2000-01-01');
     
    
     $query=mysqli_query($mysqli,"select * from users where cit between '$cit' and '$cot' order by cit");
     $count=mysqli_num_rows($query);
     echo $count;
     if(!$count== 1){
        echo "no visitors";
    }else{
        ?>
        <center>
        <table width='90%' border=2>
        <thead bgcolor='#CCCCCC'>
            <th>Name</th>
            <th>Age</th>
            <th>Contact</th>
            <th>Coming From</th>
			<th>Purpose</th>
            <th>Check In Time</th>
            <th>To Address</th>
            <th>Check Out Time</th>
			<th>Adhar</th>			
            <th>Email</th>
            <th>Belongings</th>
            <th>Update</th>
        </thead>
        <?php 
        
        while($row =mysqli_fetch_assoc($query)){
        echo "<tbody>";
        echo "<tr>";
        echo "<td>".$row['name']."</td>";
        echo "<td>".$row['age']."</td>";
        echo "<td>".$row['ph']."</td>";
        echo "<td>".$row['cm']."</td>";
        echo "<td>".$row['pur']."</td>";
        echo "<td>".$row['cit']."</td>";
        echo "<td>".$row['ta']."</td>";
        echo "<td>".$row['cot']."</td>";
        echo "<td>".$row['adhar']."</td>";
        echo "<td>".$row['email']."</td>";
        echo "<td>".$row['belongings']."</td>";
        echo "</tr>";
        echo "</tbody>";			
        }
    }
    
    
 }
?>
</table>
</center>
<html>
<head>Search here</head>
<body>
<form action="" method="post">
<center>
<input type="date" name = "startdate">
<input type = "date" name = "enddate"><br><br>
<input type="submit" name="search" value="search">
</center></form>
</body>
</html>