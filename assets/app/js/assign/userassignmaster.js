$('#client_code').on('change',function(){
        //alert(this.value);
        var user_code = "<?php  echo  $_SESSION['user_data']['result'][0]['user_code']; ?>";
          $.post('<?php echo base_url() ?>admin/userassignmaster/client_branch_code',{
                client_code : this.value,
                user_code:user_code
          },function(data){
              console.log(data[0]);

              AppendOption(data,'#client_branch_code','client_branch_code','client_branch_name');

          },'json');


});


 $('#delete').click( function () {
    var tbl = table.rows('.danger').data().length;
    if(tbl != 0)
        {
      var rows = table.rows( '.danger' ).indexes();
      var a = [];
      $.each( rows, function( key, value ) {
        var data = table.row(value).data();
        a.push(data['user_assign_id']);
      });
      $.ajax({
      type: "POST",
      url: '<?php echo $del_url ?>',
      data:  { del_array : a  },
      success: function(data){
        if(data.affected_rows != 0)
        {
            location.reload();
        }
      },
      dataType: "JSON"
    });
    }else{
    alert('Please Select A row')
    }
});


$('#user_role_code').on('change',function(){
        //alert();

        var user_role_code = this.value;
        var client_code = $('#client_code').val();

          $.post('<?php echo base_url() ?>admin/userassignmaster/get_user_list',{
              user_role_code : user_role_code,
              client_code :client_code
          },function(data){
              console.log(data[0]);

              AppendOption(data,'#user_code','user_code','user_name');

          },'json');

});
