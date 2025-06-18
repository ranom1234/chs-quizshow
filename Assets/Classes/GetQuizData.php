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


        ///ICH DREH DURCH
        /// FRAGT MICH NICHT WIESO DAS EIN MEHRDIMENSIONALES ARRAY WIRD....
        $stmt = $this->connection->prepare("SELECT * FROM `fragen` WHERE `fragenid` = $id LIMIT 1");
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $handle = fopen("frage.txt", "w");
        fwrite($handle, "".$result[0]["frage"].";A: " .$result[0]["antwort1"].";B: " .$result[0]["antwort2"].";C: " .$result[0]["antwort3"].";D: " .$result[0]["antwort4"].";".$result[0]["antwortrichtig"].";false;0;/");
        fclose($handle);
    }

    public function makeResultPublic() {
        $handle = fopen("frage.txt", "r");
        $content = fgets($handle);
        $content_array = explode(";", $content);
        fclose($handle);

        $handle = fopen("frage.txt", "w");
        $content_array[6] = "true";
        $content = implode(";", $content_array);
        fwrite($handle, $content);
        fclose($handle);
    }

    public function do5050() {
        $handle = fopen("frage.txt", "r");
        $content = fgets($handle);
        $content_array = explode(";", $content);
        fclose($handle);
        $correct = $content_array[5];

        $count = 0;
        //Checken ob bereits 2 leer sind
        for ($i = 1; $i <=4; $i++) {
            if($content_array[$i] == "---") {
                $count++;
            }
        }
        if($count >= 2) {
            exit();
        }

        //2 Optionen die falsch sind löschen
        for($i = 0; $i <= 1; $i++) {
            $delete = $correct;
            while($delete == $correct || $content_array[$delete] == "---") {
                $delete = rand(1,4);
            }
            $content_array[$delete] = "---";
        }

        $handle = fopen("frage.txt", "w");
        $content_array[8] = "50";
        $content = implode(";", $content_array);
        fwrite($handle, $content);
        fclose($handle);
    }

    public function doJoker($joker) {
        $handle = fopen("frage.txt", "r");
        $content = fgets($handle);
        $content_array = explode(";", $content);
        fclose($handle);

        $handle = fopen("frage.txt", "w");
        $content_array[8] = $joker;
        $content = implode(";", $content_array);
        fwrite($handle, $content);
        fclose($handle);
    }

    public function setAnswer_active($id) {
        $handle = fopen("frage.txt", "r");
        $content = fgets($handle);
        $content_array = explode(";", $content);
        fclose($handle);

        $handle = fopen("frage.txt", "w");
        $content_array[7] = $id;
        $content = implode(";", $content_array);
        fwrite($handle, $content);
        fclose($handle);
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