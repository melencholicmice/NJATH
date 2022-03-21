<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link href="navbar.css" type="text/css" rel="stylesheet" />
        <link href="register.css" type="text/css" rel="stylesheet" />
        <title>NJATH - Celesta 2k20 Login</title>
        <script language="JavaScript" src="js/gen_validatorv31.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="cl-effect-9">
            <a href="index.php" >
                <span>Login</span>
                <span>Start the Awesome</span>
            </a>
            <a href="http://celesta.tech/register-page" >
                <span>Celesta Register</span>
                <span>Click to register to Celesta</span>
            </a>
            <a href="leaderboard.php">
                <span>Leaderboard</span>
                <span>View the Leaderboard</span>
            </a>
            <a href="https://apps.facebook.com/forumforpages/464686653559952/a6c4f51a-85e8-4569-bf03-150921d00852/0">
                <span>Forum</span>
                <span>The Discussion Forum</span>
            </a>
            <a href="https://celesta.org.in">
                <span>Celesta 2k20</span>
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
            <a href="http://njath.org.in/tshirt.html">
                <span>Celesta T-shirt</span>
                <span>Click here to buy!!</span>
            </a>
        </nav>
        <div id="wrapper">
            <form id="register" action="./auth.php" method="POST" autocomplete="on">
                <h1> Celesta Login </h1> 
                    <!-- <p id="errorMsg" style="color: red; text-align: center">
                    </p> -->

                    <?php if (isset($err["component"])) {
                    ?>
                    <p id="error-msg">
                        <?php
                        echo $err["msg"];
                        ?>
                    </p>
                    <?php
                    }
                    ?>
                <p> 
                    <label for="email" class="uname" data-icon="u">Your Celesta Email</label>
                    <input id="email" name="email" required="required" type="email" placeholder="Enter Celesta Email"  />
                </p>
                <p> 
                    <label for="email" class="uname" data-icon="u">Your Celesta Password</label>
                    <input id="password" name="password" required="required" type="password" placeholder="Enter Celesta Password"  />
                </p>
                <p class="signin button"> 
                    <input type="submit" name="LoginSubmit" value="Login"/> 
                </p>
            </form>
        </div>

    </body>
</html>
