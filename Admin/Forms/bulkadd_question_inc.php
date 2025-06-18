<?php
ob_start();
require_once("../Assets/Classes/Database.php");
require_once("../Assets/Classes/CheckData.php");
require_once("../Assets/Classes/GetQuizData.php");
require_once("../Assets/Classes/AddQuestion.php");

if($_SESSION["role"] == "1" && $allowed) {

  if(isset($_POST["bulkadd_question"])) {
      if (isset($_FILES['csvfile']) && $_FILES['csvfile']['error'] === 0) {
          $tmpPath = $_FILES['csvfile']['tmp_name'];
          require_once("../Assets/Classes/CONSTANTS.php");
          $con = mysqli_connect(HOST, USERNAME, PASSWORD, TABLE);
          if (!$con) {
              die("Datenbank tot 💀");
          }

          $handle = fopen($tmpPath, "r");
          if ($handle !== false) {
              // Header skippen
              fgetcsv($handle, 1000, ';', '"');

              while (($content = fgetcsv($handle, 1000, ';', '"')) !== false) {
                  // Optional: Daten validieren/trimmen
                  $frage = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[0]), 'UTF-8', 'ISO-8859-1'));
                  $thema = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[1]), 'UTF-8', 'ISO-8859-1'));
                  $schw = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[2]), 'UTF-8', 'ISO-8859-1'));
                  $a1 = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[3]), 'UTF-8', 'ISO-8859-1'));
                  $a2 = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[4]), 'UTF-8', 'ISO-8859-1'));
                  $a3 = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[5]), 'UTF-8', 'ISO-8859-1'));
                  $a4 = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[6]), 'UTF-8', 'ISO-8859-1'));
                  $ar = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[7]), 'UTF-8', 'ISO-8859-1'));
                  $e = mysqli_real_escape_string($con, mb_convert_encoding(trim($content[8]), 'UTF-8', 'ISO-8859-1'));

                  $stmt = mysqli_query($con, "INSERT INTO `fragen`(`fragenid`, `frage`, `thema`, `schwierigkeit`, `antwort1`, `antwort2`, `antwort3`, `antwort4`, `antwortrichtig`, `gestellt`, `aktiv`, `erklaerung`) VALUES (NULL,'$frage','$thema','$schw','$a1','$a2','$a3','$a4','$ar',0,0,'$e')");
              }
              fclose($handle);
              echo "✅ Import fertig!";
          } else {
              echo "💥 Datei konnte nicht geöffnet werden.";
          }
      }
  }
}

else {
    header("Location: ../index.php");
    exit();
}
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Frage massenhinzufügen | INC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    
  <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="post" enctype="multipart/form-data">
      NUR CSV FILES<br>
      <input type="file" name="csvfile" id="file" accept=".csv,text/csv" required>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>