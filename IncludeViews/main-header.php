 <!-- Logo -->
        <a href="#" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>P</b></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><b>Pamac</b></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="/assets/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                  <span class="hidden-xs">  <?php echo $_SESSION['user_data']['result'][0]['user_first_name'].'   '. $_SESSION['user_data']['result'][0]['user_last_name'] ?></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="/assets/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                    <p>
                  <?php echo $_SESSION['user_data']['result'][0]['user_first_name'].'   '. $_SESSION['user_data']['result'][0]['user_last_name'] ?>
                     - <?php echo $_SESSION['user_data']['result'][0]['role_name'] ?>
                      <small>Member since :-   <?php echo date('d-m-Y',strtotime($_SESSION['user_data']['result'][0]['user_created_date'])) ?></small>
                    </p>
                  </li>

                  <li class="user-footer">
                    <!-- <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div> -->
                    <div class="pull-right">
                      <a href="/login/logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
              <li>
                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
              </li>
            </ul>
          </div>
        </nav>
