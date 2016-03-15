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
             
 <div class="row">
                  <div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title">  Table Meta List</h3>
                                   <div class="box-tools pull-right">
                                 
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <div class="form-group">
<label>Meta Tables</label>
                                    <select class="form-control"  form="<?= $class ?>" id="meta_tables" name="meta_tables" onchange="getmeta('meta_tables')">
      <option value=""></option>
   
     <?php 


     foreach ($meta_tables as $keys => $values) {

           ?>
            <option value="<?= $values['meta_tables']; ?>"><?= $values['meta_tables']; ?></option>
          <?php } ?>



      </select>
</div>
</div>
</div>
</div>
</div>

               <div class="row">
                  <div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title">  <?php
echo $page_form_name;
?></h3>
                                   <div class="box-tools pull-right">
                                 
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">
                  <?php include "IncludeViews/form-1.php" ?>
                  
                                    </div>


                                     <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
          <input type="button" id="submit" name="submit" form="<?= $class ?>" class="btn btn-primary" value="<?php
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

               </div>
               <div class="row">
                  <div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title">  <?php
echo $page_list_name;
?></h3>
                                   <div class="box-tools pull-right">
                                   
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">   <div class="table-responsive" id="new_table">

                                                    </div>
                                                    </div>
                                                    </div >
              
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