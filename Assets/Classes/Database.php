<?php
require_once("CONSTANTS.php");

class Database {
    private $host = HOST;
    private $table = TABLE;
    private $username = USERNAME;
    private $password = PASSWORD;
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