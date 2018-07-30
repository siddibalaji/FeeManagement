<?php
$result='';
include_once("config.php");
 
$result = mysqli_query($mysqli, "SELECT * FROM users ORDER BY id DESC"); // using mysqli_query instead
?>
<a href="add1.php">Add New Data</a><br/><br/>
<center><h2>Visitors Information</h2>

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
        while($res = mysqli_fetch_array($result)) {     
echo "<tbody>";		
            echo "<tr>";
            echo "<td>".$res['name']."</td>";
            echo "<td>".$res['age']."</td>";
			echo "<td>".$res['ph']."</td>"; 
            echo "<td>".$res['cm']."</td>"; 
            echo "<td>".$res['pur']."</td>";
            echo "<td>".$res['cit']."</td>";
            echo "<td>".$res['ta']."</td>";  
            echo "<td>".$res['cot']."</td>";
            echo "<td>".$res['adhar']."</td>";
            echo "<td>".$res['email']."</td>";  			
            echo "<td>".$res['belongings']."</td>";  		
            echo "<td><a href=\"checkout.php?id=$res[id]\">Checkout</a>";
             echo "</tr>";	
echo "</tbody>";				 
        }
        ?>
		
    </table>
    </cente>