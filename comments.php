<?php

/*
 * Copyright (C) 2014 radsaggi(ashutosh)
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




$from = "leaderboard";
require_once 'function.php';
require './support/check.php';
require_once './support/dbcon.php';
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>NJATH - Celesta 2k23Leaderboard</title>
        <link href="leaderboard.css" rel="stylesheet" type="text/css" />
        <link href="navbar.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <nav class="cl-effect-9">
            <?php
            if (isset($_SESSION["username"])) {
                ?>
                <a href="./profile.php" >
                    <span>Questions</span>
                    <span>Continue the HUNT!</span>
                </a>
                <?php
            } else {
                ?>
                <a href="apiAuth.php" >
                    <span>Login</span>
                    <span>Start the Awesome</span>
                </a>
                
                <?php
            }
            ?>
            
            <a href="http://www.iitp.ac.in">
                <span>IIT Patna</span>
                <span>All about our college</span>
            </a>
            <a href="https://celesta.iitp.ac.in">
                <span>Celesta 2k23</span>
                <span>Chrysalis Dawn</span>
            </a>
            <a href="rules.php">
                <span>Rules</span>
                <span>The law of the Land!!!</span>
            </a>
            
        </nav>

    </body>
</html>
