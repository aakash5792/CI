<div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title"><?php echo $page_list_name ?></h3>
                                   <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <div class="row">
                                      <?php if($page_access_controls['role_menu_update'] != 'N') { ?>
                                    <div class="col-sm-1">
                                    <button id="edit" class="btn btn-warning">Edit</button>
                                </div>
                                <?php } ?>
                                 <?php if($page_access_controls['role_menu_delete'] != 'N') { ?>
                                <div class="col-sm-1">
                                    <button id="delete" class="btn btn-danger">Delete</button>
                                </div>
                                <?php } ?>


                              </div>

                                  <br>
                                   <div class="table-responsive">
                                      <table id="example1" class="table table-bordered table-hover">
                                       <thead>
                                        <tr>
                                        <?php foreach ($form_fields as $keys => $values) { ?>
                                            <th><?= $values['field_label'] ?></th>
                                                <?php } ?>
                                        </tr>
                                       </thead>
                                       <tfoot>
                                        <tr>
                                        <?php foreach ($form_fields as $keys => $values) { ?>
                                            <th><?= $values['field_label'] ?></th>
                                                <?php } ?>
                                        </tr>
                                       </tfoot>
                                       <tbody>

                                        </tbody>
                                    </table>
                                    </div>
                                    </div>

                                </div>
                            </div>
