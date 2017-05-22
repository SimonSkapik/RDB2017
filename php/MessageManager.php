<?php
/*********************************
*
*   Message Manager Class
*   Claas to keep and work with instances of Message class used to keep error and info messages raised during data processing.
*
*   Author: Simon Skapik
*
**********************************/

class Message{

   const SUCCESS = 0;
   const INFO = 1;
   const GENERAL_ERROR = 2;
   const FILE_ERROR = 3;
   const APLICATION_ERROR = 4;
   
   public static $msgTypes = array('Success', 'Info', 'General Error', 'File Error', 'Aplication Error');
   
   public $code;
   public $msg;
   
   public function __construct($code,$msg) {
      $this->code = $code;
      $this->msg = $msg;
   }
   
   public function GetMessage(){
      return '[' . $this->code . ' - ' . self::$msgTypes[$this->code] . ']: ' . $this->msg;
   }
}

class MessageManager{
   
   private $messages;
   
   public function __construct(){
      $this->messages = array();
   }
   
   public function addMessage($msg){
      array_push($this->messages, $msg);
   }
   
   public function GetAllToHTML(){
      $code = '';
      foreach($this->messages as $msg){
         $type = 'error';
         if($msg->code == 0){
            $type = 'success';
         }else if($msg->code == 1){
            $type = 'info';
         }
         $code .= '<div class="message '.$type.'"><p>'.$msg->GetMessage().'</p></div>';
      }
      return $code;
   }
   
}
