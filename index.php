<?php
	// re?quire_once 'function.php';
	session_start();
	$_SESSION['name']="Buddy";
	// header("Location: https://celesta.org.in/njath/leaderboard.php");
	// die();
	if(!isset($_SESSION['userID']))
	{
		 header("Location: https://anwesha.info/backend/user/signin.php?fromNjath=NJATH");
		 die();
	}
	else
	{
		$id = $_SESSION['userID'];
		$_SESSION["uid"] = $_SESSION['userID'];
		include("dbcon.php");
// 		require './support/dbcon.php';
		$query = "SELECT * FROM `Contestants` WHERE `pid` = '$id'";
//  		echo $query;
		if($query = mysqli_fetch_array(mysqli_query($db_connection, $query)))
		{
			$user = $query["username"];
			$from = "homepage";
			require_once 'function.php';
			require './support/check.php';
		}
		else
		{
			header("Location: ./signupPage.php");
			die();
		}
	}
?>
