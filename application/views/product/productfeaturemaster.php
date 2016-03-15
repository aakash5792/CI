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
                                             <label>Product Category Id:</label>

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
                                              <label>Product Sub Category Id:</label>

 <select class="select2" style="width:100%" id="product_sub_category_id" name="product_sub_category_id"  >
       <option value=""></option>

                                           </select>

                                          </div>
                                      </div>




 <div class="col-sm-4">
                                          <div class="form-group">
                                                <label>Product Id:</label>

 <select class="select2" style="width:100%" id="product_id" name="product_id"  >
       <option value=""></option>

                                           </select>

                                          </div>
                                      </div>

</form>

                                </div>




                            </div>

                            <div class="box-footer">
                                <div class="row">

                                    <div class="col-md-3 col-sm-3">
                                    <input type="button" id="add_feature"  class="btn btn-primary" value="Add Feature">
                                    </div>
                             <div class="col-md-3 col-sm-3">
                                    <input type="button" class="btn btn-danger" value="cancel">
                                    </div>
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


  <div class="col-sm-3">
                                            <div class="form-group">
<label>Table Name</label>
<input type="text" readonly="" value="" name="table_name" id="table_name" class="form-control" form="formedit">

        </div>
                                        </div>
  <div class="col-sm-3">
                                            <div class="form-group">
<label>Field name</label>
<input type="text" value="" name="field_name" id="field_name" class="form-control" form="formedit">
        </div>
                                        </div>
  <div class="col-sm-3">
                                            <div class="form-group">
<label>Field label</label>
<input type="text" value="" name="field_label" id="field_label" class="form-control" form="formedit">
        </div>
                                        </div>
  <div class="col-sm-3">
                                            <div class="form-group">
<label>Field type</label>
  
<select class="select2" style="width:100%" id="field_type" name="field_type"  >
       <option value=""></option>
         <?php foreach ($field_type as $key => $value) { ?>
       <option value="<?php echo $value['field_id'] ?>">
        <?php echo $value['field_type'];?></option>

                                          <?php  } ?>
                                           </select>


        </div>
                                        </div>
  <div class="col-sm-12">
                                            <div class="form-group">
<label>Field options</label>
<textarea name="field_options" form="formedit" id="field_options" class="form-control"></textarea>
        </div>
                                        </div>
 <div class="col-sm-12">
        <div class="form-group">
            <label>field_validations:</label>
            <select class="form-control"  id="field_validations" name="field_validations">
       <option value=""></option> 
 <option value="required">required</option>
  <option value="3">min_length</option>
  <option value="4">max_length</option>
  <option value="5">alpha_numeric</option>
  <option value="6">alpha</option>
  <option value="7">integer</option>
  <option value="8">decimal</option>
  <option value="9">numeric</option>
  <option value="10">valid_ip</option>
  <option value="10">valid_email</option>
 
  
</select> 
        </div>
    </div>
  <div class="col-sm-2">
                                            <div class="form-group">
<label>Field col sm </label>
         <select name="field_col_sm_" id="field_col_sm_" form="formedit" class="form-control">
              <option value=""></option>
                      <option value="1">1-col_md_1 </option>
                      <option value="2">2-col_md_2 </option>
                      <option value="3">3-col_md_3 </option>
                      <option value="4">4-col_md_4 </option>
                      <option value="5">5-col_md_5 </option>
                      <option value="6">6-col_md_6 </option>
                      <option value="7">7-col_md_7 </option>
                      <option value="8">8-col_md_8 </option>
                      <option value="9">9-col_md_9 </option>
                      <option value="10">10-col_md_10 </option>
                      <option value="11">11-col_md_11 </option>
                      <option value="12">12-col_md_12 </option>
                   </select>
        </div>
                                        </div>
  <div class="col-sm-2">
                                            <div class="form-group">
<label>Form order</label>
<input type="text" value="" name="form_order" id="form_order" class="form-control" form="formedit">
        </div>
                                        </div>
  <div class="col-sm-2">
                                            <div class="form-group">
<label>Form show</label>
         <select name="form_show" id="form_show" form="formedit" class="form-control">
              <option value=""></option>
                      <option value="1">1-Show </option>
                      <option value="2">2-Hide </option>
                   </select>
        </div>
                                        </div>
  <div class="col-sm-2">
                                            <div class="form-group">
<label>App show</label>
         <select name="form_app_show" id="form_app_show" form="formedit" class="form-control">
              <option value=""></option>
                      <option value="1">1-Show </option>
                      <option value="2">2-Hide </option>
                   </select>
        </div>
                                        </div>
  <div class="col-sm-2">
                                            <div class="form-group">
<label>Import show</label>
         <select name="form_import_show" id="form_import_show" form="formedit" class="form-control">
              <option value=""></option>
                      <option value="1">1-Show </option>
                      <option value="2">2-Hide </option>
                   </select>
        </div>
                                        </div>
  <div class="col-sm-2">
                                            <div class="form-group">
<label>Field property</label>
<input type="text" value="" name="field_property" id="field_property" class="form-control" form="formedit">
        </div>
                                        </div>
  <div class="col-sm-6">
                                            <div class="form-group">
<label>Onchange</label>
<textarea name="onchange" form="formedit" id="onchange" class="form-control"></textarea>
        </div>
                                        </div>
  <div class="col-sm-6">
                                            <div class="form-group">
<label>Dependon</label>
<textarea name="dependon" form="formedit" id="dependon" class="form-control"></textarea>
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
