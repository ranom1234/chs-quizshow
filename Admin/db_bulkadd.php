<?php
//OUTDATED -> ÜBER ONLINE TOOL ADMINISTRATION AB JZ



/**
 * Bei $file bitte in die Anführungsstriche gestellt
 * den Dateinamen der CSV Tabelle mit den Fragen zum jeweiligen
 * Thema eintragen. Danach db_bulkadd.php im Browser aufrufen.
 * CSV File muss in der gegebenen Vorlage vorhanden sein.
 *
 * CSV-File in den Admin Order legen
 *
 */
$file = "FILENAME.CSV";
$handle = fopen($file, "r");






$content = explode(";", fgets($handle));
while (($content = fgetcsv($handle, 1000, ';', '"')) !== false) {
    require_once("../Assets/Classes/CONSTANTS.php");

    $con = mysqli_connect(HOST,USERNAME,PASSWORD, TABLE);
    $frage = $content[0];
    $thema = $content[1];
    $schw = $content[2];
    $a1 = $content[3];
    $a2 = $content[4];
    $a3 = $content[5];
    $a4 = $content[6];
    $ar = $content[7];
    $e = $content[8];
    $stmt = mysqli_query($con, "INSERT INTO `fragen`(`fragenid`, `frage`, `thema`, `schwierigkeit`, `antwort1`, `antwort2`, `antwort3`, `antwort4`, `antwortrichtig`, `gestellt`, `aktiv`, `erklaerung`) VALUES (NULL,'$frage','$thema','$schw','$a1','$a2','$a3','$a4','$ar',0,0, '$e')");
    echo "Frage: $frage hinzugefügt.<br>";
}

