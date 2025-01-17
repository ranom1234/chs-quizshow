<?php

class EstablishSession extends Database{
    private $username;

    public function __construct($username) {
        $this->username = $username;
    }

    public function EstablishLogin() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `users` JOIN `roles` WHERE `username` = :u AND `role`=`roleid`");
        $stmt->bindParam(":u", $this->username, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        session_start();
        $_SESSION["loggedin"] = true;
        $_SESSION["uid"] = $result["uid"];
        $_SESSION["username"] = $result["username"];
        $_SESSION["role"] = $result["role"];
        $_SESSION["rolename"] = $result["rolename"];
    }
}