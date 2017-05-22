<?php
/*********************************
*
*   RDB 2017
*   Final work
*   
*   Author: Simon Skapik
*
**********************************/

include './php/Functions.php';

if(isset($_POST['btn_import'])){
   import_file($_FILES['import_file']);
}

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
            <form method="post" action="" enctype="multipart/form-data">
               <label for="import_file">Import: </label><input type="file" name="import_file" />
               <input type="submit" name="btn_import" value="Import" />&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            </form>
            <form method="get" action="">
               <label>State: </label><input type="checkbox" id="chck_state_ok" name="chck_state_ok" <?php echo getFilterState("chck_state_ok") ? 'checked="checked"' : ""  ?> /><label for="chck_state_ok">Ok</label>
               <input type="checkbox" id="chck_state_part" name="chck_state_part" <?php echo getFilterState("chck_state_part") ? 'checked="checked"' : ""  ?> /><label for="chck_state_part">Part error</label>
               <input type="checkbox" id="chck_state_pair" name="chck_state_pair" <?php echo getFilterState("chck_state_pair") ? 'checked="checked"' : ""  ?> /><label for="chck_state_pair">Pair error</label>
               <input type="checkbox" id="chck_state_duplicity" name="chck_state_duplicity" <?php echo getFilterState("chck_state_duplicity") ? 'checked="checked"' : ""  ?> /><label for="chck_state_duplicity">Duplicity error</label>
               <input type="submit" name="btn_filter" value="Filter" />&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <br><br>
               
			   <label>RAM option: </label>
			   <select name="chck_ram_opt">
				  <option value="no" <?php echo getFilterState('chck_ram_opt') == 'no' ? 'selected="selected"' : "" ?>>no filter</option>
				  <option value="lt" <?php echo getFilterState('chck_ram_opt') == 'lt' ? 'selected="selected"' : "" ?>>&lt;</option>
				  <option value="gt" <?php echo getFilterState('chck_ram_opt') == 'gt' ? 'selected="selected"' : "" ?>>&gt;</option>
				  <option value="eq" <?php echo getFilterState('chck_ram_opt') == 'eq' ? 'selected="selected"' : "" ?>>=</option>
				  <option value="le" <?php echo getFilterState('chck_ram_opt') == 'le' ? 'selected="selected"' : "" ?>>&le;</option>
				  <option value="ge" <?php echo getFilterState('chck_ram_opt') == 'ge' ? 'selected="selected"' : "" ?>>&ge;</option>
			   </select>&nbsp;
			   
			   <label>RAM value: </label>
			   <select name="chck_ram_val">
				  <option value="no">no filter</option>
				  <?php
				  foreach($DB->getMemoryValues() as $val){
					 ?><option value="<?php echo $val[0];?>" <?php echo getFilterState('chck_ram_val') == $val[0] ? 'selected="selected"' : "" ?>><?php echo $val[0];?> GB</option><?php
				  }
				  ?>
			   </select>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			   
			   <label>CPU: </label>
			   <select name="chck_cpu">
				  <option value="no">no filter</option>
				  <?php
				  foreach($DB->getCpuValues() as $val){
					 ?><option value="<?php echo urlencode($val[0])?>" <?php echo getFilterState('chck_cpu') == $val[0] ? 'selected="selected"' : "" ?>><?php echo $val[0];?></option><?php
				  }
				  ?>
			   </select>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			   
			   <label>Resolution: </label>
			   <select name="chck_res">
				  <option value="no">no filter</option>
				  <?php
				  foreach($DB->getResolutionValues() as $val){
					 ?><option value="<?php echo urlencode($val[0])?>" <?php echo getFilterState('chck_res') == $val[0] ? 'selected="selected"' : "" ?>><?php echo $val[0] . ' (' . $val[1] . ')';?></option><?php
				  }
				  ?>
			   </select>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			   <label>Dimensions (mm): </label>
			   <select name="chck_dim">
				  <option value="no" <?php echo getFilterState('chck_dim') == 'no' ? 'selected="selected"' : "" ?>>no filter</option>
				  <option value="lt" <?php echo getFilterState('chck_dim') == 'lt' ? 'selected="selected"' : "" ?>>&lt;</option>
				  <option value="gt" <?php echo getFilterState('chck_dim') == 'gt' ? 'selected="selected"' : "" ?>>&gt;</option>
			   </select>&nbsp;
			   <label>H: </label>
			   <input type = "text" name = "chck_height" size = "3" value = "<?php echo getFilterState('chck_height') == false ? "" : $_GET['chck_height'] ?>">&nbsp;
			   <label>W: </label>
			   <input type = "text" name = "chck_width" size = "3" value = "<?php echo getFilterState('chck_width') == false ? "" : $_GET['chck_width'] ?>">&nbsp;
			   <label>D: </label>
			   <input type = "text" name = "chck_depth" size = "3" value = "<?php echo getFilterState('chck_depth') == false ? "" : $_GET['chck_depth'] ?>">
			   &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			   
			   <label>Weight (kg) from: </label>
			   <input type = "text" name = "chck_weight_from" size = "2" value = "<?php echo getFilterState('chck_weight_from') == false ? "" : $_GET['chck_weight_from'] ?>">&nbsp;
			   <label>to: </label>
			   <input type = "text" name = "chck_weight_to" size = "2" value = "<?php echo getFilterState('chck_weight_to') == false ? "" : $_GET['chck_weight_to'] ?>">
			   &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
			   
			   
            </form>
         </div>
      </div>
      <div class="page" id="content">
         <div class="messages">
            <?php echo $MM->GetAllToHTML(); ?>
         </div>
         <div id="products">
            <?php echo dataToHTML($products); ?>
         </div>
      </div>
	  <div class="page">
		<label>Top 10 filters</label><br>
		 <?php
			$i = 1;
		    foreach($DB->getTopFilters() as $val){
			   ?><a href = "?<?php echo $val[1] ?>">Top <?php echo $i++?></a><br><?php
			}
		 ?>
	     
	  </div>
      
      <div class="page" id="footbar"></div>
      
   </div>
</body>

</html>
