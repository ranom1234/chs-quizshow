<?php

class Adduser extends Database {
    private $username;
    private $password;
    private $role;
    private $password_hash;

    public function __construct($username, $password, $role) {
        $this->username = $username;
        $this->password_hash = password_hash($password, PASSWORD_DEFAULT);
        $this->role = $role;
    }

    public function InsertUser() {
        $this->connectDB();
        
        $sql = "INSERT INTO `users`(`username`, `password`, `role`) VALUES (:u, :pw, :r)";
        $stmt = $this->connection->prepare($sql);
        $stmt->bindParam(":u", $this->username, PDO::PARAM_STR);
        $stmt->bindParam(":pw", $this->password_hash, PDO::PARAM_STR);
        $stmt->bindParam(":r", $this->role, PDO::PARAM_STR);
        $stmt->execute();

        return true;
    }
}