  <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">

<?php foreach ($main_menu as $keys => $values) { ?>
     <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span><?php echo $values['menu_text'] ?></span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
           <?php   if(count($values['sub_menu']) != 0) { ?>
              <ul class="treeview-menu">

              <?php foreach ($values['sub_menu'] as $key => $value) { ?>
                <li><a href="<?php echo base_url().$value['menu_navigate_url'] ?>"><i class="fa fa-circle-o"></i><?php echo $value['menu_text'] ?></a></li>

              <?php } ?>
            </ul>
<?php } ?>


            </li>
<?php } ?>



     <!--          <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Admin</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/admin/usermaster"><i class="fa fa-circle-o"></i>User Master</a></li>
                <li><a href="/admin/rolemaster"><i class="fa fa-circle-o"></i> Role Master</a></li>
              </ul>
            </li>
             <li class="treeview">
              <a href="#">
                <i class="fa fa-folder"></i> <span>Menu</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="/menu/menucategorymaster"><i class="fa fa-circle-o"></i>Menu Category Master</a></li>
                <li><a href="/menu/menusubcategorymaster"><i class="fa fa-circle-o"></i> Menu Sub Category  Master</a></li>
                <li><a href="/menu/menumaster"><i class="fa fa-circle-o"></i> Menu Master</a></li>
              </ul>
            </li>

 -->

              </ul>
        </section>
        <!-- /.sidebar -->
