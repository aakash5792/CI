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


  <?php if(strlen($this->session->flashdata('message')) == 0)  { ?>
                  <?php if($user_code_count != 0 ) { ?>
                    <div class="alert alert-danger">
                        Attendance Already Marked For Today's Date
                    </div>
                  <?php  }else { ?>
                  <div class="row">
                   <div class="col-xs-12">
                             <div class="box box-default ">
                               <div class="box-header with-border">
                               <a href="#" data-toggle = "tooltip"
      title = "Click This button to get latitude and longitude" class="btn btn-primary tooltip-show" class="btn btn-primary tooltip-show" onclick="getLocationUser()">Get Location</a>

        <a href="#" class="btn btn-primary" onclick="getLocationDiff()">Check Distance</a>

                                  <div class="box-tools pull-right">
                                   <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                 </div><!-- /.box-tools -->
                               </div><!-- /.box-header -->
                               <div class="box-body" >

                                <?php // echo validation_errors("<div class='alert alert-danger'>","</div>"); ?>
                            <form role="form" id="clientmaster" action="<?php echo base_url() ?>attendance/markattendance/attendance_action/" method="POST">
                         <div class="row">
 <div class="col-sm-4">
<div class="form-group">
  <?php $clientmaster = $client_master[0]; ?>
  <label>Branch Code</label>
  <input type="hidden" readonly class="form-control" name="client_code" id="client_code" value="<?= $clientmaster['client_code'] ?>" >

  <input type="text" readonly class="form-control" name="client_branch_code" id="client_branch_code" value="<?= $clientmaster['client_branch_code'] ?>" >
</div>
</div> <div class="col-sm-4">

<div class="form-group">
  <label>Branch Name</label>
  <input type="text"  readonly class="form-control" name="client_branch_name" id="client_branch_name" value="<?= $clientmaster['client_branch_name'] ?>" >

</div>
</div>
 <div class="col-sm-6">
<div class="form-group">
   <label>Latitude:</label>
  <input type="text"  readonly class="form-control" name="client_branch_latitude" id="client_branch_latitude"
  value="<?= $clientmaster['client_branch_latitude'] ?>" >
 </div>
 </div> <div class="col-sm-6">
 <div class="form-group">
   <label>Longitude:</label>
  <input type="text" readonly   class="form-control" name="client_branch_longitude" id="client_branch_longitude"    value="<?= $clientmaster['client_branch_longitude'] ?>" >
</div>  </div>

 <div class="col-sm-6">
<div class="form-group">
  <label>User Code:</label>
  <input type="text"  readonly  class="form-control" name="user_code"  id="user_code"  value="<?= $user_code ?>" >
</div>
</div>





          <div class="col-sm-6">
 <div class="form-group">
   <label>User Name:</label>
  <input type="text"  readonly  class="form-control" name="user_name"  id="user_name" value="<?= $user_name ?>" >
</div></div>
<div class="col-sm-6">
<div class="form-group">
<label>Attendance Status:</label>
<input type="text"  readonly  class="form-control" name="attendance_status"  id="attendance_status"  value="P" >


</div></div>
<div class="col-sm-6">
<div class="form-group">
<label>Field Executive:</label>
<input type="text"  readonly  class="form-control" name="field_executive"  id="field_executive"  value="<?= $clientmaster['field_executive'] ?>" >
</div></div>
          <div class="col-sm-6">
<div class="form-group">
  <label>User Latitude:</label>
  <input type="text"  readonly  class="form-control" name="user_latitude"  id="user_latitude"  >
</div>
</div>

          <div class="col-sm-6">
 <div class="form-group">
   <label>User Longitude:</label>
  <input type="text"  readonly  class="form-control" name="user_longitude"  id="user_longitude" >
</div></div>
<div class="col-sm-4">
<div class="form-group">
  <label>User Accuracy:</label>
  <input type="text"  readonly  class="form-control" name="user_accuracy"  id="user_accuracy"  >
</div>
</div>

          <div class="col-sm-4">
 <div class="form-group">
   <label>User Radius:</label>
  <input type="text"  readonly  class="form-control" name="user_radius"  id="user_radius" >
</div></div>
     <div class="col-sm-4">
 <div class="form-group">
   <label>User Address:</label>
  <input type="text"  readonly  class="form-control" name="user_address"  id="user_address" >
</div></div>


 <div class="col-sm-12 hidden" id="user_reason_div">
 <div class="form-group">
   <label>User Reason:<span style="color:red">Please enter a note why u are here and it must of minimum 30 alphabets at least</span></label>
  <select class="form-control" disabled name="user_reason"  id="user_reason" >
    <option value=""></option>

  <option value="Field Activity for the day">Field Activity for the day</option>
  <option value="Deputed At Other Location" >Deputed At Other Location</option>
  <option value="Location Error">Location Error</option>

  </select>

</div></div>

<div class="col-sm-12">
<div class="form-group hidden" id="branch_name_div">
<label>Branch Name:</label>
<input type="text"  disabled  class="form-control" name="user_visit_branch"  id="user_visit_branch" >
</div></div>






                              </div></div>
                                 <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
                                   <input type="submit" disabled id="submit" name="submit" form="clientmaster" class="btn btn-primary" value="save">
                                    </div>
                             <div class="col-md-3 col-sm-3">
                                    <input type="button" class="btn btn-danger" value="cancel">
                                    </div>

                          </div>
                   </div>
                 </div>
          </div>
  </div>

    <?php } ?>

  <?php } ?>



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
