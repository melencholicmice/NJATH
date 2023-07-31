<?php
/*
 * Copyright (C) 2015 Sunny Narayan
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

//header('Location: http://njath.anwesha.info/closed.html');
$from = "questionpage";
require_once 'function.php';
require_once './support/check.php';
require_once 'dbcon.php';
// header("Location: https://celesta.org.in/njath/leaderboard.php");
// die();
function check_answer($ans) {
    $quesFor = $_SESSION["question"];
    $browserOfuser = NULL;

    global $db_connection;
    global $CONST;

    $query = "SELECT `Q`.*,`Q-U`.* FROM `Questions` AS `Q` "
            . "LEFT JOIN `Questions-{$_SESSION["username"]}` AS `Q-U` ON `Q`.`Question ID` = `Q-U`.`Question ID` "
            . "LEFT JOIN `QuestionSolves` AS `S` ON `Q`.`Question ID` = `S`.`Question ID` "
            . "WHERE `Q`.`Question ID` = '{$_SESSION["question"]}'";
    $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
/////////////////////////
    if ($query["Time Answered"] != "-1") {
        $_SESSION["question"] = "";
        mysqli_close($db_connection);
        header("Location: ./profile.php");
        die();
    }
////////////////////////////////
    $query["Attempts"] ++;

    $query["Check Answer"] = $query["Answer Regular"];
    $query["Check Answer"] = preg_replace("/[^a-zA-Z0-9]/", "", $query["Check Answer"]);
    $query["Check Answer"] = strtolower($query["Check Answer"]);

    if (!filter_var($ans, FILTER_VALIDATE_REGEXP, array("options" => array('regexp' => '/^[a-z0-9]+$/')))) {
        return "Ooops! Wrong Answer! Keep Trying...";
    }

    if ($query["Check Answer"] != $ans) {
        $result = "UPDATE `Questions-{$_SESSION["username"]}` "
                . "SET `Attempts` = '{$query["Attempts"]}' "
                . "WHERE `Question ID` = '{$_SESSION["question"]}' ";
        mysqli_query($db_connection, $result);
        return "Ooops! Wrong Answer! Keep Trying...";
    }

    $timeAnsw = intval((time() + 59) / 60);

    $incr = intval($CONST["question-score"]);
        push_increase("Question Answered", $incr);

    if ($_SESSION["advance-level"]) {
    	push_increase("Bonus Question", $CONST["bonus-quest"]);
            $incr += $CONST["bonus-quest"];
    }

    sync_scores();

    $result = "UPDATE `Questions-{$_SESSION["username"]}` "
            . "SET `Time Answered`='{$timeAnsw}', `Obtained Score`='{$incr}', `Attempts`='{$query["Attempts"]}' "
            . "WHERE `Question ID` = '{$_SESSION["question"]}';";
    mysqli_query($db_connection, $result);

    $query = "SELECT COUNT(*) FROM `Questions-{$_SESSION["username"]}` AS `Q-U` "
            . "WHERE `Q-U`.`Question Number` LIKE '{$_SESSION["level"]}_'"
            . "AND `Q-U`.`Time Answered` != '-1' ";

    $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
    if (intval($query["COUNT(*)"]) >= $CONST["advance"]) {
        $_SESSION["advance-level"] = TRUE;
    }

    $query = "SELECT * FROM `QuestionSolves` AS `Q-U` "
            . "WHERE `Q-U`.`Question ID` = '{$_SESSION["question"]}'";

    $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
    $query["Solves"] ++;

    if ($query["First Solve"] == -1) {
        $query["First Solve"] = $timeAnsw;
    }

    $result = "UPDATE `QuestionSolves` "
            . "SET `Solves` = '{$query["Solves"]}', `First Solve`='{$query["First Solve"]}' "
            . "WHERE `Question ID` = '{$_SESSION["question"]}';";
    mysqli_query($db_connection, $result);
    $_SESSION["question"] = "";
    mysqli_close($db_connection);
    header("Location: ./profile.php");
    die();
}
function get_hint($hint)
{
    global $db_connection;
    $query = "SELECT `Q`.*,`Q-U`.* FROM `Questions` AS `Q` "
            . "LEFT JOIN `Questions-{$_SESSION["username"]}` AS `Q-U` ON `Q`.`Question ID` = `Q-U`.`Question ID` "
            . "LEFT JOIN `QuestionSolves` AS `S` ON `Q`.`Question ID` = `S`.`Question ID` "
            . "WHERE `Q`.`Question ID` = '{$_SESSION["question"]}'";
    $query = mysqli_fetch_array(mysqli_query($db_connection, $query));
    $hint = $query["Hint"];
    if($query["Hinted"]==1)
    {
        return $hint;
    }
    else
    {
        $increase=1;
        $result = "UPDATE `Questions-{$_SESSION["username"]}` "
            . "SET  `Hinted`='{$increase}' "
            . "WHERE `Question ID` = '{$_SESSION["question"]}';";
        mysqli_query($db_connection, $result);
        if( $_SESSION["total-score"]>=5)
        {
            $_SESSION["total-score"]-=5;
        }
        else
        {
            $hint = "Insufficient score to unlock hint.";
        }
        return $hint;
    }
}
function check_question() {
    global $_POST;
    if (isset($_POST["answer"])) {
        return check_answer($_POST["answer"]);
    } else if(isset($_POST["hint"])){
        return get_hint($_POST["hint"]);
    }else {
        return NULL;
    }
}

$wrong_msg = check_question();
unset($_POST);

$query = "SELECT * FROM `Questions` AS `Q` "
        . "LEFT JOIN `Questions-{$_SESSION["username"]}` AS `Q-U` ON `Q-U`.`Question ID`=`Q`.`Question ID` "
        . "WHERE `Q`.`Question ID` = '{$_SESSION["question"]}';";
$question = mysqli_fetch_array(mysqli_query($db_connection, $query));

?>

<!-- Here is another hint for question: 43 . 58 42, 15 . 23 01 -->
<!DOCTYPE html>
<html>
    <head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        
        <title>Question | NJATH</title>
        <link href="question.css" rel="stylesheet" type="text/css" />
        <link href="navbar.css" rel="stylesheet" type="text/css" />
            <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-151382188-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-151382188-1');
  </script>
  
    </head>

    <body>

        <nav class="cl-effect-9">
            <a href="./profile.php">
                <span>Profile</span>
                <span>Your homepage</span>
            </a>
	    <a href="https://chat.whatsapp.com/Kipm325IF01LXS1gSbJpNY">
		<span>Forum</span>
		<span>Join the discussion</span>
	   </a>
            <a href="./rules.php">
                <span>Rules</span>
                <span>The law of the Land!!!</span>
            </a>
            <a href="./leaderboard.php" >
                <span>Leaderboard</span>
                <span>View the Leaderboard</span>
            </a>
	    

            <a href="https://celesta.iitp.ac.in">
                <span>Celesta 2k23</span>
                <span>Chrysalis Dawn</span>
            </a>
            <a href="./logout.php">
                <span>Logout</span>
                <span>Out of your wits? Why give up so early?</span>
            </a>
        </nav>


        <div id="user-info">
            <h2 id="user"><?php echo($_SESSION['username']); ?></h2>
            <h2 id="level"><?php echo substr_replace($question["Question Number"], ".", 1, 0); ?></h2>
        </div>

        <div id="question-div" class="<?php
        
        switch ($question["Type"]) {
            case 1: echo "question-text";
                break;
            case 2: echo "question-image";
                break;
            case 3: echo "question-both";
                break;
        }
        ?>">
            <?php if ((intval($question["Type"]) & 1) == 1) { ?>
                <div id="question-text">
                    <h2><?php
                        if (startsWith($_SESSION["question"], "73")) {
                            echo "Download the file to solve the question";
                        } else {
                            echo $question["Question Text"];
                        }
                        ?></h2>
                    <?php
                    if (startsWith($_SESSION["question"], "73")) {
                        ?>
                        <a href="./images/q_win32.exe">Windows 32bit</a>
                        <a href="./images/q_win64.exe">Windows 64bit</a>
                        <a href="./images/q_lin32">Linux 32bit</a>
                        <a href="./images/q_lin64">Linux 64bit</a>
                        <?php
                    }
                    ?>
                </div>
                <?php
            }
            if ((intval($question["Type"]) & 2) == 2) {
                // if (!check_tchest(2)) {
            		?>
            	
             <img src="<?php echo $question["Question Picture"]; ?>"/>
            <?php
                }
            ?>
        </div>


        <div id="form-wrapper">

            <form method="POST" onkeypress="return event.keyCode != 13;" id="form-answer" action="question.php">
                <?php if (startsWith($_SESSION["question"], "71")) { ?>
                    <script language="javascript">
                        function unecape(string) {
                            string = "% 23 ^ 13 % 56(0x34, 0x37, 0x38, 0x41, 0x42)";
                            string = "+char+" == "+pass+" + " " ? string + pass : string;
                            char = document.getElementById("password").value;
                            return string;
                        }
                        function check() {
                            var userInput = document.getElementById("ans").value;
                            var pass = unescape('%34%32');
                            if (userInput == pass) {
                                document.getElementById('form-answer').submit();
                            } else {
                                alert("Wrong password.");
                            }
                        }
                    </script>
                    <input id="ans" name="answer" placeholder="Your answer here..." autocomplete="off"/>
                <?php } else if (startsWith($_SESSION["question"], "74")) {
                    ?>
                    <select name="answer" id="ans"  action="question.php">
                        <option value="1" selected>Pasty Cline</option>
                        <option value="2">Lauren Oliver</option>
                        <option value="3">Sehun</option>
                        <option value="4">Kai</option>
                    </select>
                <?php } else { ?>
                    <input id="ans" name="answer" placeholder="Your answer here..." autocomplete="off"/>
                <?php }
                ?>
                <a href='javascript:;' onclick="<?php
                if (startsWith($_SESSION["question"], "71")) {
                    echo "check();";
                } else {
                    echo "document.getElementById('form-answer').submit();";
               }
                ?>" id="submit-btn">
                    <span class="btn-text">Submit</span>
                    <span class="btn-expandable"><span class="btn-slide-text"><?php
                            $msg[0] = "Are you sure??";
                            $msg[1] = "May I lock it?";
                            $msg[2] = "Double check!!";
                            $msg[3] = "Easy, aint it?";
                            $msg[4] = "Very peculiar!";
                            $msg[5] = "Is that sweat?";
                            $idx = rand(0, 5);
                            echo $msg[$idx];
                            ?></span>
                        <span class="btn-icon-right"><span></span></span></span>
                </a>
            </form>
                <form method="POST" id="form-hint" action="question.php">
                    <input id="hint" type="hidden" name="hint" value="<?php echo $_SESSION["username"]; ?>"/>
                    <a href='javascript:;' onclick="document.getElementById('form-hint').submit();" id="submit-btn">
                        <span class="btn-text">Hint?</span>
                    <span class="btn-expandable">
                        <span class="btn-slide-text"><?php
                            $msg[0] = "Do you really want it?";
                            $msg[1] = "Are you sure you need hint?";
                            $msg[2] = "Double check!!";
                            $idx = rand(0, 3);
                            echo $msg[$idx];
                            ?></span>
                        <span class="btn-icon-right"><span></span></span>
                    </span>
                    </a>
                </form>
        </div>

        <?php
        // if (intval($question["Attempts"]) >= intval($CONST["tchest-tries"]) && !check_tchest(0)) {
        //     echo '<!-- ';
        //     echo "Try visiting " . $CONST["njath-home"] . "tchest.php?q=" . create_tchest_string(0, $_SESSION["salt"]);
        //     echo ' -->';
        // }
        ?>

        <?php
            if (intval($question["Hinted"]) == 1) {
                echo '<!-- ';
                echo " Hint: " . $question["Hint"];
                echo ' -->';
            }
        ?>


        <?php
        if (isset($wrong_msg)) {
            ?>

            <div id="complete-hide">
                <div id="message-display">
                    <h2>
                    <?php echo $wrong_msg; ?>
                    </h2>
                </div>
            </div>

            <?php
            unset($wrong_msg);
        }
        ?>

    </body>
</html>
