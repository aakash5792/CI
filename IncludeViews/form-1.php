

<form role="form" id="<?= $class ?>" action="<?php
echo base_url();
?><?= $module ?>/<?= $class ?>/<?= $class ?>_action" method="POST" onsubmit="return formValidator()"  enctype="multipart/form-data">

                                    <div class="row">

<?php
foreach ($form_fields as $key => $value) {
?>
  <div class="col-sm-<?= $value['field_col_sm_'] ?>">
                                            <div class="form-group">
<label><?= $value['field_label'] ?></label>
<?php   if ($value['field_type'] == '1') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" >
<?php    } else  if ($value['field_type'] == '13') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" >
<?php    } else if ($value['field_type'] == '9') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >

<?php    } else if ($value['field_type'] == '17') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >

<?php    }  else if ($value['field_type'] == '16') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >
<?php    }  else if ($value['field_type'] == '6') { ?>
<input type="text"  form="<?= $class ?>" class="form-control datepicker" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >
<?php    }  else if ($value['field_type'] == '7') { ?>
<input type="text"  form="<?= $class ?>" class="form-control datepicker" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >
<?php    } else if ($value['field_type'] == '12') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo $value['field_property'];?>" readonly >
<?php    } else if ($value['field_type'] == '3') {
        $options = explode(',', $value['field_options']); ?>
         <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" >
              <option value=""></option>
          <?php foreach ($options as $keys => $values) {
            $option_values = explode('-', $values); ?>
            <option value="<?= $option_values[0]; ?>" <?php echo set_select($value['field_name'],$option_values[0]); ?> ><?= $option_values[0] ?>-<?= $option_values[1] ?> </option>
          <?php } ?>
         </select>
<?php    } else if ($value['field_type'] == '5') {
        $options = explode(',', $value['field_options']); ?>
         <div class="row">
          <?php foreach ($options as $keys => $values) {
             ?>
             <div class="col-sm-3">
            <input type="checkbox"  id="<?= $value['field_name'].'_'.trim($values) ?>" name="<?= $value['field_name'] ?>[]" value="<?= $values; ?>"><?= $values; ?>&nbsp;&nbsp;
 </div>   <?php } ?> </div>

<?php  } else if ($value['field_type'] == '18') {
      $options = explode(',', $value['field_options']); ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" >
      <option value=""></option>
      </select>

<?php } else if ($value['field_type'] == '15') { ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" >
      <option value=""></option>
    <?php $data = $this->common->get_option($value['field_options']); ?>

     <?php


     foreach ($data as $keys => $values) {

            $option_values = explode('-', $values['options']); ?>
            <option value="<?= $option_values[0]; ?>" <?php echo set_select($value['field_name'],$option_values[0]); ?> ><?= $option_values[0] ?>-<?= $option_values[1] ?> </option>
          <?php } ?>



      </select>


<?php } else if ($value['field_type'] == '19') { ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" onchange="<?= $value['onchange'] ?>" >
      <option value=""></option>
    <?php $data = $this->common->get_option($value['field_options']); ?>

     <?php


     foreach ($data as $keys => $values) {

            $option_values = explode('-', $values['options']); ?>

            <option value="<?= $option_values[0]; ?>" <?php echo set_select($value['field_name'],$option_values[0]); ?> ><?= $option_values[1] ?> </option>
          <?php } ?>



      </select>


<?php } else if ($value['field_type'] == '14') { ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" onchange="<?= $value['onchange'] ?>" >
      <option value=""></option>
    <?php $data = $this->common->get_option($value['field_options']); ?>

     <?php


     foreach ($data as $keys => $values) {

            $option_values = explode('-', $values['options']); ?>

            <option value="<?= $option_values[0]; ?>" <?php echo set_select($value['field_name'],$option_values[0]); ?> ><?= $option_values[1] ?> </option>
          <?php } ?>



      </select>


<?php } else if ($value['field_type'] == '191') { ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>"  >
      <option value=""></option>
    <?php $data = $this->common->get_option($value['field_options']); ?>

     <?php


     foreach ($data as $keys => $values) {

            $option_values = explode('-', $values['options']); ?>

            <option value="<?= $option_values[0]; ?>"><?= $option_values[1] ?> </option>
          <?php } ?>



      </select>


<?php } else if ($value['field_type'] == '2') { ?>
<textarea class="form-control" id="<?= $value['field_name'] ?>"  form="<?= $class ?>"  name="<?= $value['field_name'] ?>" ></textarea>
<?php } else if ($value['field_type'] == '10') { ?>
<input type="file"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>"  >
<?php } ?>
        </div>
                                        </div>
<?php
}
?>



                              </div>
</form>
