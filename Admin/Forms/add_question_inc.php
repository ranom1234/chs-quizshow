<?php
ob_start();
require_once("../Assets/Classes/Database.php");
require_once("../Assets/Classes/CheckData.php");
require_once("../Assets/Classes/GetQuizData.php");
require_once("../Assets/Classes/AddQuestion.php");

if($_SESSION["role"] == "1" && $allowed) {

  if(isset($_POST["add_question"])) {
    
    $newquestion = new AddQuestion($_POST["frage"], $_POST["thema"], $_POST["hardness"], $_POST["a1"], $_POST["a2"], $_POST["a3"], $_POST["a4"], $_POST["ar"], $_POST["e"]);
    $newquestion->AddFrage();
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
    <title>CHS Quizshow | Frage hinzufügen | INC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    
  <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="post">
      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="frage" required>
        <label for="floatingInput">Frage</label>
      </div>

      <div class="form-floating">
        <select class="form-select" aria-label="Thema" name="thema">
          <?php 
            $themen = new GetQuizData();
            $themen->showThemes_Form();
          ?>
        </select>
        <label for="floatingPassword">Thema</label>
      </div>

      <div class="form-floating">
        <select class="form-select" aria-label="Schwierigkeit" name="hardness">
          <option value="1">Leicht</option>
          <option value="2">Etwas schwer</option>
          <option value="3">Mittelschwer</option>
          <option value="4">Schwer</option>
        </select>
        <label for="floatingPassword">Richtige Antwort</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="a1" required>
        <label for="floatingInput">Antwort 1</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="a2" required>
        <label for="floatingInput">Antwort 2</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="a3" required>
        <label for="floatingInput">Antwort 3</label>
      </div>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="a4" required>
        <label for="floatingInput">Antwort 4</label>
      </div>

      <div class="form-floating">
        <select class="form-select" aria-label="Richtige Antwort" name="ar">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
        </select>
        <label for="floatingPassword">Richtige Antwort</label>
      </div>

      <div class="form-floating mb-3">
          <textarea class="form-control" id="floatingInput" name="e" required></textarea>
          <label for="floatingInput">Erklärung</label>
      </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>