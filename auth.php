<?php

session_start();

if(isset($_POST['LoginSubmit'])){

    // // kvstore API url
    // $url = 'https://celesta.tech/api/users/signin';

    // // Collection object
    // $user = array(
    // 'email' => $_POST['email'],
    // 'password' => $_POST['password']
    // );

    // // Initializes a new cURL session
    // $curl = curl_init($url);

    // // Set the CURLOPT_RETURNTRANSFER option to true
    // curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

    // // Set the CURLOPT_POST option to true for POST request
    // curl_setopt($curl, CURLOPT_POST, true);

    // // Set the request data as JSON using json_encode function
    // curl_setopt($curl, CURLOPT_POSTFIELDS,  json_encode($user));

    // // Set custom headers for RapidAPI Auth and Content-Type header
    // curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

    // // Execute cURL request with all previous settings
    // $response = curl_exec($curl);

    // // Close cURL session
    // curl_close($curl);
    // $result = json_decode($response);

    $celestaId = $_POST['celestaId'];
    $password = $_POST['password'];
    $passHash = sha1($password);
    // $sql="SELECT * FROM `contestants` WHERE `pId`=$celestaId AND `password`=$passHash ";
    $sql = "SELECT * FROM Contestants WHERE pId = '$celestaId' AND Contestants.password = '$passHash'";

    

    global $db_connection;
    $db_connection =  mysqli_connect('localhost','celesta','L1iQrAMSv!qXyEGg#','celesta');
    $result = mysqli_query($db_connection, $sql);
    $row = mysqli_num_rows($result);
    if($row > 0){

        $_SESSION['userID'] = $celestaId;
        header("Location: ./index.php");
    }
    else{
        $err["msg"] = "Please enter your Celesta credentials properly, they are wrong";
        $err["component"] = "Contestants";
	
	require 'apiAuth.php';
        die();
    }

    if(isset($err)){
        require './apiAuth.php';
        die();
    }


    

}
?>
