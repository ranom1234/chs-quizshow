<?php
require_once("./Assets/Classes/KillSession.php");

    $logout = new KillSession();
    $logout->killSession_all();
    header("Location: login.php");
    exit();