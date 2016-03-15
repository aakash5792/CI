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
                  <?php  //echo validation_errors("<div class='alert alert-danger'>","</div>"); ?>

                  <div class="row">
                    <form role="form" id="reviewattendance" action="<?php echo base_url() ?>attendance/markattendance/attendance_update/" method="POST">

<div class="col-sm-2">
  <div class="form-group">
      <label>Attendance Id:</label>
      <input type="text" readonly class="form-control" id="att_id" name="att_id">
  </div>
</div>
<div class="col-sm-3">
  <div class="form-group">
      <label>Attendance Date:</label>
      <input type="text"  readonly class="form-control" id="att_date" name="att_date">
  </div>
</div>
<div class="col-sm-3">
  <div class="form-group">
      <label>Client Name:</label>
      <input type="text" readonly class="form-control" id="client_name" name="client_name">
  </div>
</div>
<div class="col-sm-4">
  <div class="form-group">
      <label>Client Branch Code:</label>
      <input type="text" readonly class="form-control" id="client_branch_code" name="client_branch_code">
  </div>
</div>
<div class="col-sm-3">
  <div class="form-group">
      <label>Client Branch Name:</label>
      <input type="text"  readonly class="form-control" id="client_branch_name" name="client_branch_name">
  </div>
</div>
<div class="col-sm-3">
  <div class="form-group">
      <label>Client Branch Process:</label>
      <input type="text" readonly class="form-control" id="client_branch_process" name="client_branch_process">
  </div>
</div>
<div class="col-sm-3">
  <div class="form-group">
      <label>Client Latitude:</label>
      <input type="text" readonly class="form-control" id="client_latitude" name="client_latitude">
  </div>
</div>
<div class="col-sm-3">
  <div class="form-group">
      <label>Client Longitude:</label>
      <input type="text" readonly class="form-control" id="client_longitude" name="client_longitude">
  </div>
</div>
<div class="col-sm-2">
  <div class="form-group">
      <label>User Code:</label>
      <input type="text" readonly class="form-control" id="user_code" name="user_code">
  </div>
</div>
<div class="col-sm-6">
  <div class="form-group">
      <label>Field Executive:</label>
      <input type="text" readonly class="form-control" id="field_executive" name="field_executive">
  </div>
</div>
<div class="col-sm-4">
  <div class="form-group">
      <label>Attendance Status:</label>
      <select class="form-control"  id="attendance_status" name="attendance_status">
        <option value="P">Present</option>
        <option value="A">Absent</option>
        <option value="NA">NA</option>
      </select>
    </div>
</div>
<div class="col-sm-4">
  <div class="form-group">
      <label>User Name:</label>
      <input type="text" readonly class="form-control" id="user_name" name="user_name">
  </div>
</div>
<div class="col-sm-2">
  <div class="form-group">
     <label>User Latitude:</label>
      <input type="text" readonly class="form-control" id="user_latitude" name="user_latitude">
  </div>
</div>
<div class="col-sm-2">
  <div class="form-group">
       <label>User Longitude:</label>
      <input type="text" readonly class="form-control" id="user_longitude" name="user_longitude">
  </div>
</div>
<div class="col-sm-2">
  <div class="form-group">
 <label>User Accuracy:</label>
      <input type="text" readonly class="form-control" id="user_accuracy" name="user_accuracy">
  </div>
</div>
<div class="col-sm-2">
  <div class="form-group">
   <label>User Radius:</label>
      <input type="text" readonly class="form-control" id="user_radius" name="user_radius">
  </div>
</div>
<div class="col-sm-12">
  <div class="form-group">
 <label>User Address:</label>
      <input type="text" readonly class="form-control" id="user_address" name="user_address">
  </div>
</div>
<div class="col-sm-6">
  <div class="form-group">
     <label>User Reason:</label>
      <input type="text" readonly class="form-control" id="user_reason" name="user_reason">
  </div>
</div>
<div class="col-sm-6">
  <div class="form-group">
    <label>Branch Name:</label>
      <input type="text" readonly class="form-control" id="user_visit_branch" name="user_visit_branch">
  </div>
</div>
</form>
</div>


                                              </div>

                                              <div class="box-footer">
                                                  <div class="row">
                                                      <div class="col-md-6 col-sm-3">
                                                      <input type="submit" id="submit" name="submit" form="reviewattendance" class="btn btn-primary" value="save">
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

                                  <?php include "IncludeViews/datatable.php" ?>

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
