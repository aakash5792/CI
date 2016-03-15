<?php if(isset($get_option_url)) { ?>
function getoption(val,Id,values,texts){

  var v  ='#'+val;
  var valu = $(v).val();
     $.post('<?= $get_option_url ?>',{
          field_val:valu,
          field_id:val,
          table :'<?= $table ?>'
            },function(data){

 x = data;
       // console.log(x.length);
        $(Id + " option").each(function() {
            $(this).remove();
        });
        $(Id).append('<option value=""></option>');
        for (var i = 0; i <= x.length - 1; i++) {
         options = x[i]['options'].split('-');
         //console.log(options);
            $(Id).append('<option value="' + options[values] + '">'+ options[texts] + '</option>')
        }
            },'JSON');

}
<?php } ?>

    function get_table_details(){
          var database = $('#backup_database').val();
          var table = $('#backup_table').val();
          var field = $('#backup_field').val();
          var from_date = $('#backup_from').val();
          var to_date = $('#backup_to').val();
            $.post('<?php echo base_url() ?>admin/db/show_table_details',{
          database:database,
          table:table,
          field:field,
          from_date:from_date,
          to_date :to_date
            },function(data){

$('#new_table').html(data).ready(function(){
if($('#example1').length != 0){
  $('#backup').removeAttr('disabled','disabled')
  }else{
      $('#backup').attr('disabled','disabled')
  }






});

            });

    }



    function get_sql_queries(){

        var database = $('#sql_database').val();
          var sql_queries = $('#sql_query').val();


             console.log(sql_queries);

            $.post('<?php echo base_url() ?>admin/sql/get_sql_queries',{
          database:database,
          sql_queries:sql_queries

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
