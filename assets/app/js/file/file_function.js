
function delete_file(file_path){
  //  alert(file_path);
    $.post('<?php echo base_url() ?>file/file/delete_file',{
        file_path : file_path
    },function(data){
        console.log(data);
        //$('#fileviewajax').html(data);
        var file_path = $('#file_path').val();
        console.log(file_path);
        $.post('<?php echo base_url() ?>file/file/fileviewajax',{
        file_path : file_path
            },function(data){
                $('#fileviewajax').html(data);
            });
    },'json');
}
