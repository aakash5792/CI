$('#product_category_id').on('change',function(){
	var url  =  '<?php echo base_url() ?>product/productfeaturemaster/product_sub_category_id/'+this.value;
	$.get(url,function(data){
		
	AppendOption(data,'#product_sub_category_id','product_sub_category_id','product_sub_category_name')
	},'JSON');
})