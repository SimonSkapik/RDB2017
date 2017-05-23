<?php
/*********************************
*
*   Products Class
*   Claas to keep and work with Product and their parts
*
*   Author: Simon Skapik
*
**********************************/

class Part{
   public $name;
   public $has_part_error;
   public $has_pair_error;
   public $has_duplicity_error;
   
   public function __construct($name,$errors) {
      $this->name = array($name);
      $this->has_part_error = ($errors >= 100 ? true : false);
      $this->has_pair_error = ((intval(($errors % 100)/10)) ? true : false);
      $this->has_duplicity_error = ($errors % 10 ? true : false);
   }
   
   public function addData($name,$errors){
      array_push($this->name, $name);
      $this->has_part_error = ($errors >= 100 ? true : $this->has_part_error);
      $this->has_pair_error = ((intval(($errors % 100)/10)) ? true : $this->has_pair_error);
      $this->has_duplicity_error = ($errors % 10 ? true : $this->has_duplicity_error);
   }
   
   public function ToHTML(){
      $code = implode(',<br/>',$this->name);
      if($this->has_part_error){
         $code .= '<span class="ltp-error part"></span>';
      }
      if($this->has_pair_error){
         $code .= '<span class="ltp-error pair"></span>';
      }
      if($this->has_duplicity_error){
         $code .= '<span class="ltp-error duplicity"></span>';
      }
      return $code;
   }
}

class Laptop{
   
   private $name;
   private $parts;
   public $has_part_error;
   public $has_pair_error;
   public $has_duplicity_error;
   
   public function __construct($name){
      $this->name = $name;
      $this->parts = array();
      $this->has_part_error = false;
      $this->has_pair_error = false;
      $this->has_duplicity_error = false;
   }
   
   private function getWarningSigns($part,$pair,$duplicity){
      $code = "";
      if($part){
         $code .= '<span class="ltp-error part"></span>';
      }
      if($pair){
         $code .= '<span class="ltp-error pair"></span>';
      }
      if($duplicity){
         $code .= '<span class="ltp-error duplicity"></span>';
      }
      return $code;
   }
   
   public function addData($ltpFlags,$parts,$partFlags){
      $this->has_part_error = ($ltpFlags[0] ? true : $this->has_part_error);
      $this->has_pair_error = ($ltpFlags[1] ? true : $this->has_pair_error);
      $this->has_duplicity_error = ($ltpFlags[2] ? true : $this->has_duplicity_error);
      $len = count($parts);
      for($i = 0; $i < $len; $i++){
         if(isset($this->parts[$i])){
            if($parts[$i] != null){
               $this->parts[$i]->addData($parts[$i],$partFlags[$i]);
            }
         }else{
            $this->parts[$i] = new Part($parts[$i],$partFlags[$i]);
         }
      }
   }
   
   public function addToCounts(&$counts){
      $counts[0]++;
      if(!$this->has_part_error && !$this->has_pair_error && !$this->has_duplicity_error ){
         $counts[1]++;
      }
      if($this->has_part_error){
         $counts[2]++;
      }
      if($this->has_pair_error){
         $counts[3]++;
      }
      if($this->has_duplicity_error){
         $counts[4]++;
      }
   }

   public function ToHTML(){
      $code = "<tr ";
      if($this->has_part_error || $this->has_pair_error || $this->has_duplicity_error){
         $code .= 'class="ltp-error"';
      } 
      $code .= "><td>" . $this->name . $this->getWarningSigns($this->has_part_error, $this->has_pair_error, $this->has_duplicity_error) . "</td>";
      foreach($this->parts as $part){
         $code .= "<td>".$part->ToHTML()."</td>";
      }
      $code .= "</tr>";
      return $code;
   }
   
}
