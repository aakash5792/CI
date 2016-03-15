<div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title">Product Feature Table</h3>
                                   <div class="box-tools pull-right">
                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                  <?php include "IncludeViews/msg.php" ?>

                                  <br>
                                   <div class="table-responsive">
                                      <table id="example1" class="table table-bordered table-hover">
                                       <thead>
                                        <tr>
                                        <?php foreach ($columns_header as $keys => $values) { ?>
                                            <th><?php echo $values ?></th>
                                                <?php } ?>
                                        </tr>
                                       </thead>
                                  
                                       <tbody>

                                        </tbody>
                                    </table>
                                    </div>
                                    </div>

                                </div>
                            </div>
