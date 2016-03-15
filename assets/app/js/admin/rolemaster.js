


$( "input[type=checkbox]" ).on( "click", function(){
   //alert($(this).is(':checked'));
     var id = this.id;
   var Insert_ ='#Insert_'+id;
   var Update_ ='#Update_'+id;
   var View_ ='#View_'+id;
   var Export_ ='#Export_'+id;
   if($(this).is(':checked'))
    {


    $(Export_).prop('checked',true).removeAttr('disabled');
   $(Insert_).prop('checked',true).removeAttr('disabled');
   $(Update_).prop('checked',true).removeAttr('disabled');
   $(View_).prop('checked',true).removeAttr('disabled');



}else{

   $(Export_).removeAttr('checked');
   $(Insert_).removeAttr('checked');
   $(Update_).removeAttr('checked');
   $(View_).removeAttr('checked');


 }



});



$('#select_all').click( function () {

  var collapselenth = $('.collapse').length;

  for (var i = 0; i < collapselenth; i++) {
          var d = '#demo'+i;
        $(d).collapse();
  }

var length = $('.checkbox').length;

if($(this).is(':checked'))
 {
   //alert('check');
   for (var i = 0; i < length; i++) {
   $('.checkbox').removeAttr('disabled');
   $('.checkbox').attr('checked',true);
 }

 }else{
   //alert('uncheck');
   for (var i = 0; i < length; i++) {

   $('.checkbox').removeAttr('checked');
//    $('.checkbox').attr('disabled','disabled');
}

 }

});

$('#edit').click( function () {


var collapselenth = $('.collapse').length;

for (var i = 0; i < collapselenth; i++) {
        var d = '#demo'+i;
      $(d).collapse();
}

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

          $.each( x['menus'], function( key, value ) {

              var id ='#'+value['role_menu_ids'];
              var Insert_ ='#Insert_'+value['role_menu_ids'];
              var Update_ ='#Update_'+value['role_menu_ids'];
              var View_ ='#View_'+value['role_menu_ids'];
              var Export_ ='#Export_'+value['role_menu_ids'];



$(id).removeAttr('disabled',true);
$(id).attr('checked',true);
$(Insert_).removeAttr('disabled',true);
$(Update_).removeAttr('disabled',true);
$(View_).removeAttr('disabled',true);
$(Export_).removeAttr('disabled',true);

        if(value['role_menu_insert'] == 'Y')
        {
              $(Insert_).attr('checked',true);
        }
        if(value['role_menu_update'] == 'Y')
        {
           $(Update_).attr('checked',true);
        }

        if(value['role_menu_delete'] == 'Y')
        {
            $(View_).attr('checked',true);
        }

         if(value['role_menu_export'] == 'Y')
        {
            $(Export_).attr('checked',true);
        }







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
        a.push(data['role_code']);
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
