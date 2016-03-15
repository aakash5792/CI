<div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title">  <?php
echo $page_form_name;
?></h3>
                                   <div class="box-tools pull-right">
                                     <a href='<?= $csv_path ?>' class="btn btn-sm btn-danger" >CSV Download</a>

                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">

<form role="form" id="<?= $class ?>" action="<?php
echo base_url();
?><?= $module ?>/<?= $class ?>/<?= $class ?>_action" method="POST">
                                   
                                    <div class="row">

<?php
foreach ($form_fields as $key => $value) {
?>
  <div class="col-sm-<?= $value['field_col_sm_'] ?>">
                                            <div class="form-group">
<label><?= $value['field_label'] ?></label>
<?php   if ($value['field_type'] == '1') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" >
<?php    } else if ($value['field_type'] == '9') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >
<?php    } else if ($value['field_type'] == '12') { ?>
<input type="text"  form="<?= $class ?>" class="form-control" id="<?= $value['field_name'] ?>" name="<?= $field_name = $value['field_name'] ?>" value="<?php echo set_value($field_name);?>" readonly >
<?php    } else if ($value['field_type'] == '3') {
        $options = explode(',', $value['field_options']); ?>
         <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" >
              <option value=""></option>
          <?php foreach ($options as $keys => $values) {
            $option_values = explode('-', $values); ?>
            <option value="<?= $option_values[0]; ?>"><?= $option_values[0] ?>-<?= $option_values[1] ?> </option>
          <?php } ?>
         </select>
<?php  } else if ($value['field_type'] == '31') {
      $options = explode(',', $value['field_options']); ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" >
      <option value=""></option>
  <?php foreach ($options as $keys => $values) { ?>
      <option value="<?= $values; ?>"><?= $values; ?> </option>
<?php } ?>
      </select>
<?php } else if ($value['field_type'] == '16') { ?>
      <select class="form-control"  form="<?= $class ?>" id="<?= $value['field_name'] ?>" name="<?= $value['field_name'] ?>" >
      <option value=""></option>
      </select>
      <div class="hidden">
<!-- jQuery 2.1.4 -->
<script src="/assets/plugins/jQuery/jQuery-2.1.4.min.js"></script>
  
<script type="text/javascript">
function AppendOptions(data, Id, values, texts) {
        x = data;
        console.log(x.length);
        $(Id + " option").each(function() {
            $(this).remove();
        });
        $(Id).append('<option value=""></option>');
        for (var i = 0; i <= x.length - 1; i++) {
            $(Id).append('<option value="'+x[i][values]+'">'+x[i][values]+'-'+x[i][texts]+'</option>')
        }
    }

$(document).ready(function(){
    alert('hi');

    $.post('http://sample.com/form/form/get_option',{
      sql : "<?= $value['field_options'] ?>"
    },function(data){
      console.log(data['columns']);
      AppendOptions(data['data'], "<?= '#'.$value['field_name'] ?>", data['columns'][0]['Field'],data['columns'][1]['Field']);

    },'JSON')

});

</script>
</div>


<?php } else if ($value['field_type'] == '2') { ?>
<textarea class="form-control" id="<?= $value['field_name'] ?>"  form="<?= $class ?>"  name="<?= $value['field_name'] ?>" ></textarea>
<?php } ?>
        </div>
                                        </div>
<?php
}
?>



                              </div>
</form>

                                    </div>


                                     <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
                                    <input type="submit" id="submit" name="submit" form="<?= $class ?>" class="btn btn-primary" value="<?php
echo set_value('submit') ? set_value('submit') : 'save';
?>"   >
                                    </div>
                             <div class="col-md-3 col-sm-3">
                                    <input type="button" class="btn btn-danger" value="cancel">
                                    </div>
                                </div>
                            </div>

                                </div>
                            </div>
