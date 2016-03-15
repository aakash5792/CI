$('#file_path').on('change',function(){
	// alert(this.value);
	$.post('<?php echo base_url(); ?>file/file/fileviewajax',{
		file_path : this.value
	},function(data){

		$('#fileviewajax').html(data);
	});
});
