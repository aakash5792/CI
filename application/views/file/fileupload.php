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
                               <h3 class="box-title">  <?php echo $page_form_name  ?></h3>
                                <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <!-- /.box-tools -->
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                          
<?php  //echo validation_errors("<div class='alert alert-danger'>","</div>"); ?>
                                <div class="row">
                                    <form role="form" id="usermaster" action="<?php echo base_url() ?>file/file/file_action" method="POST" enctype="multipart/form-data">
                                        <div class="col-sm-8">
                                            <div class="form-group">
                                                <label>Files Path:</label>
                                           <select name="file_path" class="form-control">
   <option value=""></option>
   <?php    foreach ($dir as $key => $value) { ?>
  <option value="<?=   $value['file_path'] ?>"><?=   $value['file_name'] ?></option>
<?php } ?>
</select>
                                            </div>
                                        </div>
                                         <div class="col-sm-4">
                                            <div class="form-group">
                                                <label></label>
                                           <input type="button" class="form-control btn btn-warning" id="file_upload_btn" value="Add File">

                                            </div>
                                        </div>

                                        <div class="col-sm-12">
                                        <table class="table table-striped table-bordered" id="file_upload_table">
                                            <thead>
                                                <tr>
                                                    <th>Files</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <tr id="1">
                                                    <td>
                                                        <div class="form-group">
                                                <label>files:</label>
                                                <input  id="file1" multiple="multiple"  name="files[]" type="file" >
                                            </div></td>
                                                    <td>  <input type="button" class="form-control btn btn-danger delete" id="1" value="Delete">
                                  </td>
                                                </tr>
                                            </tbody>
                                        </table>




                                        </div>

                                    </form>
                                </div>




                            </div>

                            <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
                                    <input type="submit" id="submit" name="submit" form="usermaster" class="btn btn-primary" value="save">
                                    </div>
                             <div class="col-md-3 col-sm-3">
                                    <input type="button" class="btn btn-danger" value="cancel">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
