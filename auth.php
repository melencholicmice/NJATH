<?php

session_start();

if(isset($_POST['LoginSubmit'])){

    // kvstore API url
    $url = 'https://celesta.tech/api/users/signin';

    // Collection object
    $user = array(
    'email' => $_POST['email'],
    'password' => $_POST['password']
    );

    // Initializes a new cURL session
    $curl = curl_init($url);

    // Set the CURLOPT_RETURNTRANSFER option to true
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

    // Set the CURLOPT_POST option to true for POST request
    curl_setopt($curl, CURLOPT_POST, true);

    // Set the request data as JSON using json_encode function
    curl_setopt($curl, CURLOPT_POSTFIELDS,  json_encode($user));

    // Set custom headers for RapidAPI Auth and Content-Type header
    curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

    // Execute cURL request with all previous settings
    $response = curl_exec($curl);

    // Close cURL session
    curl_close($curl);
    $result = json_decode($response);

    if(!isset($result)){
        $err["msg"] = "Please enter your Celesta credentials properly, they are wrong";
        $err["component"] = "Contestants";
    }

    if(isset($err)){
        require './apiAuth.php';
        die();
    }

    //print_r($response);

    $_SESSION['userID'] = $result->data->user->celestaId;

    header("Location: ./index.php");

}
?>