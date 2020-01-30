<?php
session_start();
    require_once "./support/dbcon.php";
    $pid=$_SESSION["uid"];
    $query = "SELECT * FROM `Contestants` WHERE `pid` = '$pid'";
    if($query = mysqli_fetch_array(mysqli_query($db_connection, $query)) || !isset($_SESSION["uid"]))
    {
         header("Location: ./accessdenied");
         die();
    }
    header("Location: https://celesta.org.in/njath/leaderboard.php");
	die();
?>
<!DOCTYPE HTML>
<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        
        <link href="navbar.css" type="text/css" rel="stylesheet" />
        <link href="register.css" type="text/css" rel="stylesheet" />
        <title>NJATH - Celesta 2k19 Registration</title>
        <script language="JavaScript" src="js/gen_validatorv31.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="cl-effect-9">
            <a href="index.php" >
                <span>Login</span>
                <span>Start the Awesome</span>
            </a>
            <a href="leaderboard.php">
                <span>Leaderboard</span>
                <span>View the Leaderboard</span>
            </a>
            <a href="https://www.facebook.com/iit.njath/app/202980683107053/">
                <span>Forum</span>
                <span>The Discussion Forum</span>
            </a>
            <a href="https://celesta.org.in">
                <span>Celesta 2k19</span>
                <span>A Stellar Trek</span>
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
            <form id="register" action="register.php" method="POST" autocomplete="on">
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
                    <h1><?php echo "Hello ".$_SESSION["name"]." your Celesta id is ".$_SESSION["uid"]; ?></h1>
                <p class="signin button"> 
                    <input type="submit" value="Sign up"/> 
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
        <!--<script language='JavaScript' type='text/javascript'>
        function refreshCaptcha()
        {
            var img = document.images['captchaimg'];
            img.src = img.src.substring(0,img.src.lastIndexOf("?"))+"?rand="+Math.random()*1000;
        }
        </script>*/!-->
    </body>
</html>
