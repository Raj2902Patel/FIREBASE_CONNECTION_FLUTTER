<?php

include("dbconnection.php");

    if(isset($_POST['name']))
    {
        $name = $_POST['name'];
    }
    else return;

$query = "DELETE FROM `demo_database` WHERE name='$name'";

$exe = mysqli_query($conn,$query);
$arr = [];

if($exe)
{
    $arr["success"] = "true";
}
else
{
    $arr["success"] = "flase";
}

print(json_encode($arr));

?>
