  <div class="col-xs-12">
                              <div class="box box-default ">
                                <div class="box-header with-border">
                                  <h3 class="box-title">  <?php
echo $page_form_name;
?></h3>
                                   <div class="box-tools pull-right">
                                     <a href='<?= $csv_path ?>' class="btn btn-sm btn-danger" >CSV Download</a>

                                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                  </div><!-- /.box-tools -->
                                </div><!-- /.box-header -->
                                <div class="box-body">
                  <?php include "IncludeViews/form-1.php" ?>
                  
                                    </div>


                                     <div class="box-footer">
                                <div class="row">
                                    <div class="col-md-6 col-sm-3">
                                    <input type="submit" id="submit" name="submit" form="<?= $class ?>" class="btn btn-primary" value="<?php
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