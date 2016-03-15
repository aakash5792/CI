var fields = 2;
function addfield(){
	//alert('hi');
$('#fields  tr:last').after('<tr><td><input type="text" form="form" class="form-control" name="field_name[]" id="field_name'+fields+'"  ></td>'
	+'<td><select form="form" name="field_type[]"  id="field_type'+fields+'" class="form-control">'+
	+'<option value=""></option>'
	<?php foreach ($field_type as $key => $value) {
		$field_id =$value['field_id'];
		$name = $value['field_id'].'-'.$value['field_type'].'-'.$value['type'].'('.$value['constraint'].')';
	 ?>
 +'<option value="<?= $field_id ?>"><?= $name ?></option>'


<?php } ?>
	
	+'</select></td></tr>');
fields++;
}


function formValidator(){
  // Make quick references to our fields
  var form_name = document.getElementById('form_name');
  var form_table_name = document.getElementById('form_table_name');
   var field_name1 = document.getElementById('field_name1');
  var field_name_len = document.getElementsByName('field_name[]').length;
 //alert(field_name_len);
  // Check each input in the order that it appears in the form!
       
if(notEmpty(form_name, "Numbers and Letters Only for Address")){

    if(notEmpty(form_table_name, "Numbers and Letters Only for Address")){

        for (var i =1 ; i <=field_name_len ; i++) {
          var fn = 'field_name'+i;
          var field_name = document.getElementById(fn);
         // alert(fn);
          if(notEmpty(field_name, "Numbers and Letters Only for Address")){
                if(i==field_name_len){
                    return true;
                }
          }else{
            return false;
          }
     
        }

        }else{
    return false;
  }
}else{
  return false;
}









      
}



function getmeta(valu){
	var v = '#'+valu;
	 var val = $(v).val();
	//alert(val);



$(v).val(val);
          var table = val;
          
           
            // console.log(table);
          
            $.post('<?php echo base_url() ?>form/formedit/getmeta',{
          table:table
         
            },function(data){
             
$('#new_table').html(data).ready(function(){

if($('#new_table_created').length != 0){
    $('#new_table_created').DataTable({
         colVis: {
            exclude: [ 0 ]

      },
      order: [ 0, 'asc' ],
      dom: 'C<"clear">Bfrtip',
        dom: 'T<"clear">lfrtip',
        tableTools: {
            sRowSelector: 'td:first-child',
            aButtons:     ['print', 'copy','xls', 'csv'],
    "sSwfPath": "/assets/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"

        },
    });
    $('#backup').removeAttr('disabled','disabled')
  }else{
      $('#backup').attr('disabled','disabled')
  }





});
            });
    }
