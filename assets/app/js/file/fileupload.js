
var file_count = 2;

$('#file_upload_btn').on('click',function(){
	
	$('#file_upload_table tr:last').after('<tr><td><div class="form-group">'+
                                                '<label>files:</label>'+
                                                '<input type="file" name="files[]" id="file'+file_count+'" >'+
                                            '</div></td>'+
                '<td>'+ 
'<div class="form-group">'+
        '<label></label>'+
 '<input type="button" class="form-control btn btn-danger" id="file_upload_btn" value="Delete">'+
     '</div></td>'+
                                                '</tr>');
	file_count++;
});


$('.delete').on('click',function(){
    alert('hi'+this.id);
        if($("#file_upload_table tr").length != 2){
var trid ='#file_upload_table tr#'+this.id;
alert(trid);
     $(trid).remove();
 }else{
    alert("You cannot delete all ");
 }

})