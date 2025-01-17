<?php
    session_start();
    if(!$_SESSION["loggedin"]) {
        header("Location: login.php");
        exit();
    }

    require_once("./Assets/Classes/Database.php");
    require_once("./Assets/Classes/GetQuizData.php");
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        $spiel = new GetQuizData();
        $spiel->generateGame();
    }
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Neues Spiel generieren</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="./Assets/CSS/styles.css" type="text/css" rel="stylesheet">
    <link href="./Assets/CSS/all.css" rel="stylesheet">
  </head>
  <body>

  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.php">CHS Quizshow Backend</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav" style="text-align: right;">
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" aria-current="page" href="index.php">Home</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="fragen.php">Fragen suchen</a>
          <a class="nav-link active <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="new_game.php">Neues Spiel generieren</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"] || $_SESSION["role"] != "1") {echo "invisible";}?>" href="Admin/index.php">Administration</a>
          <a class="nav-link active <?php if($_SESSION["loggedin"]) {echo "invisible";}?>" href="login.php">Login</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="logout.php">Logout</a>
        </div>
      </div>
    </div>
    </nav>
    
  <div class="container-overlay">
    <?php if($_SESSION["role"] == 3) {die("Keine Berechtigung");}?>
    <div class="alert alert-danger <?php if(isset($_POST["generate"])) {echo "invisible";}?>" role="alert">
    <i class="fa-solid fa-2x fa-triangle-exclamation"></i><br>
    Achtung, du bist dabei ein neues Spiel zu generieren. Wenn du ein neues Spiel generierst, werden alle Fragen die gewählt wurden als gestellt markiert und können kein zweites mal gestellt werden.<br>
    Bitte bestätige, dass du wirklich ein neues Spiel generieren möchtest
    </div>
    <form action="<?php echo $_SERVER["HTML_SELF"]?>" method="post" class="<?php if(isset($_POST["generate"])) {echo "invisible";}?>">
        <input type="submit" class="btn btn-success" style="margin-top: 0.5em; padding: 2em 6em 2em 6em;" value="Spiel starten" name="generate">
    </form>
    <?php if(!isset($_POST["generate"])) {die();}?>




    <h1>Neues Spiel</h1>
    <div class="container text-center" style="margin-top: 2em;">
        <div class="row align-items-start" style="margin-top: 1em;">
            <div class="col-6 sub-container">
                <div class="sub-container-inner" style="border: 3px red solid;">
                    <h2>Themen</h2>
                    <?php
                        foreach($spiel->themen as $t) {
                            echo "<b>Kategorie:</b> ". $t ."<br>";
                        }
                    ?>
                </div>
            </div>

            <div class="col-6 sub-container">
                <div class="sub-container-inner" style="border: 3px green solid;">
                    <h2>Generierte FragenIDs</h2>
                    <?php
                        foreach($spiel->fragenids_all as $q) {
                            echo $q ."; ";
                        }
                    ?>
                </div>
            </div>
        </div>


        <div class="row align-items-start" style="margin-top: 1em;">
            <div class="col-3 sub-container">
                <div class="sub-container-inner" style="border: 3px orange solid;">
                    <h2>Fragen Kategorie 1</h2>
                    <?php
                        foreach($spiel->kat1q as $q) {
                            echo '<b>FragenID: </b>' .$q .' <a href="./fragen.php?id='. $q .'" target="_blank"> Frage anzeigen</a><br>';
                        }
                    ?>
                </div>
            </div>

            <div class="col-3 sub-container">
                <div class="sub-container-inner" style="border: 3px orange solid;">
                    <h2>Fragen Kategorie 2</h2>
                    <?php
                        foreach($spiel->kat2q as $q) {
                            echo '<b>FragenID: </b>' .$q .' <a href="./fragen.php?id='. $q .'" target="_blank"> Frage anzeigen</a><br>';
                        }
                    ?>
                </div>
            </div>

            <div class="col-3 sub-container">
                <div class="sub-container-inner" style="border: 3px orange solid;">
                    <h2>Fragen Kategorie 3</h2>
                    <?php
                        foreach($spiel->kat3q as $q) {
                            echo '<b>FragenID: </b>' .$q .' <a href="./fragen.php?id='. $q .'" target="_blank"> Frage anzeigen</a><br>';
                        }
                    ?>
                </div>
            </div>

            <div class="col-3 sub-container">
                <div class="sub-container-inner" style="border: 3px orange solid;">
                    <h2>Fragen Kategorie 4</h2>
                    <?php
                        foreach($spiel->kat4q as $q) {
                            echo '<b>FragenID: </b>' .$q .' <a href="./fragen.php?id='. $q .'" target="_blank"> Frage anzeigen</a><br>';
                        }
                    ?>
                </div>
            </div>
        </div>
    </div>
    
  </div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>