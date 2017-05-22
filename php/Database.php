<?php
/*********************************
*
*   Custom Database Class
*   Function wrapper for PDO
*
*   Author: Simon Skapik
*
**********************************/


class MyDatabase{
   
   
   private $dsn = 'sqlsrv:Server=PAVEL-PC\MSSQLSERVER2; Database=RDB2017_v2; MultipleActiveResultSets=true';
   private $user = 'User';
   private $password = 'user123';
   /*
   private $dsn = 'sqlsrv:Server=SAUCEPAN-NTB; Database=RDB2017_v2; MultipleActiveResultSets=true';
   private $user = 'Simon';
   private $password = '436827';*/
   private $MM;

   private $db;
    
   public function __construct($msgMnrg) {
      $this->MM = $msgMnrg;
      try {
         $this->db = new PDO($this->dsn, $this->user, $this->password);
      } catch (PDOException $e) {
         $this->MM->addMessage(new Message(Message::APLICATION_ERROR, "Unable to cennect to database."));
      }
   }
   
   private function FetchAll($query){
      $prep = $this->db->prepare($query);
      $prep->execute();
      return $prep->fetchAll();
   }
   
   private function laptopExists($laptop_id){
      $prep = $this->db->prepare("SELECT id_ltp FROM laptops WHERE id_ltp = '$laptop_id'");
      $prep->execute();
      $imported = $prep->fetch();
   
      if ($imported) {
         return true;
      }
      return false;
   }
    
   public function TestGet(){
      return $this->FetchAll('SELECT id,name FROM Users ORDER BY id');
   }
   
   public function FileAlreadyImported($fileHash){
      $prep = $this->db->prepare("SELECT import_date FROM imported WHERE file_hash = '$fileHash'");
      $prep->execute();
      $imported = $prep->fetch();

      if ($imported) {
         return $imported['import_date'];
      }
      return -1;
   }
   
   public function ImportData($data){
      // Data order:
      // name                 0     S    
      // uhlopricka           1     S
      // rozliseni            2     S
      // rozliseni_oznaceni   3     S
      // cpu                  4     S
      // pocet_jader          5     I
      // ram_typ              6     S
      // ram_speed            7     S
      // ram_cap              8     I
      // os                   9     S
      // hdd_cap              10    I
      // hdd_type             11    S
      // gpu                  12    S
      // barva                13    S
      // height               14    F
      // width                15    F
      // depth                16    F
      // weight               17    F
      $len = count($data);
      $query = "";
      for($i = 0; $i < $len; $i++){
         /*if(!$this->laptopExists($data[$i][0])){
            $prep = $this->db->prepare("INSERT INTO laptops(id_ltp, has_part_error, has_pair_error, has_duplicity_error) VALUES('".$data[$i][0]."',0,0,0)");
            $prep->execute();
         }*/
         //$len2 = 18;//count($data[$i]);
         $query .= "INSERT INTO laptops (name, screen, screen_f, resolution, resolution_f, resolution_name, resolution_name_f,
                     cpu, cpu_f, cores, cores_f, ram_type, ram_type_f, ram_speed, ram_speed_f,
                     ram_cap, ram_cap_f, os, os_f, hdd_cap, hdd_cap_f, hdd_type, hdd_type_f, gpu, gpu_f, color, color_f,
                     high, high_f, wide, wide_f, deep, deep_f, weight, weight_f,
                     has_part_error, has_pair_error, has_duplicity_error)";
         $query .= "VALUES  ('".$data[$i][0] . "','".$data[$i][1] . "',000,'".$data[$i][2] . "',000,'".$data[$i][3] . "',000,
                     '".$data[$i][4] . "',000,".$data[$i][5] . ",000,'".$data[$i][6] . "',000,'".$data[$i][7] . "',000,
                     ".$data[$i][8] . ",000,'".$data[$i][9] . "',000,".$data[$i][10] . ",000,'".$data[$i][11] . "',000,'".$data[$i][12] . "',000,'".$data[$i][13] . "',000,
                     ".$data[$i][14] . ",000,".$data[$i][15] . ",000,".$data[$i][16] . ",000,".$data[$i][17] . ",000,
                     0,0,0);";
         //echo $query;
         //$query = "";
         /*for($j = 1; $j < $len2; $j++){
            $query .= "INSERT INTO laptops (name) VALUES  ('".$data[$i][0]."');";
         /*}*/
         
      }
      //echo $query;
      $prep = $this->db->prepare($query);
      $prep->execute();
      return true;
   }
   
   public function getMemoryValues(){
      return $this->FetchAll('SELECT DISTINCT ram_cap FROM laptops WHERE ram_cap IS NOT NULL');
   }
   
   public function getCpuValues(){
      return $this->FetchAll('SELECT name FROM parts WHERE id_param = 4 ORDER BY name ASC');
   }
   
   public function getResolutionValues(){
      return $this->FetchAll('
	  SELECT sec.name AS "res_name", main.name AS "part_name", main.id_part AS "part_id", p.id_part_ref AS "res_id" FROM parts AS "main"
			INNER JOIN pairs AS "p" ON main.id_part = p.id_part_val
			INNER JOIN parts AS "sec" ON sec.id_part = p.id_part_ref
			WHERE main.id_param = 3');
   }

   public function getAll(){
      return $this->FetchAll('SELECT * FROM laptops');
   }
   
   public function getFiltered($filters){
      echo 'SELECT * FROM laptops WHERE ' . $filters;
	  return $this->FetchAll('SELECT * FROM laptops WHERE ' . $filters);
   }
}

