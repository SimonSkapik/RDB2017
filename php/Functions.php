<?php
/*********************************
*
*   Main application backend logic
*
*   Author: Simon Skapik
*
**********************************/

// Message management
include './php/MessageManager.php';
$MM = new MessageManager();

// Databace connection
include './php/Database.php';
$DB = new MyDatabase($MM);
//var_dump($DB->TestGet());

// Data parsers
include './php/DataParsers.php';

// Product classes
include './php/Products.php';


function import_file($importFile){
   global $MM;
   global $DB;
   $parser;
   
   // File type check
   $FileType = pathinfo($importFile["name"],PATHINFO_EXTENSION);
   if(strtolower($FileType) == "csv"){
      $parser = new CSVParser();
   }else if(strtolower($FileType) == "json"){
      $parser = new JSONParser();
   }else if(strtolower($FileType) == "xml"){
      $parser = new XMLParser();
   }else{
      $MM->addMessage(new Message(Message::FILE_ERROR, "Unsupported file format."));
      return false;
   }

   // File hash check
   $fileHash = md5_file($importFile["tmp_name"]);
   if(!$fileHash){
      $MM->addMessage(new Message(Message::FILE_ERROR, "Creating file hash failed."));
      return false;
   }
   
   $importCheck = $DB->FileAlreadyImported($fileHash);
   if($importCheck > 0){
      $MM->addMessage(new Message(Message::INFO, "File already Imported on " . $importCheck));
      return false;
   }
   
   // Read file data
   $data = $parser->GetData($importFile["tmp_name"]);
   if($data == false){
      $MM->addMessage(new Message(Message::FILE_ERROR, "Unable to read data from file."));
      return false;
   }
   
   // File import
   $importResult = $DB->ImportData($data);
   if($importResult){
      $MM->addMessage(new Message(Message::SUCCESS, "File Successfuly imported."));
      $DB->SaveFileHash($fileHash);
      return false;
   }else{
      return false;
   }
   
   return true;
}

function getFilterState($filter){
   switch($filter){
      case "chck_state_ok":{
         if(isset($_GET['chck_state_ok'])){
            if($_GET['chck_state_ok']){
               return true;
            }else{
               return false;
            }
         }else{
            return false;
         }
      }break;
      case "chck_state_part":{
         if(isset($_GET['chck_state_part'])){
            if($_GET['chck_state_part']){
               return true;
            }else{
               return false;
            }
         }else{
            return false;
         }
      }break;
      case "chck_state_pair":{
         if(isset($_GET['chck_state_pair'])){
            if($_GET['chck_state_pair']){
               return true;
            }else{
               return false;
            }
         }else{
            return false;
         }
      }break;
      case "chck_state_duplicity":{
         if(isset($_GET['chck_state_duplicity'])){
            if($_GET['chck_state_duplicity']){
               return true;
            }else{
               return false;
            }
         }else{
            return false;
         }
      }break;
	  case "chck_ram_opt":{
         if(isset($_GET['chck_ram_opt'])){
            return $_GET['chck_ram_opt'];
         }else{
            return 'no';
         }
      }break;
	  case "chck_ram_val":{
         if(isset($_GET['chck_ram_val'])){
            return $_GET['chck_ram_val'];
         }else{
            return 'no';
         }
      }break;
	  case "chck_cpu":{
         if(isset($_GET['chck_cpu'])){
            return urldecode($_GET['chck_cpu']);
         }else{
            return 'no';
         }
      }break;
	  case "chck_res":{
         if(isset($_GET['chck_res'])){
            return urldecode($_GET['chck_res']);
         }else{
            return 'no';
         }
      }break;
	  case "chck_dim":{
         if(isset($_GET['chck_dim'])){
            return $_GET['chck_dim'];
         }else{
            return 'no';
         }
      }break;
	  case "chck_height":{
         if(isset($_GET['chck_height'])){
            return $_GET['chck_height'];
         }else{
            return false;
         }
      }break;
	  case "chck_width":{
         if(isset($_GET['chck_width'])){
            return $_GET['chck_width'];
         }else{
            return false;
         }
      }break;
	  case "chck_depth":{
         if(isset($_GET['chck_depth'])){
            return $_GET['chck_depth'];
         }else{
            return false;
         }
      }break;
	  case "chck_weight_from":{
         if(isset($_GET['chck_weight_from'])){
            return $_GET['chck_weight_from'];
         }else{
            return false;
         }
      }break;
	  case "chck_weight_to":{
         if(isset($_GET['chck_weight_to'])){
            return $_GET['chck_weight_to'];
         }else{
            return false;
         }
      }break;
   }
}

