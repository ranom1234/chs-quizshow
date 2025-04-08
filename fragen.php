<?php
    session_start();
    if(!$_SESSION["loggedin"]) {
        header("Location: login.php");
        exit();
    }
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Fragensuche</title>
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
          <a class="nav-link active <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="fragen.php">Fragen suchen</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="new_game.php">Neues Spiel generieren</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"] || $_SESSION["role"] != "1") {echo "invisible";}?>" href="Admin/index.php">Administration</a>
          <a class="nav-link active <?php if($_SESSION["loggedin"]) {echo "invisible";}?>" href="login.php">Login</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="logout.php">Logout</a>
        </div>
      </div>
    </div>
    </nav>
    
  <div class="container-overlay">
    <div class="alert alert-warning" role="alert">
    <i class="fa-solid fa-2x fa-triangle-exclamation"></i><br>
    Hier können Fragen nach ID gesucht werden, die Lösungen werden direkt mit angezeigt und markiert.
    </div>

    <h1>Fragensuche / Spielverwaltung</h1>

    <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="get">
      <div class="form-floating mb-3">
        <input type="number" class="form-control" id="floatingInput" name="id" required>
        <label for="floatingInput">FragenID</label>
        <input type="submit" class="btn btn-primary action-btn " style="margin-top: 1em;" value="Suchen">
      </div>
    </form>

    <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="post">
      <input type="submit" value="Aktive Frage anzeigen" class="btn btn-success action-btn " name="show_active"><br>
        <input type="submit" value="Frage beantwortet (Lösung im Stream anzeigen)" class="btn btn-danger action-btn <?php if($_SESSION["role"] != 1 && $_SESSION["role"] != 2) {echo "invisible";}?>" name="show_result"><br>
        <input type="submit" value="50/50 Joker" class="btn btn-dark action-btn <?php if($_SESSION["role"] != 1 && $_SESSION["role"] != 2) {echo "invisible";}?>" name="5050">
        <input type="submit" value="Telefon Joker" class="btn btn-dark action-btn <?php if($_SESSION["role"] != 1 && $_SESSION["role"] != 2) {echo "invisible";}?>" name="TJ">
        <input type="submit" value="Publikums Joker" class="btn btn-dark action-btn <?php if($_SESSION["role"] != 1 && $_SESSION["role"] != 2) {echo "invisible";}?>" name="PJ">
    </form>
    <a class="btn btn-warning action-btn <?php if($_SESSION["role"] != 1 && $_SESSION["role"] != 2) {echo "invisible";}?>" data-bs-toggle="modal" data-bs-target="#setactive">Aktive Frage setzen</a>
      <a class="btn btn-warning action-btn <?php if($_SESSION["role"] != 1 && $_SESSION["role"] != 2) {echo "invisible";}?>" data-bs-toggle="modal" data-bs-target="#setchosen">Gewählte Antwort setzen</a>

    
    <?php 
        if($_SERVER["REQUEST_METHOD"] == "GET" && !empty($_GET["id"])) {
            require_once("./Assets/Classes/Database.php");
            require_once("./Assets/Classes/GetQuizData.php");
            echo "<h2>Frage</h2>";
            $frage = new GetQuizData();
            $frage->showQuestion_specific($_GET["id"]);

            if($frage->rows == 0) {
                echo "Eine Frage mit dieser ID existiert nicht!";
            }

            else {
                foreach($frage->result as $r) {
                    echo '
                    <b>FragenID:</b> '. $r["fragenid"] .'<br>
                    <b>Thema:</b> '. $r["themenname"] .'<br>
                    <b>Schwierigkeit:</b> '. $r["schwierigkeitsname"] .'<br><br>

                    <b>Frage:</b> '. $r["frage"] .'<br>
                    <b>Antwort 1:</b> '. $r["antwort1"] .'<br>
                    <b>Antwort 2:</b> '. $r["antwort2"] .'<br>
                    <b>Antwort 3:</b> '. $r["antwort3"] .'<br>
                    <b>Antwort 4:</b> '. $r["antwort4"] .'<br><br>

                    <b style="color: red;">Richtige Antwort:</b> Antwort '. $r["antwortrichtig"] .'<br> 
                    <b>Gestellt:</b> '. $r["gestellt"] .' mal<br>
                    <b style="color: green;">Erklärung:</b> '. $r["erklaerung"] .'<br>                    
                    ';
                }

            }
        }

        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["show_active"])) {
          require_once("./Assets/Classes/Database.php");
          require_once("./Assets/Classes/GetQuizData.php");
          echo "<h2>Aktive Frage</h2>";
          $frage = new GetQuizData();
          $frage->showQuestion_active();

          if($frage->rows == 0) {
            echo "Keine Frage derzeit aktiv!";
          }

          else {
              foreach($frage->result as $r) {
                  echo '
                  <b>FragenID:</b> '. $r["fragenid"] .'<br>
                  <b>Thema:</b> '. $r["themenname"] .'<br>
                  <b>Schwierigkeit:</b> '. $r["schwierigkeitsname"] .'<br><br>

                  <b>Frage:</b> '. $r["frage"] .'<br>
                  <b>Antwort 1:</b> '. $r["antwort1"] .'<br>
                  <b>Antwort 2:</b> '. $r["antwort2"] .'<br>
                  <b>Antwort 3:</b> '. $r["antwort3"] .'<br>
                  <b>Antwort 4:</b> '. $r["antwort4"] .'<br><br>

                  <b style="color: red;">Richtige Antwort:</b> Antwort '. $r["antwortrichtig"] .'<br> 
                  <b>Gestellt:</b> '. $r["gestellt"] .' mal<br>                   
                  ';
              }

          }
        }

        //Richtige Antwort grün färben
        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["show_result"])) {
            require_once("./Assets/Classes/Database.php");
            require_once("./Assets/Classes/GetQuizData.php");
            $result = new GetQuizData();
            $result->makeResultPublic();
        }

        //50/50 Joker
        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["5050"])) {
            require_once("./Assets/Classes/Database.php");
            require_once("./Assets/Classes/GetQuizData.php");
            $result = new GetQuizData();
            $result->do5050();
        }

        //Publikums Joker
        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["PJ"])) {
            require_once("./Assets/Classes/Database.php");
            require_once("./Assets/Classes/GetQuizData.php");
            $result = new GetQuizData();
            $result->doJoker("PJ");
        }
        //Telefon Joker
        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["TJ"])) {
            require_once("./Assets/Classes/Database.php");
            require_once("./Assets/Classes/GetQuizData.php");
            $result = new GetQuizData();
            $result->doJoker("TJ");
        }

        
    
    ?>
    
  </div>




  <div class="modal fade" id="setactive" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Aktive Frage setzen</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <?php $allowed=true; include("set_question_inc.php");?>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Abbrechen</button>
        <input type="submit" name="set_question" class="btn btn-primary" value="Frage setzen"></form>
      </div>
    </div>
  </div>
</div>


  <div class="modal fade" id="setchosen" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h1 class="modal-title fs-5" id="staticBackdropLabel">Gewählte antwort setzen</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>

              <div class="modal-body">
                  <?php $allowed=true; include("set_answer_inc.php");?>
              </div>

              <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Abbrechen</button>
                  <input type="submit" name="set_chosen" class="btn btn-primary" value="Antwort setzen"></form>
              </div>
          </div>
      </div>
  </div>

  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>