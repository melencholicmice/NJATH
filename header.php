<ul class="nav nav-pills nav-fill">
            <?php if (isset($_SESSION["username"])) { ?>
                <li class="nav-item">
                    <a class="nav-link active" href="./profile.php">Questions</a>
                </li>
            <?php } else { ?>
                <li class="nav-item">
                    <a class="nav-link" href="https://celesta.org.in/backend/user/login.php">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://celesta.org.in/backend/user/register.php">Register</a>
                </li>
            <?php } ?>
            <li class="nav-item">
                <a class="nav-link" href="rules.php">Rules</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://www.facebook.com/iit.njath/app/202980683107053/">Forum</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../index.php">Celesta </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="www.iitp.ac.in">IIT Patna</a>
            </li>
        </ul>