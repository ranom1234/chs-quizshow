<?php

class AddThema extends Database {
    private $thema;

    public function __construct($thema) {
        $this->thema = $thema;
    }

    public function AddThema() {
        $this->connectDB();
        $stmt = $this->connection->prepare("INSERT INTO `themen`(`themenname`) VALUES ('$this->thema')");
        $stmt->execute();
    }
}