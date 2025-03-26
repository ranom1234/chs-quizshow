<?php
    session_start();
    if(!$_SESSION["loggedin"] || $_SESSION["role"] != "1") {
        header("Location: ../login.php");
        exit();
    }

    require_once("../Assets/Classes/Database.php");
    require_once("../Assets/Classes/GetQuizData.php");


    if($_GET["action"] == "delete" && $_SESSION["role"] == "1") {
      $deleteactive = true;

      if(isset($_POST["delete_confirm"])) {
        $delete = new GetQuizData();
        $delete->deleteTheme($_GET["id"]);

        header("Location: ./manage_themes.php");
        exit();
      }
    }
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Administration » Themen verwalten</title>
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
    <h1>Themen Verwalten</h1>
    <a class="btn btn-primary action-btn" data-bs-toggle="modal" data-bs-target="#addthema">Thema hinzufügen</a>    
    <table class="table table-striped" style="margin-top: 2em;">
    <thead>
        <tr>
        <th scope="col">ID</th>
        <th scope="col">Thema</th>
        <th scope="col">Aktionen</th>
        </tr>
    </thead>

    <tbody>
        <?php
            $themen = new GetQuizData();
            $themen->showThemes();
        ?>
    </tbody>
    </table>

  </div>



  <div class="modal fade" id="addthema" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Thema hinzufügen</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        <?php $allowed=true; include("./Forms/add_thema_inc.php");?>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Abbrechen</button>
        <input type="submit" name="add_thema" class="btn btn-primary" value="Thema hinzufügen"></form>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="deletethema" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Thema löschen</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        Du bist dabei ein Thema zu löschen, willst du dies wirklich tun?
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Abbrechen</button>

        <form action="<?php echo $_SERVER["PHP_SELF"];?>?action=delete&id=<?php echo $_GET["id"];?>" method="post">
        <input type="submit" name="delete_confirm" class="btn btn-danger" value="Thema löschen"></form>
      </div>
    </div>
  </div>
</div>


<?php if($_GET["action"] == "delete") {
  echo "<script>var myModal = new bootstrap.Modal(document.getElementById('deletethema'), {})
myModal.toggle()</script>";
}?>




    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>