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
    alert(tbl);
    if(tbl != 0)
        {
      var rows = table.rows( '.danger' ).indexes();
      var a = [];
      $.each( rows, function( key, value ) {
        var data = table.row(value).data();
        a.push(data['product_category_id']);
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
