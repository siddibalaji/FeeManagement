<?php
$result='';
include_once("config.php");

$result = mysqli_query($mysqli, "SELECT * FROM users ORDER BY id DESC"); // using mysqli_query instead

?>
 
<html>
<head>    
    <title>Home</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head>
 
<body>
<?php
include_once("search.php");
?>
<!--     <a href="add1.php">Add New Data</a><br/><br/> -->
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
        if (isset($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
        } else {
            $pageno = 1;
        }
        $no_of_records_per_page = 10;
        $offset = ($pageno-1) * $no_of_records_per_page;
        $total_pages_sql = "SELECT COUNT(*) FROM users";
        $result = mysqli_query($mysqli,$total_pages_sql);
        $total_rows = mysqli_fetch_array($result)[0];
        $total_pages = ceil($total_rows / $no_of_records_per_page);

        $sql = "SELECT * FROM users LIMIT $offset, $no_of_records_per_page";
        $res_data = mysqli_query($mysqli, $sql);
        while($res = mysqli_fetch_array($res_data)){
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
            echo "<td><a href=\"edit.php?id=$res[id]\"onClick=\"return confirm('Are you sure you want to edit?')\">Edit</a> | <a href=\"delete.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
            echo "</tr>";
            echo "</tbody>";
        }
        mysqli_close($mysqli);
    ?>
		
    </table>
	<br />	
	<ul class="pagination">
        <li><a href="?pageno=1">First</a></li>
        <li class="<?php if($pageno <= 1){ echo 'disabled'; } ?>">
            <a href="<?php if($pageno <= 1){ echo '#'; } else { echo "?pageno=".($pageno - 1); } ?>">Prev</a>
        </li>
        <li class="<?php if($pageno >= $total_pages){ echo 'disabled'; } ?>">
            <a href="<?php if($pageno >= $total_pages){ echo '#'; } else { echo "?pageno=".($pageno + 1); } ?>">Next</a>
        </li>
        <li><a href="?pageno=<?php echo $total_pages; ?>">Last</a></li>
    </ul>
   	<center> 
</center>

    <form method="post" action="export.php">
  <center>   <input type="submit" name="export"  value="Export" /></center>

    </form>
</body>
</html>