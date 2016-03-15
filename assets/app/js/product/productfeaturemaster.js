$('#product_category_id').on('change',function(){
	var url  =  '<?php echo base_url() ?>product/productfeaturemaster/product_sub_category_id/'+this.value;
	$.get(url,function(data){

	AppendOptions(data,'#product_sub_category_id','product_sub_category_id','product_sub_category_name')
	},'JSON');
})

$('#product_sub_category_id').on('change',function(){
	var url  =  '<?php echo base_url() ?>product/productfeaturemaster/product_id/'+this.value;
	$.get(url,function(data){

	AppendOptions(data,'#product_id','product_id','product_name')
	},'JSON');
})

$('#product_id').on('change',function(){
	var url  =  '<?php echo base_url() ?>product/productfeaturemaster/product_feature_fields/'+this.value;
	$.get(url,function(data){
		$('#product_feature_fields').html(data);
	//console.log(data);
	});
})

$('#add_feature').on('click',function(){
	var product_id = $("#product_id").val();
	$("#myModal").modal();
	$("#product_id_1").val(product_id);
})
