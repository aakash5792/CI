
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
