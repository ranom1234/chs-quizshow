<?php
  require_once("../Assets/Classes/Database.php");
  require_once("../Assets/Classes/CheckData.php");
  require_once("../Assets/Classes/Adduser.php");

  if(!$allowed) {
    header("Location: ../index.php");
    exit();
  }

  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $checkdata = new CheckData($_POST["username"], $_POST["password"], $_POST["password_confirm"]);
    if ($checkdata->CheckAddUserData()) {
      $adduser = new AddUser($_POST["username"], $_POST["password"], $_POST["role"]);
      $adduser->InsertUser();

      header("Location: ../Admin/users.php");
      exit();
    }
  }
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Add user INC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    
    <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="post">
      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="floatingInput" name="username">
        <label for="floatingInput">Benutzername</label>
      </div>

      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" name="password">
        <label for="floatingPassword">Passwort</label>
      </div>

      <div class="form-floating">
        <input type="password" class="form-control" id="floatingPassword" name="password_confirm">
        <label for="floatingPassword">Passwort Bestätigen</label>
      </div>

      <div class="form-floating">
        <select class="form-select" aria-label="Role" name="role">
          <option value="1">Administrator</option>
          <option value="2">Streaming</option>
          <option value="3" selected>Moderator</option>
        </select>
        <label for="floatingPassword">Rolle</label>
      </div>

  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>