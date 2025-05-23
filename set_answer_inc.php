<?php
require_once("./Assets/Classes/Database.php");
require_once("./Assets/Classes/GetQuizData.php");

if($allowed) {

  if(isset($_POST["set_chosen"])) {
    $setquestion = new GetQuizData();
    $setquestion->setAnswer_active($_POST["id"]);
  }
}

else {
    header("Location: ./index.php");
    exit();
}
?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CHS Quizshow | Aktive Antwort setzen | INC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    
  <form action="<?php echo $_SERVER["PHP_SELF"];?>" method="post">
      <div class="form-floating mb-3">
        <input type="number" class="form-control" id="floatingInput" name="id" min="1" max="4" required>
        <label for="floatingInput">Antwort 1-4 (1=A, 2=B, 3=C, 4=D)</label>
      </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>