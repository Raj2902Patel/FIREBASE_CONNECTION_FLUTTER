<?php

    include("dbconnection.php");

    $query = "SELECT `name`, `number` FROM `demotable`";
    $exe = mysqli_query($conn,$query);

    $arr = [];

    while($row=mysqli_fetch_array($exe)){
        $arr[] = $row;
    }

    print(json_encode($arr));

?>