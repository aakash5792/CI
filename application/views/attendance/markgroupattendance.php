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
                  

  

<?php   if(strlen($this->session->flashdata('message')) != 0) {?>
<?php include "IncludeViews/msg.php" ?>
<?php }else if(count($GroupAttendanceList) == 0 )  { ?>

  <div class="alert alert-danger">
      Attendance Already Marked For Today's Date
  </div>
<?php } else { ?>
<?php include "IncludeViews/msg.php" ?>
                  <div class="row">
                   <div class="col-xs-12">
                             <div class="box box-default ">
                               <div class="box-header with-border">
                            Mark Group Attendance
                                  <div class="box-tools pull-right">
                                   <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                 </div><!-- /.box-tools -->
                               </div><!-- /.box-header -->
                               <div class="box-body" >
                                 <form role="form" id="markgroupattendance" action="<?php echo base_url() ?>attendance/markgroupattendance/attendance_action/" method="POST">

 <div class="table-responsive" >
<?php //echo '<pre>'.print_r($GroupAttendanceList,true); ?>
<table class="table table-striped table-bordered" id="atta">
  <thead>
   <tr>

         <th>Attendance Date </th>
         <th>Attendance Status </th>
         <th>User Code </th>
         <th>User Name </th>
         <th>Field Executive </th>
         <th>Client Branch Name </th>
         <th>Client Branch Code </th>
         <th>Client Latitude </th>
         <th>Client Longitude </th>
          </tr>
  </thead>
  <tbody>
<?php   foreach ($GroupAttendanceList as $keys => $values) { ?>
<tr>
  <td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][user_name]" value="<?= date('d-m-Y',strtotime($values['att_date'])) ?> "></td>
  <td>
    <select class="form-control" name="user_att_master[<?= $values['user_code'] ?>][attendance_status]">
      <option value="P">Present</option>
      <option value="A">Absent</option>
      <option value="NA">NA</option>
    </select>
  </td>
  <td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][user_code]" value="<?= $values['user_code'] ?>"> </td>

  <td><input type="hidden"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][field_executive]" value="<?= $values['field_executive'] ?>"><?= $values['field_executive'] ?></td>
  

<td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][user_name]" value="<?= $values['user_name'] ?> "></td>
            <td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][client_branch_name]"  value="<?= $values['client_branch_name'] ?>"> </td>
          <td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][client_branch_code]"  value="<?= $values['client_branch_code'] ?>"> </td>
     <td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][client_branch_latitude]"  value="<?= $values['client_branch_latitude'] ?>"> </td>       
     <td><input type="text"  class="form-control" readonly name="user_att_master[<?= $values['user_code'] ?>][client_branch_longitude]"  value="<?= $values['client_branch_longitude'] ?>"> </td>       

</tr>
  <?php  }?>
</tbody>
</table>

  </div>
                            </div>
                                 <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
                                   <input type="submit"  id="submit" name="submit" form="markgroupattendance" class="btn btn-primary" value="save">
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
