<?php

include("dbconnection.php");

if(isset($_POST["name"])){
    $name=$_POST["name"];
}
else return;

if(isset($_POST["number"])){
    $number=$_POST["number"];
}
else return;

$query = "UPDATE `demo_database` SET `number`='$number' WHERE `name`='$name'";

$exe = mysqli_query($conn,$query);
$arr = [];

if($exe){
    $arr["success"]=="true";
}else{
    $arr["success"] == "false";
}

print(json_encode($arr));

?>