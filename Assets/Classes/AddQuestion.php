<?php

class AddQuestion extends Database{
    private $frage;
    private $thema;
    private $hardness;
    private $a1;
    private $a2;
    private $a3;
    private $a4;
    private $ar;
    private $e;

    public function __construct($frage, $thema, $hardness, $a1, $a2, $a3, $a4, $ar, $e) {
        $this->frage = $frage;
        $this->thema = $thema;
        $this->hardness = $hardness;
        $this->a1 = $a1;
        $this->a2 = $a2;
        $this->a3 = $a3;
        $this->a4 = $a4;
        $this->ar = $ar;
        $this->e = $e;
    }

    public function AddFrage() {
        ob_start();
        $this->connectDB();
        $stmt = $this->connection->prepare("INSERT INTO `fragen`(`frage`, `thema`, `schwierigkeit`, `antwort1`, `antwort2`, `antwort3`, `antwort4`, `antwortrichtig`, `gestellt`, `erklaerung`) VALUES (:q,'$this->thema','$this->hardness','$this->a1','$this->a2','$this->a3','$this->a4','$this->ar',0, :e)");
        $stmt->bindParam(":q", $this->frage, PDO::PARAM_STR_CHAR);
        $stmt->bindParam(":e", $this->e, PDO::PARAM_STR_CHAR);
        $stmt->execute();

        $stmt = null;
        $this->connection = null;
        header("Location: ../Admin/manage_questions.php");
        exit();
    }
}