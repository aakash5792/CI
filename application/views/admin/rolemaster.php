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
                        <div class="box box-default" >
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
                                    <form role="form" id="role_master" action="<?php echo base_url() ?>admin/rolemaster/role_action" method="POST">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Role Name:</label>
                                                <input class="form-control" id="role_name" name="role_name" type="text" value="<?php echo set_value('role_name'); ?>" >
                                                 <?php echo form_error('role_name', '<div class="alert-danger">', '</div>'); ?>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Role Code:</label>
                                                <input class="form-control" id="role_code" name="role_code" type="text"
                                                value="<?php echo set_value('role_code'); ?>" >
                                                 <?php echo form_error('role_code', '<div class="alert-danger">', '</div>'); ?>
                                            </div>
                                        </div>
                                            <div class="col-sm-4">
                                            <div class="form-group">
                                                <label>Role Url:</label>
                                               

                                             

<select class="form-control" id="role_url" name="role_url" >
       <option value=""></option>
         <?php foreach ($url as $key => $value) { ?>
       <option value="<?php echo $url =$value['url'] ?>"

        <?php echo set_select("role_url","$url"); ?>>

        <?php echo $value['text'] ?></option>

                                          <?php  }?>
                                           </select>

                                                 <?php echo form_error('role_url', '<div class="alert-danger">', '</div>'); ?>
                                            </div>
                                        </div>

                                        <div class="col-sm-12">
 <input type="checkbox" id="select_all" > select all

                                    </div>
                                    <div class="col-sm-12">
<?php $i=0;	foreach ($menus as $keys => $values) { ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="checkbox" style="margin-left:15px">
          <input type="checkbox"  class="checkbox"  data-toggle="collapse" data-target="#demo<?php echo $i; ?>" name="menu_id[<?php  echo $values['menu_id']; ?>][role_menu_ids]" id="<?php  echo $values['menu_id']; ?>" value="<?php echo $values['menu_id']; ?>" ><?php  echo $values['menu_text']; ?>
      </div>

    </div>

    <div class="collapse panel-body"  id="demo<?php echo $i; ?>" >
<table class="table table-striped  table-bordered">
   <thead>
       <th>Access</th>
       <th>Menu Id</th>

       <th>Menu Name</th>
       <th>Insert </th>
       <th>Update</th>
       <th>View</th>
       <th>Export</th>
   </thead>
  <tbody>
<?php	foreach ($values['submenu'] as $key => $value) { ?>
  <tr>
<td><input type="checkbox" class="checkbox" name="menu_id[<?php  echo $value['menu_id']; ?>][role_menu_ids]" id="<?php  echo $value['menu_id']; ?>" value="<?php echo $value['menu_id']; ?>" > </td>
<td><?php  echo $value['menu_id']; ?> </td>

 <td><?php  echo $value['menu_text']; ?> </td>

<td><input type="checkbox" class="checkbox" name="menu_id[<?php  echo $value['menu_id']; ?>][role_menu_insert]" id="<?php echo 'Insert_'.$value['menu_id']; ?>" disabled value="Y" > </td>
<td><input type="checkbox" class="checkbox" name="menu_id[<?php  echo $value['menu_id']; ?>][role_menu_update]" id="<?php echo 'Update_'.$value['menu_id']; ?>" disabled value="Y" > </td>
<td><input type="checkbox" class="checkbox" name="menu_id[<?php  echo $value['menu_id']; ?>][role_menu_delete]" id="<?php echo 'View_'.$value['menu_id']; ?>" disabled value="Y" > </td>
<td><input type="checkbox" class="checkbox" name="menu_id[<?php  echo $value['menu_id']; ?>][role_menu_export]" id="<?php echo  'Export_'.$value['menu_id']; ?>" disabled value="Y" > </td>

</tr>
<?php } ?>
  </tbody>
</table>
</div>
  </div>

<?php $i++; } ?>

                                </div>
                                    </form>
                                </div>




                            </div>

                            <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
                                    <input type="submit" id="submit" name="submit" form="role_master" class="btn btn-primary" value="save">
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