function assembleFilter(){
   $filter = "name IN (SELECT DISTINCT name FROM laptops WHERE ((";
   $filterList  = array();
   $is_ok = false;
   if(isset($_GET['chck_state_ok'])){
      $filter .= '(name NOT IN (SELECT DISTINCT name FROM laptops WHERE (has_part_error = 1 OR has_pair_error = 1 OR has_duplicity_error = 1)))';
      $is_ok = true;
   }
   
   if(isset($_GET['chck_state_part'])){
      array_push($filterList,'has_part_error = 1');
   }
   if(isset($_GET['chck_state_pair'])){
      array_push($filterList,'has_pair_error = 1');
   }
   if(isset($_GET['chck_state_duplicity'])){
      array_push($filterList,'has_duplicity_error = 1');
   }
   
   if(count($filterList) > 0){
      if($is_ok){
        $filter .= " OR ";
      }
      $filter .= '(name IN (SELECT DISTINCT name FROM laptops WHERE ';
      $filter .= '(' . implode(' OR ', $filterList) . ')))';
   }
   $filter .= ')';
   $filterList = array($filter);
   
   // filter by RAM
   if(isset($_GET['chck_ram_opt']) && isset($_GET['chck_ram_val']) && !($_GET['chck_ram_opt'] == 'no' || $_GET['chck_ram_val'] == 'no')){
	  $fltr = "(ram_cap ";
	  switch($_GET['chck_ram_opt']){
		 case "lt":{
			 $fltr .= "< ";
		 }break;
		 case "gt":{
			 $fltr .= "> ";
		 }break;
		 case "le":{
			 $fltr .= "<= ";
		 }break;
		 case "gt":{
			 $fltr .= ">= ";
		 }break;
		 case "eq":{
			 $fltr .= "= ";
		 }break;
	  }
	  $fltr .= $_GET['chck_ram_val'] . ')';
	  array_push($filterList, $fltr);
   }
   
   // filter by CPU
   if(isset($_GET['chck_cpu']) && $_GET['chck_cpu'] != 'no'){
	  array_push($filterList,"cpu = '" . urldecode($_GET["chck_cpu"] . "'"));
   }
   
   // filter by resolution
   if(isset($_GET['chck_res']) && $_GET['chck_res'] != 'no'){	  
	  array_push($filterList,"resolution = '" . urldecode($_GET["chck_res"] . "'"));
   }
   
   // filter by dimensions
   if(isset($_GET['chck_height']) && isset($_GET['chck_width']) && isset($_GET['chck_depth']) && isset($_GET['chck_dim']) && $_GET['chck_dim'] != 'no'){
	  $s = "";
	  if($_GET['chck_dim'] == "lt")
	     $s = "< ";
	  else
		 $s = "> ";
	  
	  $farr = array();
	  if($_GET['chck_height'] != ""){
		  array_push($farr, "(high " . $s . $_GET['chck_height'] . ")");
	  }
	  if($_GET['chck_width'] != ""){
		  array_push($farr, "(wide " . $s . $_GET['chck_width'] . ")");
	  }
	  if($_GET['chck_depth'] != ""){
		  array_push($farr, "(deep " . $s . $_GET['chck_depth'] . ")");
	  }
	  $fltr = '(' . implode(' AND ', $farr) . ')';
	  array_push($filterList, $fltr);
   }
   
   // filter by weight
   if(isset($_GET['chck_weight_from']) && isset($_GET['chck_weight_to']) && !($_GET['chck_weight_from'] == '' || $_GET['chck_weight_to'] == '')){
	  array_push($filterList, '(weight BETWEEN ' . $_GET['chck_weight_from'] .  " AND " . $_GET['chck_weight_to'] . ")");
   }
  
  
  
   $filter = implode(' AND ', $filterList) . '))';
   
   return $filter;
}

