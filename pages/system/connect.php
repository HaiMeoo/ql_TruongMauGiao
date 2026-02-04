
<?php 
    $server = 'localhost';
    $user = 'root';
    $pass = '';
    $database ='ql_maugiaomvc';

    $conn= new mysqli($server,$user,$pass,$database);
    if($conn){
        mysqli_query($conn, " SET NAMES 'utf8' ");
    }else{
        echo "ket noi khong thnah coong";
    }

