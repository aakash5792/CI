
 $('#delete').click( function () {
    var tbl = table.rows('.danger').data().length;
    if(tbl != 0)
        {
      var rows = table.rows( '.danger' ).indexes();
      var a = [];
      $.each( rows, function( key, value ) {
        var data = table.row(value).data();
        a.push(data['user_sup_assign_id']);
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



$('#user_client_code').on('change',function(){
      //  alert(this.value);
var client_code = this.value;
          $.post('<?php echo base_url() ?>admin/usersupassignmaster/get_user_list',{
              user_role_code : 'CH',
              client_code :this.value
          },function(data){

$("#user_code option").each(function() {
            $(this).remove();
        });

$("#user_client_branch_code option").each(function() {
            $(this).remove();
        });

              console.log(data[0]['user_client_code']);
var   client_code = data[0]['user_client_code'];
              AppendOption(data,'#user_code','user_code','user_name');
             



          },'json');

});

$('#user_code').on('change',function(){
      //  alert(this.value);
var  client_code = $('#user_client_code').val();
var user_code = this.value;
  //     alert(client_code+user_code);
 $.post('<?php echo base_url() ?>admin/usersupassignmaster/client_branch_code',{
                    user_code : user_code,
                    client_code :   client_code
              },function(data){
                  console.log(data[0]);

                  AppendOption(data,'#user_client_branch_code','client_branch_code','client_branch_name');

  },'json');

 });