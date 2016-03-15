<?php foreach ($dir as $key => $value) { ?>
                    

<div class="col-md-3">
          <div class="box box-success">
            <div class="box-header with-border">
              <h3 class="box-title"><?=$value['file_name'] ?></h3>

              <div class="box-tools pull-right">
                <button data-widget="collapse" class="btn btn-box-tool" type="button"><i class="fa fa-minus"></i></button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <img class="img-responsive" style="height:300px" src="/<?= $file_path =$value['file_path'] ?>" >
            </div>
            <!-- /.box-body -->
             <div class="box-footer">
                                <div class="row">
                                    
                             <div class="col-sm-12">
                                    <input type="button" onclick="delete_file('<?=$file_path ?>')" class="btn btn-danger" value="Delete">
                                    </div>
                                </div>
                            </div>
          </div>
          <!-- /.box -->
        </div>

                   <?php } ?>