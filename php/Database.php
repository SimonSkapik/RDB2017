<?php
class MyDatabase{
   
   private $dsn = 'sqlsrv:Server=SAUCEPAN-NTB; Database=RDB2017; MultipleActiveResultSets=true';
   private $user = 'Simon';
   private $password = '436827';

   private $db;
    
   function __construct() {
      try {
         $this->db = new PDO($this->dsn, $this->user, $this->password);
      } catch (PDOException $e) {
         echo 'Connection failed: ' . $e->getMessage();
      }
   }
   
   function fetchAll($query){
      $prep = $this->db->prepare($query);
      $prep->execute();
      return $prep->fetchAll();
   }
    
   function TestGet(){
      return $this->fetchAll('SELECT id,name FROM Users ORDER BY id');
   }
   
}