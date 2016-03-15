<!-- jQuery 2.1.4 -->
    <script src="/assets/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
   <script src="/assets/plugins/iCheck/icheck.min.js"></script>

    <!-- DataTables -->
    <script src="/assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/assets/plugins/datatables/dataTables.bootstrap.min.js"></script>


        <script src="/assets/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script src="/assets/plugins/datatables/extensions/ColVis/js/dataTables.colVis.js"></script>
    <!-- SlimScroll -->
    <script src="/assets/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="/assets/plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/assets/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/assets/dist/js/demo.js"></script>
    <!-- page script -->
    <!-- Select2 -->
    <script src="/assets/plugins/select2/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="/assets/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/assets/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="/assets/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="/assets/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- bootstrap color picker -->

 <script type="text/javascript" src='http://maps.google.com/maps/api/js?sensor=false&libraries=places'></script>
 
    <script src="<?php echo base_url(); ?>assets/plugins/location/locationpicker.jquery.min.js"></script>
<style>
tfoot {
    display: table-header-group;
}
</style>
<script type="text/javascript">


<?php include $js_function_path ?>

    $(function() {

        $('.tooltip-show').tooltip('show');


    function AppendOptions(data, Id, values, texts) {
        x = data;
        console.log(x.length);
        $(Id + " option").each(function() {
            $(this).remove();
        });
        $(Id).append('<option value="Selected"></option>');
        for (var i = 0; i <= x.length - 1; i++) {
            $(Id).append('<option value="' + x[i][values] + '">'+x[i][values]+' - '+x[i][texts]+ '</option>')
        }
    }
    function AppendOption(data, Id, values, texts) {
        x = data;
        console.log(x.length);
        $(Id + " option").each(function() {
            $(this).remove();
        });
        $(Id).append('<option value="Selected"></option>');
        for (var i = 0; i <= x.length - 1; i++) {
            $(Id).append('<option value="' + x[i][values] + '">'+ x[i][texts] + '</option>')
        }
    }

    $('.select2').select2();

 


    var yrange = '1950:+0';
    var d = new Date();
    $(".datepicker").datepicker({
        changeMonth: true,
        changeYear: true,
        format: 'dd-mm-yyyy',
        dateFormat: 'dd-mm-yyyy',
        defaultDate: d,
    });









    var table = $('#example1').DataTable({
        "processing": true,
        "serverSide": true,
        "ajax": {
            "url": "<?php echo $list_url ?>",
            "type": "POST"
        },
        
        "columns": [    
        <?php
        //print_r($index['ColumnNames']);
        foreach ($columns as $key => $value) { ?> {
                "data": "<?php echo $value['dt'] ?>"
        },
        <?php } ?>
        ],

           colVis: {
            exclude: [ 0 ]

      },
      order: [ 0, 'asc' ],
      dom: 'CT<"clear">Bfrtip',
        <?php if($page_access_controls['role_menu_export'] != 'N') { ?>
            
        tableTools: {
            sRowSelector: 'td:first-child',
                                  
            aButtons:     ['print', 'copy','xls', 'csv'],
    "sSwfPath": "/assets/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf"

        },
<?php } ?>
       
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




<?php include $js_path ?>


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
