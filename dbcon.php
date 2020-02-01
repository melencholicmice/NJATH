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
$db_username = "root";
$db_password = "";
if (!isset($db_connection)) {

    if (!function_exists("db_disconnect")) {

        function db_disconnect() {
            if (isset($databaseMain)) {
                mysqli_close($databaseMain);
                unset($databaseMain);
            }
        }

    }

    global $db_connection;
    $db_connection = mysqli_connect('localhost','anwesgzc_anwesha','@nwesh@2K20','anwesgzc_njath');
    // $db_connection = mysqli_connect('localhost','atm1504','11312113','njath');
    // Check connection
    if (mysqli_connect_errno()) {
        throw new Exception("Failed to connect to MySQL: " . mysqli_connect_error());
        unset($db_connection);
    }
}
?>
