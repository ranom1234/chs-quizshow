<?php

class Database {
    private $host = "localhost";
    private $table = "quizshow";
    private $username = "username";
    private $password = "password";
    protected $connection;

    protected function connectDB() {
        try {
            $this->connection = new PDO("mysql:host=$this->host;dbname=$this->table", $this->username, $this->password);
        }
        catch (PDOException $e) {
            die("Database error");
        }
    }
}