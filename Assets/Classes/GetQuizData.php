<?php

class GetQuizData extends Database {
    public $result;
    public $rows;


    public $fragenids_all;
    public $themen;
    public $kat1q;
    public $kat2q;
    public $kat3q;
    public $kat4q;


    public function showThemes() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `themen` WHERE 1");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach($result as $r) {
            echo '<tr>
            <td>'. $r["themenid"] .'</td> 
            <td>'. $r["themenname"] .'</td>
            <td><a href="../Admin/manage_themes.php?action=delete&id='. $r["themenid"].'" class="btn btn-danger">Thema löschen</a></td>           
            </tr>';
        }
    }

    public function showThemes_Form() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `themen` WHERE 1 ORDER BY `themenid` DESC");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach($result as $r) {
            echo '<option value="'. $r["themenid"] .'">'. $r["themenname"] .'</option>';
        }
    }
    public function showThemeSpecific($id) {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT `themenname` FROM `themen` WHERE `themenid` = $id");
        $stmt->execute();
        $result1 = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach($result1 as $r) {
            $this->result = array($r["themenname"]);
        }
    }

    public function deleteTheme($id) {
        $this->connectDB();
        $stmt = $this->connection->prepare("DELETE FROM `themen` WHERE `themenid` = '$id'");
        $stmt->execute();
    }


    public function showQuestions() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `fragen` WHERE 1 ORDER BY `fragenid` DESC LIMIT 5");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach($result as $r) {
            echo '<tr>
            <td>'. $r["fragenid"] .'</td> 
            <td>'. $r["frage"] .'</td>
            <td>'. $r["gestellt"] .'</td>
            <td><a href="../Admin/manage_questions.php?action=delete&id='. $r["fragenid"].'" class="btn btn-danger">Frage löschen</a></td>           
            </tr>';
        }
    }

    public function showQuestion_specific($id) {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `themen` JOIN `fragen`, `schwierigkeiten` WHERE `themenid`=`thema` AND `schwierigkeitsid`=`schwierigkeit` AND `fragenid`=$id");
        $stmt->execute();
        $this->rows = $stmt->rowCount();
        $this->result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function showQuestion_active() {
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT * FROM `themen` JOIN `fragen`, `schwierigkeiten` WHERE `themenid`=`thema` AND `schwierigkeitsid`=`schwierigkeit` AND `aktiv`=1");
        $stmt->execute();
        $this->rows = $stmt->rowCount();
        $this->result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function setQuestion_active($id) {
        $this->connectDB();
        $stmt = $this->connection->prepare("UPDATE `fragen` SET `aktiv`=0 WHERE 1");
        $stmt->execute();

        $stmt = $this->connection->prepare("UPDATE `fragen` SET `aktiv`=1 WHERE `fragenid` = $id");
        $stmt->execute();
    }

    public function deleteQuestion($id) {
        $this->connectDB();
        $stmt = $this->connection->prepare("DELETE FROM `fragen` WHERE `fragenid` = '$id'");
        $stmt->execute();
    }


    public function generateGame() {
        //Themen generieren
        #Datenbank abfrage
        $this->connectDB();
        $stmt = $this->connection->prepare("SELECT `thema` FROM `fragen` WHERE `gestellt` = 0 ORDER BY rand() LIMIT 1");
        $stmt->execute();
        $thema1n = $stmt->fetchColumn();

        $stmt = $this->connection->prepare("SELECT `thema` FROM `fragen` WHERE `gestellt` = 0 AND `thema` != $thema1n ORDER BY rand() LIMIT 1");
        $stmt->execute();
        $thema2n = $stmt->fetchColumn();

        $stmt = $this->connection->prepare("SELECT `thema` FROM `fragen` WHERE `gestellt` = 0 AND `thema` != $thema1n AND `thema` != $thema2n ORDER BY rand() LIMIT 1");
        $stmt->execute();
        $thema3n = $stmt->fetchColumn();

        $stmt = $this->connection->prepare("SELECT `thema` FROM `fragen` WHERE `gestellt` = 0 AND `thema` != $thema1n AND `thema` != $thema2n AND `thema` != $thema3n ORDER BY rand() LIMIT 1");
        $stmt->execute();
        $thema4n = $stmt->fetchColumn();

        #Array zuweisen
        $stmt = $this->connection->prepare("SELECT `themenname` FROM `themen` WHERE `themenid` = $thema1n");
        $stmt->execute();
        $this->themen[1] = $stmt->fetchColumn();

        $stmt = $this->connection->prepare("SELECT `themenname` FROM `themen` WHERE `themenid` = $thema2n");
        $stmt->execute();
        $this->themen[2] = $stmt->fetchColumn();

        $stmt = $this->connection->prepare("SELECT `themenname` FROM `themen` WHERE `themenid` = $thema3n");
        $stmt->execute();
        $this->themen[3] = $stmt->fetchColumn();

        $stmt = $this->connection->prepare("SELECT `themenname` FROM `themen` WHERE `themenid` = $thema4n");
        $stmt->execute();
        $this->themen[4] = $stmt->fetchColumn();



        //Thema 1 Fragen
        for($i = 1; $i<5; $i++) {
            $stmt = $this->connection->prepare("SELECT `fragenid` FROM `fragen` WHERE `thema` = $thema1n AND `schwierigkeit` = $i AND `gestellt` = 0 ORDER BY rand() LIMIT 1");
            $stmt->execute();
            $this->kat1q[$i] = $stmt->fetchColumn();
            $this->fragenids_all[] = $this->kat1q[$i];

            $stmt = $this->connection->prepare("UPDATE `fragen` SET `gestellt`=1 WHERE `fragenid` = :id");
            $stmt->bindParam(":id", $this->kat1q[$i], PDO::PARAM_INT);
            $stmt->execute();
        }

        //Thema 2 Fragen
        for($i = 1; $i<5; $i++) {
            $stmt = $this->connection->prepare("SELECT `fragenid` FROM `fragen` WHERE `thema` = $thema2n AND `schwierigkeit` = $i AND `gestellt` = 0 ORDER BY rand() LIMIT 1");
            $stmt->execute();
            $this->kat2q[$i] = $stmt->fetchColumn();
            $this->fragenids_all[] = $this->kat2q[$i];

            $stmt = $this->connection->prepare("UPDATE `fragen` SET `gestellt`=1 WHERE `fragenid` = :id");
            $stmt->bindParam(":id", $this->kat2q[$i], PDO::PARAM_INT);
            $stmt->execute();
        }

        //Thema 3 Fragen
        for($i = 1; $i<5; $i++) {
            $stmt = $this->connection->prepare("SELECT `fragenid` FROM `fragen` WHERE `thema` = $thema3n AND `schwierigkeit` = $i AND `gestellt` = 0 ORDER BY rand() LIMIT 1");
            $stmt->execute();
            $this->kat3q[$i] = $stmt->fetchColumn();
            $this->fragenids_all[] = $this->kat3q[$i];

            $stmt = $this->connection->prepare("UPDATE `fragen` SET `gestellt`=1 WHERE `fragenid` = :id");
            $stmt->bindParam(":id", $this->kat3q[$i], PDO::PARAM_INT);
            $stmt->execute();
        }

        //Thema 4 Fragen
        for($i = 1; $i<5; $i++) {
            $stmt = $this->connection->prepare("SELECT `fragenid` FROM `fragen` WHERE `thema` = $thema4n AND `schwierigkeit` = $i AND `gestellt` = 0 ORDER BY rand() LIMIT 1");
            $stmt->execute();
            $this->kat4q[$i] = $stmt->fetchColumn();
            $this->fragenids_all[] = $this->kat4q[$i];

            $stmt = $this->connection->prepare("UPDATE `fragen` SET `gestellt`=1 WHERE `fragenid` = :id");
            $stmt->bindParam(":id", $this->kat4q[$i], PDO::PARAM_INT);
            $stmt->execute();
        }
    }
}