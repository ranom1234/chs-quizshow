<?php
    session_start();
    if($_SESSION["loggedin"] == true) {header("Location: index.php"); exit();}

  require_once("./Assets/Classes/Database.php");
  require_once("./Assets/Classes/CheckData.php");
  require_once("./Assets/Classes/EstablishSession.php");

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $checkdata = new CheckData($_POST["username"], $_POST["password"], NULL);
    if ($checkdata->CheckLoginData()) {
        $login = new EstablishSession($_POST["username"]);
        $login->EstablishLogin();
        header("Location: index.php");
        exit();
    }
  }
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Login</title>
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
          <a class="nav-link <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="new_game.php">Neues Spiel generieren</a>
          <a class="nav-link <?php if(!$_SESSION["loggedin"] && !$_SESSION["role"] == "1") {echo "invisible";}?>" href="Admin/index.php">Administration</a>
          <a class="nav-link active <?php if($_SESSION["loggedin"]) {echo "invisible";}?>" href="login.php">Login</a>
          <a class="nav-link active <?php if(!$_SESSION["loggedin"]) {echo "invisible";}?>" href="logout.php">Logout</a>
        </div>
      </div>
    </div>
    </nav>
    
  <div class="login-container">
    <div class="alert alert-danger <?php if ($checkdata->error != "1") {echo "invisible";}?>" role="alert">
    <i class="fa-solid fa-2x fa-triangle-exclamation"></i><br>Bitte fülle alle Felder aus!
    </div>
    <div class="alert alert-danger <?php if ($checkdata->error != "4") {echo "invisible";}?>" role="alert">
    <i class="fa-solid fa-2x fa-triangle-exclamation"></i><br>Benutzername oder Passwort ist nicht korrekt!
    </div>


    <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="post">
      <div class="form-floating mb-3">
        <input type="text" class="form-control <?php if($checkdata->error == "1" || $checkdata->error == "4" ) {echo "is-invalid";}?>" id="floatingInput" name="username">
        <label for="floatingInput">Benutzername</label>
      </div>

      <div class="form-floating">
        <input type="password" class="form-control <?php if($checkdata->error == "1" || $checkdata->error == "4") {echo "is-invalid";}?>" id="floatingPassword" name="password">
        <label for="floatingPassword">Passwort</label>
      </div>

      <input type="submit" value="login" class="btn btn-primary btn-login">

    </form>
  </div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>