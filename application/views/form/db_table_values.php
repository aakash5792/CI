<div class="row">

                                    <div class="col-sm-1">
                                    <button id="edit" class="btn btn-warning">Edit</button>
                                </div>
                                <div class="col-sm-1">
                                    <button id="delete" class="btn btn-danger">Delete</button>
                                </div> </div>
                                <br>
                              <div class="row">
                                  <div class="col-sm-12">
  <?php include "IncludeViews/msg.php" ?>

                              </div> </div>
                              

<?php if(count($errorInfo[2]) == 0){ ?>
<table id="example1" class="table table-bordered table-hover">
                                       <thead>
                                        <tr>
                                        <?php foreach ($columns as $keys => $values) { ?>
                                            <th><?php echo $values['Field'] ?></th>
                                                <?php } ?>
                                        </tr>
                                       </thead>
                                       <tfoot>
                                        <tr>
                                        <?php foreach ($columns as $keys => $values) { ?>
                                            <th><?php echo $values['Field'] ?></th>
                                                <?php } ?>
                                        </tr>
                                       </tfoot>
                                       <tbody>

                                        </tbody>
                                    </table>
                                    <?php }else{ ?>

 <div class="alert alert-danger">
<?php echo $errorInfo[2]; ?></div>
                                    <?php } ?>
