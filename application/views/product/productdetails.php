<!DOCTYPE html>
<html>

<head>
    <?php include "IncludeViews/head.php" ?>
</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
    <div class="wrapper">

        <header class="main-header">
            <?php include "IncludeViews/main-header.php" ?>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

            <?php include "IncludeViews/main-sidebar.php" ?>
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
          <!-- Content Header (Page header) -->
          <section class="content-header">
              <h1>
        <?php echo $page_name  ?>
        </h1>
              <ol class="breadcrumb">
                <?php foreach($page_breadcrumb as $key => $value) { ?>
                    <li><a href="#"><?= $value ?></a>
                    </li>
                    <?php } ?>


                </ol>
          </section>

          <!-- Main content -->
            <section class="content">
                  <?php include "IncludeViews/msg.php" ?>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="box box-default">
                            <div class="box-header with-border">
                              <h3 class="box-title">  <?php echo $form_name  ?></h3>
                          <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">


                                <div class="row">
                                    <form role="form" id="menucat" action="<?php echo base_url() ?>product/productsubcategory/productsubcategory_action" method="POST">

 <div class="col-sm-4">
                                          <div class="form-group">
                                              <label>product_category_id:</label>

 <select class="select2" style="width:100%" id="product_category_id" name="product_category_id"  >
       <option value=""></option>
         <?php foreach ($product_category_id as $key => $value) { ?>
       <option value="<?php echo $product_category_id = $value['product_category_id'] ?>">
        <?php echo $value['product_category_id'].'-'.$value['product_category_name'] ?></option>

                                          <?php  }?>
                                           </select>

                                          </div>
                                      </div>

 <div class="col-sm-4">
                                          <div class="form-group">
                                              <label>product_sub_category_id:</label>

 <select class="select2" style="width:100%" id="product_sub_category_id" name="product_sub_category_id"  >
       <option value=""></option>

                                           </select>

                                          </div>
                                      </div>




 <div class="col-sm-4">
                                          <div class="form-group">
                                              <label>product_id:</label>

 <select class="select2" style="width:100%" id="product_id" name="product_id"  >
       <option value=""></option>

                                           </select>

                                          </div>
                                      </div>

</form>
                                </div>




                            </div>

                        
                        </div>
                    </div>
                </div>



  <!-- Modal -->
  <div class="modal  fade bs-example-modal-lg" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Adding Product Feature</h4>
        </div>
        <div class="modal-body">
           <div class="row">
 <div class="col-sm-4">
        <div class="form-group">
            <label>product_id:</label>
            <input type="text" class="form-control" readonly id="product_id_1" name="product_id">
        </div>
    </div>

 <div class="col-sm-4">
        <div class="form-group">
            <label>field_name:</label>
            <input type="text" class="form-control"  id="field_name" name="field_name">
        </div>
    </div>
    <div class="col-sm-4">
        <div class="form-group">
            <label>field_label:</label>
            <input type="text" class="form-control"  id="field_label" name="field_label">
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label>field_col_sm_:</label>
            <input type="text" class="form-control"  id="field_col_sm_" name="field_col_sm_">
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group">
            <label>field_type:</label>
            <input type="text" class="form-control"  id="field_type" name="field_type">
        </div>
    </div>
     <div class="col-sm-3">
        <div class="form-group">
            <label>field_options:</label>
            <input type="text" class="form-control"  id="field_options" name="field_options">
        </div>
    </div>

   <div class="col-sm-3">
        <div class="form-group">
            <label>field_default:</label>
            <input type="text" class="form-control"  id="field_default" name="field_default">
        </div>
    </div>
   <div class="col-sm-12">
        <div class="form-group">
            <label>field_validations:</label>
            <input type="text" class="form-control"  id="field_validations" name="field_validations">
        </div>
    </div>
    </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-success" data-dismiss="modal" onclick="add_feature_form_submit()">Add</button>

          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>

    </div>
  </div>




   <div class="row" id="product_feature_fields">



                        </div>


    </div>



            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <?php include "IncludeViews/main-footer.php" ?>
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <?php include "IncludeViews/control-sidebar.php" ?>
        </aside>
        <!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->



</body>

</html>