function dataToHTML($data){
   $code = '<table class="styled" cellspacing="0" cellpadding="3"><thead>
   <tr>
      <th>Name</th>
      <th>Screen</th>
      <th>Res.</th>
      <th>Res.</th>
      <th>CPU</th>
      <th>Cores</th>
      <th>RAM type</th>
      <th>RAM Speed</th>
      <th>RAM Cap.</th>
      <th>OS</th>
      <th>HDD Type</th>
      <th>HDD Cap.</th>
      <th>GPU</th>
      <th>Color</th>
      <th>Height</th>
      <th>Width</th>
      <th>Depth</th>
      <th>Weight</th>
   </tr>
   </thead><tbody>';

   foreach($data as $ltp){
      $code .= $ltp->ToHTML();
   }
   $code .= "</tbody></table>";
   return $code;
}

$products;

function loadData(){
   //global $data;
   global $products;
   global $DB;
   
   if(isset($_GET['btn_filter'])){
      $data = $DB->getFiltered(assembleFilter());
      $DB->insertFilter();
   }else{
      $data = $DB->getAll();
   }


   $last = "";
   $ind = -1;
   $products = array();
   foreach($data as $ltp){
      if($last != $ltp['name']){
         $ind++;
         $products[$ind] = new Laptop($ltp['name']);
         $products[$ind]->addData(array($ltp['has_part_error'],$ltp['has_pair_error'],$ltp['has_duplicity_error']),
                                 array($ltp['screen'], $ltp['resolution'], $ltp['resolution_name'], $ltp['cpu'], $ltp['cores'], $ltp['ram_type'], $ltp['ram_speed'], $ltp['ram_cap'], $ltp['os'], $ltp['hdd_type'], $ltp['hdd_cap'], $ltp['gpu'], $ltp['color'], $ltp['high'], $ltp['wide'], $ltp['deep'], $ltp['weight']),
                                 array($ltp['screen_f'], $ltp['resolution_f'], $ltp['resolution_name_f'], $ltp['cpu_f'], $ltp['cores_f'], $ltp['ram_type_f'], $ltp['ram_speed_f'], $ltp['ram_cap_f'], $ltp['os_f'], $ltp['hdd_type_f'], $ltp['hdd_cap_f'], $ltp['gpu_f'], $ltp['color_f'], $ltp['high_f'], $ltp['wide_f'], $ltp['deep_f'], $ltp['weight_f']));
         $last = $ltp['name'];
      }else{
         $products[$ind]->addData(array($ltp['has_part_error'],$ltp['has_pair_error'],$ltp['has_duplicity_error']),
                           array($ltp['screen'], $ltp['resolution'], $ltp['resolution_name'], $ltp['cpu'], $ltp['cores'], $ltp['ram_type'], $ltp['ram_speed'], $ltp['ram_cap'], $ltp['os'], $ltp['hdd_type'], $ltp['hdd_cap'], $ltp['gpu'], $ltp['color'], $ltp['high'], $ltp['wide'], $ltp['deep'], $ltp['weight']),
                           array($ltp['screen_f'], $ltp['resolution_f'], $ltp['resolution_name_f'], $ltp['cpu_f'], $ltp['cores_f'], $ltp['ram_type_f'], $ltp['ram_speed_f'], $ltp['ram_cap_f'], $ltp['os_f'], $ltp['hdd_type_f'], $ltp['hdd_cap_f'], $ltp['gpu_f'], $ltp['color_f'], $ltp['high_f'], $ltp['wide_f'], $ltp['deep_f'], $ltp['weight_f']));
      }
   }
}



