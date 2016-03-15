 <?php echo validation_errors('<div class="alert alert-danger">','</div>'); ?> 
              
  <?php  if(strlen($this->session->flashdata('message')) != 0){ ?>
   
   <?php if(isset($msgcolor)) { ?>
          <div class="alert alert-<?= $msgcolor ?>">
   <?php }else { ?>
           <div class="alert alert-success">
      <?php } ?>
  <?= $this->session->flashdata('message'); ?>
       </div>
       <?php } ?>