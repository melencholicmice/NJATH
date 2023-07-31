<?php
session_start();
    require_once "./support/dbcon.php";
    // $pid=$_SESSION["uid"];
    // $query = "SELECT * FROM `Contestants` WHERE `pid` = '$pid'";
    // if($query = mysqli_fetch_array(mysqli_query($db_connection, $query)) || !isset($_SESSION["uid"]))
    // {
    //      header("Location: ./accessdenied");
    //      die();
    // }
    // header("Location: https://celesta.org.in/njath/leaderboard.php");
	// die();
    // echo("<script>console.log('ready');</script>");    
    if(isset($_POST['signUp'])){
            $username = $_POST['usernamesignup'];
            $celestaId = $_POST['celestaId'];
            $password = $_POST['password'];
            $hash = sha1($password);
            // include './support/dbcon.php';
            global $db_connection;
            $db_connection =  mysqli_connect('localhost','celesta','L1iQrAMSv!qXyEGg#','celesta');
            if(! $db_connection){
                die("Sorry we failed to connect: ". mysqli_connect_error());
            }
            // echo("<script>console.log('$username , $celestaId , $password');</script>");
            $disq = 0;
            $sql = "INSERT INTO `Contestants` (`username`, `pId`, `password`, `Disqualified`) VALUES ('$username', '$celestaId', '$hash', '$disq')";
            // $sql = "INSERT INTO `participant` (`Serial Number`,`InfId`, `Name`, `Email`,`Password`, `College`, `ID`, `Phone Number`, `Gender`, `dt`) VALUES (NULL, '$infid' , '$name', '$email', '$hash', '$clg', '$clgid', '$phno', '$gen', current_timestamp())";
            
            $result = mysqli_query($db_connection, $sql);
            if($result){
                require './apiAuth.php';
                die();
            }
            else{
               $err['component'] = 'comp';
               $err['msg']='Registration failed , please try again with different username';
             }
        }

?>
<!DOCTYPE HTML>
<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        
        <link href="navbar.css" type="text/css" rel="stylesheet" />
        <link href="register.css" type="text/css" rel="stylesheet" />
        <title>NJATH - Celesta 2k23 Registration</title>
        <script language="JavaScript" src="js/gen_validatorv31.js" type="text/javascript"></script>
    </head>
<!--
    <body>
        <nav class="cl-effect-9">
            <a href="apiAuth.php" >
                <span>Login</span>
                <span>Start the Awesome</span>
            </a>
            <a href="leaderboard.php">
                <span>Leaderboard</span>
                <span>View the Leaderboard</span>
            </a>
            <a href="https://celesta.iitp.ac.in/">
                <span>Celesta 2k23</span>
                <span>Into the Cyberverse</span>
            </a>
            <a href="http://www.iitp.ac.in">
                <span>IIT Patna</span>
                <span>All about our college</span>
            </a>
            <a href="rules.php">
                <span>Rules</span>
                <span>The law of the Land!!!</span>
            </a>
            
        </nav>
        <div id="wrapper">
            <form id="register" action="" method="POST" autocomplete="on">
                <h1> Sign up </h1> 
                <?php if (isset($error["component"])) {
                    ?>
                    <p id="error-msg">
                        <?php
                        echo $error["msg"];
                        ?>
                    </p>
                    <?php
                }
                ?>
                <p> 
                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                    <input id="usernamesignup" name="usernamesignup" required="required" 
                           type="text" placeholder="eg. thejoker69" 
                           value="<?php if (isset($error["component"]) && $error["component"] != "username") echo $_POST["usernamesignup"]; ?>"
                           class="<?php if (isset($error["component"]) && $error["component"] == "username") echo 'error-component'; ?>"/>
                    <label for="celestaId">Celesta Id</label>
                           <input id="celestaId" name="celestaId" type="text" required>
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password">
                     <h1><?php echo "Hello ".$_SESSION["name"]." your Celesta id is ".$_SESSION["uid"]; ?></h1> 
                <p class="signin button"> 
                    <input type="submit" value="Sign up" name="signUp"/> 
                </p>
                <p class="change_link">Already a member ?<a href="index.php" class="to_register"> Go and log in </a>
                </p>
            </form>
        </div>
        <?php
        if (isset($success) && $success) {
            ?>
            <div id="done-display">
                <div>
                    <h2> Registration SUCCESSFUL!! </h2>
                    <p>  Click <a href="rules.php">here</a> to continue. </p>
                </div>
            </div>
            <?php
        }
        ?>
        <script language='JavaScript' type='text/javascript'>
        function refreshCaptcha()
        {
            var img = document.images['captchaimg'];
            img.src = img.src.substring(0,img.src.lastIndexOf("?"))+"?rand="+Math.random()*1000;
        }
        </script>
    </body>
-->
	<body>
		<h1> NJATH will be back next year </h1>
	</body>

</html>
