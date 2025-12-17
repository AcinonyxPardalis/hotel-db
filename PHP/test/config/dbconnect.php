<?php
    $conn = mysqli_connect('localhost', 'root', 'D1@v@sm@', 'myproject');
    if(!$conn){
        echo 'connection error:' . mysqli_connect_error();
    }
?>