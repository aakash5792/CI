$('#submit').click(function(){
	

	var fields = $( ":input, :checkbox ,:radio" ).serializeArray();
	

var submit =this.value; 
	
	$.post('/form/formedit/formedit_action',{
		fields : fields,
		submit : submit

	},function(data){
		//console.log(data);
		var meta_table =$('#meta_tables').val();
		//console.log(meta_table);
		$( ":input " ).val('');

$( ":input " ).prop('checked', false)
$('#meta_tables').val(meta_table);
$('#submit').val('save');
		//var meta_table = $('#meta_tables').val();
	//	alert('meta_table'); 
		getmeta('meta_tables');
	},'json');




})