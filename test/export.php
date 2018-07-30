<?php  
//export.php  
$connect = mysqli_connect("localhost", "root", "", "test");
$output = '';
if(isset($_POST["export"]))
{
 $query = "SELECT * FROM users";
 $result = mysqli_query($connect, $query);
 if(mysqli_num_rows($result) > 0)
 {
  $output .= '
   <table  border="2">  
                    <thead>  
					    <th>Id</th>
                         <th>Name</th>  
                         <th>age</th>  
                         <th>email</th>  
       
                    </tr>
  ';
  while($row = mysqli_fetch_array($result))
  {
   $output .= '
    <tr>  
	                   <td>'.$row["id"].'</td>
                         <td>'.$row["name"].'</td>  
                         <td>'.$row["age"].'</td>  
                         <td>'.$row["email"].'</td>  
         
       
                    </tr>
   ';
  }
  $output .= '</table>';
  header('Content-Type: application/xls');
  header('Content-Disposition: attachment; filename=download.xls');
  echo $output;
 }
}
?>
