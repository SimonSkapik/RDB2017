<?php
/*********************************
*
*   Main application backend logic
*
*   Author: Simon Skapik
*
**********************************/

// Message management
include '/php/MessageManager.php';
$MM = new MessageManager();

// Databace connection
include '/php/Database.php';
$DB = new MyDatabase($MM);
//var_dump($DB->TestGet());

// Data parsers
include '/php/DataParsers.php';

// Product classes
include '/php/Products.php';


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
      return false;
   }else{
      $MM->addMessage(new Message(Message::APLICATION_ERROR, "Error occured during import."));
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
   }
}

function assembleFilter(){
   $filter = "";
   $filterList  = array();
   if(isset($_GET['chck_state_ok'])){
      array_push($filterList,'(has_part_error = 0 AND has_pair_error = 0 AND has_duplicity_error = 0)');
   }
   if(isset($_GET['chck_state_part'])){
      array_push($filterList,'(has_part_error = 1)');
   }
   if(isset($_GET['chck_state_pair'])){
      array_push($filterList,'(has_pair_error = 1)');
   }
   if(isset($_GET['chck_state_duplicity'])){
      array_push($filterList,'(has_duplicity_error = 1)');
   }
   $filter = implode(' OR ', $filterList);
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

if(isset($_GET['btn_filter'])){
   $data = $DB->getFiltered(assembleFilter());
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
