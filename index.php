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
               <input type="submit" name="btn_filter" value="Filter" />&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
               
			   <label>RAM option: </label>
			   <select name="ram_opt">
				  <option value="no" <?php echo getFilterState('ram_opt') == 'no' ? 'selected="selected"' : "" ?>>no filter</option>
				  <option value="lt" <?php echo getFilterState('ram_opt') == 'lt' ? 'selected="selected"' : "" ?>>&lt;</option>
				  <option value="gt" <?php echo getFilterState('ram_opt') == 'gt' ? 'selected="selected"' : "" ?>>&gt;</option>
				  <option value="eq" <?php echo getFilterState('ram_opt') == 'eq' ? 'selected="selected"' : "" ?>>=</option>
				  <option value="le" <?php echo getFilterState('ram_opt') == 'le' ? 'selected="selected"' : "" ?>>&le;</option>
				  <option value="ge" <?php echo getFilterState('ram_opt') == 'ge' ? 'selected="selected"' : "" ?>>&ge;</option>
			   </select>
			   <label>RAM value: </label>
			   <select name="ram_val">
				  <option value="no">no filter</option>
				  <?php
				  foreach($DB->getMemoryValues() as $val){
					 ?><option value="<?php echo $val[0];?>" <?php echo getFilterState('ram_val') == $val[0] ? 'selected="selected"' : "" ?>><?php echo $val[0];?> GB</option><?php
				  }
				  ?>
			   </select>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			   
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
      
      <div class="page" id="footbar"></div>
      
   </div>
</body>

</html>
