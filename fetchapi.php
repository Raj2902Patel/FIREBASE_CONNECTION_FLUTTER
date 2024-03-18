<?php
header('Content-Type: application/json');
include('dbconnection.php');

 $response = array();
 
 $checkQuery = "SELECT `name`, `number` FROM `demotable`"; // change here.
 $result = mysqli_query($conn,$checkQuery);
 $numrow = mysqli_num_rows($result);
 
 if($result->num_rows == 0)
 {
$response["error"] = TRUE;
$response["message"] = "Sorry no data found.";
echo json_encode($response);
exit;
 }
 else
 {
 

$data = array();

for($i=1;$i<=$numrow;$i++)
{
while($val = mysqli_fetch_assoc($result))
{

$details['name'] = $val['name'];
$details['number'] = $val['number'];

array_push($data,$details);

}
}
$response["smoke"] = $data; // change in response name.
$response["error"] = FALSE;
$response["message"] = "Successfully data Found.";
echo json_encode($response);
exit;
 }
 
?>