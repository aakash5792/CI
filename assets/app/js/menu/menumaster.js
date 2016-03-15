$('#menu_parent_id').on('change',function(){
  var array = $("#menu_parent_id option:selected").text().split('-');
console.log(array);

$('#menu_text').val(array[1]);
$('#menu_navigate_url').val(array[2]);
$('#menu_sequence').val(array[3]);
$('#menu_product').val(array[4]);


});


 $('#delete').click( function () {
    var tbl = table.rows('.danger').data().length;
    if(tbl != 0)
        {
      var rows = table.rows( '.danger' ).indexes();
      var a = [];
      $.each( rows, function( key, value ) {
        var data = table.row(value).data();
        a.push(data['menu_id']);
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
