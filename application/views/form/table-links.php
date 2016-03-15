
<script type="text/javascript">
$(function() {



    var table = $('#example1').DataTable({
        "ajax": "<?php echo $url ?>",
        "columns": [
        <?php
        //print_r($index['ColumnNames']);
        foreach ($columns as $key => $value) { ?> {
                 "data": "<?php echo $value['Field']; ?>"
        },
        <?php } ?>
        ],
        colVis: {
            exclude: [ 0 ]

      },
      order: [ 0, 'asc' ],
      dom: 'C<"clear">Bfrtip',
        dom: 'T<"clear">lfrtip',
        tableTools: {
            sRowSelector: 'td:first-child',
            aButtons:     ['print', 'copy','pdf','xls', 'csv'],
    "sSwfPath": "/assets/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"

        },
        });

        $('#example1 tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
            } );

            table.columns().every( function () {
        var that = this;

        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );



    $('#example1 tbody').on('click', 'tr', function() {
        if ($(this).hasClass('danger')) {
            $(this).removeClass('danger');
        } else {
            table.$('tr.selected').removeClass('danger');
            $(this).addClass('danger');
        }
    });



    $('#edit').click( function () {
  var tbl = table.rows('.danger').data().length;
// console.log(tbl);
        if(tbl == 1)
        {
           var data = table.rows('.danger').data();
          var x = data[0];






          // console.log(x['field_validations']);


          if(x['field_validations'] != null) {
         var field_validations = x['field_validations'].split('|');


 $.each( field_validations, function( key, value ) {
            var ids = '#field_validations_'+value;
              console.log(ids);
            $(ids).prop('checked',true);
          });

}
          $.each( x, function( key, value ) {
            var ids = '#'+key;
            $(ids).val(value);
          });

var fields = $( ":input, :checkbox ,:radio" ).serializeArray();
  // console.log(fields);
 $('#submit').val('Update');
var submit ='save';

  $.post('/form/formedit/formedit_action',{
    fields : fields,
    submit : submit

  },function(data){
    console.log(data);
  });


        }else if(tbl == 0){
             alert('Please Select A row')
        }else{
            alert('Only One row can be upload at time')
        }
    });



});

</script>
