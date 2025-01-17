<?php
    session_start();
    if(!$_SESSION["loggedin"] || $_SESSION["role"] != "1") {
        header("Location: ../login.php");
        exit();
    }
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Administration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="../Assets/CSS/styles.css" type="text/css" rel="stylesheet">
  </head>
  <body>

  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.php">CHS Quizshow Administration</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav" style="text-align: right;">
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" aria-current="page" href="../index.php">Home</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="../fragen.php">Fragen suchen</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="../new_game.php">Neues Spiel generieren</a>
          <a class="nav-link active <?php if(!$_SESSION["loggedin"] && !$_SESSION["role"] == "1") {echo "invisible";}?>" href="index.php">Administration</a>
          <a class="nav-link active <?php if($_SESSION["loggedin"]) {echo "invisible";}?>" href="../login.php">Login</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="../logout.php">Logout</a>
        </div>
      </div>
    </div>
    </nav>
    
  <div class="container-overlay">
    <div class="alert alert-danger" role="alert">
    Aktionen die hier getätigt werden, können nicht rückgängig gemacht werden, bitte bestätige zweimal, ob deine Aktion die richtige ist.
    </div>

    <h1>Willkommen im <span style="color: red">Administrationsbereich</span> der CHS-Quizshow</h1>

    <h2>Aktionen</h2>
    <a href="manage_themes.php" class="btn btn-success action-btn <?php if($_SESSION["role"] != "1") {echo "disabled";}?>">Themen verwalten</a><br>
    <a href="manage_questions.php" class="btn btn-warning action-btn <?php if($_SESSION["role"] != "1") {echo "disabled";}?>">Fragen verwalten</a><br>
    <a href="users.php" class="btn btn-danger action-btn <?php if($_SESSION["role"] != "1") {echo "disabled";}?>">Benutzer verwalten</a><br>

  </div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>