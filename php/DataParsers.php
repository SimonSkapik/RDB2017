<?php
/*********************************
*
*   Message Manager Class
*   Claas to keep and work with instances of Message class used to keep error and info messages raised during data processing.
*
*   Author: Simon Skapik
*
**********************************/

interface DataParser
{
    public function GetData($file);
}

class CSVParser implements DataParser
{
   public function GetData($filename){
      $data = array();
      // id                   0      
      // uhlopricka           1   
      // rozliseni            2   
      // rzliseni_oznaceni    3
      // cpu                  4
      // pocet_jader          5
      // ram_typ              6
      // ram_speed            7
      // ram_cap              8
      // os                   9
      // hdd_cap              10
      // hdd_type             11
      // gpu                  12   
      // barva                13   
      // height               14
      // width                15
      // depth                16
      // weight               17
      $file = fopen($filename,'r');
      if ($file) {
          while (($line = fgets($file)) !== false) {
              $values = explode(',',$line);
              $values[17] = trim($values[17]);
              array_push($data,$values);
          }
          fclose($file);
      } else {
          return false;
      } 
      return $data;
   }
}

class JSONParser implements DataParser
{
   public function GetData($filename){
      $json = json_decode(file_get_contents($filename), true);
      $data = array();
      foreach($json['data'] as $ltp){
         array_push($data, array($ltp['serial'], $ltp['screen'], $ltp['resolution'], $ltp['resolution_code'], $ltp['cpu'], $ltp['cores'], $ltp['ram'], $ltp['ram_type'], $ltp['ram_capacity'], $ltp['os'], $ltp['hdd'], $ltp['hdd_type'], $ltp['gpu'], $ltp['color'], $ltp['height'], $ltp['width'], $ltp['depth'], $ltp['weight']));
      }
      return $data;
   }
}

class XMLParser implements DataParser
{
   public function GetData($filename){
      $xml = simplexml_load_file($filename) or die("Error: Cannot create object");
      $data = array();
      foreach($xml->computer as $ltp){
         array_push($data, array($ltp->serial, $ltp->screen, $ltp->resolution, $ltp->resolution_code, $ltp->cpu, $ltp->cores, $ltp->ram, $ltp->ram_type, $ltp->ram_capacity, $ltp->os, $ltp->hdd, $ltp->hdd_type, $ltp->gpu, $ltp->color, $ltp->height, $ltp->width, $ltp->depth, $ltp->weight));
      }
      return $data;
   }
}