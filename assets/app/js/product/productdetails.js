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

	var product =$("#product_id option:selected").text().split('-');
	var product_id = product[0];
	var product_name = product[1].trim();
	var product_category_id =$("#product_category_id").val();
	var product_sub_category_id =$("#product_sub_category_id").val();

	var url  =  '<?php echo base_url() ?>product/productfeaturemaster/product_feature_fields_details/'+this.value;
	$.post(url,{
product_name:product_name,
product_category_id:product_category_id,
product_sub_category_id:product_sub_category_id
	},function(data){
		$('#product_feature_fields').html(data);
	//console.log(data);
	});
})

$('#add_feature').on('click',function(){
	var product_id = $("#product_id").val();
	$("#myModal").modal();
	$("#product_id_1").val(product_id);
})
