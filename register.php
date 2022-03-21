<?php
//header('Location: http://njath.anwesha.info/closed.html');
$from = "registerpage";
 ini_set("display_errors"   , 1);
require_once 'function.php';
// header("Location: https://celesta.org.in/njath/leaderboard.php");
// die();
if($_SERVER['REQUEST_METHOD'] == 'POST')
{

    check();
    // var_dump($CONST); die();
    if (isset($error)) {
        require 'signupPage.php';
        die();
    }
    // global $db_connection;
    // require './support/dbcon.php';
    // $db_connection = mysqli_connect("localhost", $db_username, $db_password, "anwesha_njath");
    session_start();
    // include("dbcon.php");
    global $db_connection;
    $db_connection =  mysqli_connect('localhost','ankit','ankit.das','njath_celesta2020');
   // $db_connection = mysqli_connect('localhost','atm1504','11312113','njath');
    $user = $_POST["usernamesignup"];
    $anw = $_SESSION["uid"];
    // $anw = intval(substr($anw, 3));
    $hash = sha1($user);
    $cost = 10;
    $disq=0;
    $query = "INSERT INTO `Contestants` (`username`, `pId`, `password`, `Disqualified`) VALUES ('$user', '$anw', '$hash', '$disq')";
    // var_dump($query); die();

    $res=mysqli_query($db_connection,$query);
    if (!$res) {
        $error["msg"] = "username has been already registered.";
        $error["component"] = "Contestants";
    }
    echo mysqli_error($db_connection);
    if (isset($error)) {
        require 'signupPage.php';
        die();
    }

    $query = "INSERT INTO `ContestantsData`(`Username`) VALUES ('$user')";
    $res= mysqli_query($db_connection,$query);
    // $result = mysqli_fetch_assoc($res);
    if (!$res) {
        // var_dump($query . '  --  1'); die(); 
        $error["msg"] = "Some error Occurred";
        var_dump(mysqli_error($db_connection));
        $error["component"] = "ContestantsData";
    }
    if (isset($error)) {
        require 'signupPage.php';
        die();
    }
    /*
    *******change table name
    */
    $query = "CREATE TABLE `Questions-{$user}` ("
            . "`Question Number` varchar(2) NOT NULL, "
            . "`Question ID` varchar(3) NOT NULL, "
            . "`Hinted` int(11) DEFAULT '0', "
            . "`Time Opened` int(11) DEFAULT '-1', "
            . "`Time Answered` int(11) DEFAULT '-1', "
            . "`Obtained Score` int(11) NOT NULL DEFAULT '0', "
            . "`Attempts` int(11) DEFAULT '0', "
            . "PRIMARY KEY (`Question Number`), "
            . "UNIQUE KEY `Question Number` (`Question Number`), "
            . "UNIQUE KEY `Question ID` (`Question ID`))";
    $val = mysqli_query($db_connection, $query);

    if (!isset($CONST)) {

        $CONST["advance"] = 6;
        $CONST["njath-home"] = "njath.anwesha.info/";
        $query = "SELECT COUNT(DISTINCT SUBSTRING(`Question ID`,1,1)) AS `C` FROM `Questions`";
        $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
        $CONST["levels"] = $query["C"];
        $query = "SELECT COUNT(DISTINCT SUBSTRING(`Question ID`,2,1)) AS `C` FROM `Questions`";
        $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
        $CONST["questions"] = $query["C"];
        $query = "SELECT COUNT(DISTINCT SUBSTRING(`Question ID`,3,1)) AS `C` FROM `Questions`";
        $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
        $CONST["buffer"] = $query["C"];

    }

    // var_dump($CONST); die();

    $query = "SELECT * FROM `ContestantsData` WHERE `username` = '{$user}'";
    $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
    $_SESSION["username"] = $user;
    $_SESSION["level"] = $query["Level"];
    $_SESSION["question"] = "";
    $_SESSION["level-score"] = $query["Level Score"];
    $_SESSION["total-score"] = $query["Total Score"];
    $_SESSION["increase"] = array();
    $_SESSION["prev-salt"] = "";
    $_SESSION["salt"] = "";
    $query = "SELECT COUNT(*) FROM `Questions-$user` AS `Q-U` "
            . "WHERE `Q-U`.`Question Number` LIKE '" . $_SESSION["level"]  . "_' "
            .       "AND `Q-U`.`Time Answered` != '-1'";
    $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
    $_SESSION["advance-level"] = intval($query["COUNT(*)"]) >= $CONST["advance"];

    // var_dump($CONST); die('1');
    $buffer_size = $CONST["buffer"];
    $set = (strlen($user)%3)+1;
    for ($l = 1; $l <= $CONST["levels"]; $l++) {
        for ($q = 1; $q <= $CONST["questions"]; $q++) {
            
            $query = "INSERT INTO `Questions-{$user}` (`Question Number`, `Question ID`) "
                    . "VALUES ('{$l}{$q}', '{$l}{$q}{$set}');";
            mysqli_query($db_connection, $query);
        }
    }
    mysqli_close($db_connection);
    $success = true;
    require 'profile.php';
} else {
    require 'signupPage.php';
}
?>
