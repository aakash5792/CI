
<script type="text/javascript">
$(function() {



    var table = $('#example1').DataTable({
        "ajax": "<?php echo $url ?>",
        "columns": [
        <?php
        //print_r($index['ColumnNames']);
        foreach ($columns as $key => $value) { ?> {
                 "data": "<?php echo $value['db']; ?>"
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




});

</script>
