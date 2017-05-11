<!-----------------------------

   RDB 2017
   Semestrální práce
   
   Author: Simon Skapik

------------------------------>

<?php
include './php/Database.php';

$DB = new MyDatabase();

var_dump($DB->TestGet());



?>

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>RDB 2017</title>
   
   <link type="text/css" rel="stylesheet" href="./css/custom.css" />
   
</head>

<body>
   <div id="all">

      <div class="page" id="header">
         <h1 class="txt-center">RDB 2017</h1>
      </div>
      
      <div class="toolbar" id="toolbar">
         <div class="page">
            <form method="post" action="">
               <label for="import_file">Import: </label><input type="file" name="import_file" />
               <input type="submit" name="btn_import" value="Import" />&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </form>
         </div>
      </div>
      
      <div class="page" id="content"></div>
      
      <div class="page" id="header"></div>
      
   </div>
</body>

</html>
