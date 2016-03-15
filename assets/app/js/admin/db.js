$('#backup').on('click',function(){

 var database = $('#backup_database').val();
          var table = $('#backup_table').val();
          var field = $('#backup_field').val();
          var from_date = $('#backup_from').val();
          var to_date = $('#backup_to').val();
          

  $.post('<?php echo base_url() ?>admin/db/backup',{
database:database,
table:table,
field:field,
from_date:from_date,
to_date :to_date
  },function(data){
console.log(data);
  location.reload();
  },'JSON');

});



$('#show_database').on('change',function(){
var database = this.value;
          $.post('<?php echo base_url() ?>admin/db/show_tables',{
          database :this.value
          },function(data){
            var tables = 'Tables_in_'+database;
            AppendOption(data,'#show_tables',tables,tables);
          },'json');
});


$('#backup_table').on('change',function(){
var table = this.value;
var database = $('#backup_database').val();
          $.post('<?php echo base_url() ?>admin/db/show_table_field',{
            table :this.value,
            database :database
          },function(data){
              AppendOption(data,'#backup_field','column_name','column_name');
          },'json');
});

$('#backup_field').on('change',function(){
var field = this.value;

var table =  $('#backup_table').val();
var database = $('#backup_database').val();
          $.post('<?php echo base_url() ?>admin/db/show_field_values',{
            field:field,
            table :table,
            database :database
          },function(data){
              AppendOption(data,'#backup_from',field,field);
               AppendOption(data,'#backup_to',field,field);
          },'json');
});

$('input[type="submit"]').click(function(){
  alert('hi');
 // get_table_details();
  return false;
})