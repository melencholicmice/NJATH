<?php ob_start();
	session_start();
	require_once 'function.php';
	$_SESSION['name']="Buddy";
	// $_SESSION["userID"]="ANW2001";
	// header("Location: https://celesta.org.in/njath/leaderboard.php");
	// die();
	// $_SESSION["userID"]="ANW2000";
	if(!isset($_SESSION["userID"]))
	{
		
		 header("Location: ./apiAuth.php");
		//  die();
	}
	else
	{
		$id = $_SESSION['userID'];
		$_SESSION["uid"] = $_SESSION['userID'];
		echo("<script>console.log($id);</script>");
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
			header("Location: ./profile.php");
			die();
		}
	}
?>
