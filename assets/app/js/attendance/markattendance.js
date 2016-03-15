$('#user_reason').on('change',function(){
    if($('#user_reason').val() != 'Deputed At Other Location'){
            $('input[type=submit]').removeAttr('disabled');
    }else{
        $('#branch_name_div').removeClass('hidden');
        $('#user_visit_branch').removeAttr('disabled');
            $('input[type=submit]').attr('disabled','disabled');
    }
})

$('#user_visit_branch').keyup(function(){
  if($('#user_visit_branch').val().length >= 15){
          $('input[type=submit]').removeAttr('disabled');
  }
});


$('#edit').click( function () {
  var tbl = table.rows('.danger').data().length;
console.log(tbl);
        if(tbl == 1)
        {
           var data = table.rows('.danger').data();
          var x = data[0];
          console.log(x);
          $.each( x, function( key, value ) {
            var ids = '#'+key;
            $(ids).val(value);
          });
          $('#submit').val('Update');
        }else if(tbl == 0){
             alert('Please Select A row')
        }else{
            alert('Only One row can be upload at time')
        }
    });

 $('#delete').click( function () {
    var tbl = table.rows('.danger').data().length;
    if(tbl != 0)
        {
      var rows = table.rows( '.danger' ).indexes();
      var a = [];
      $.each( rows, function( key, value ) {
        var data = table.row(value).data();
        a.push(data['att_id']);
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
