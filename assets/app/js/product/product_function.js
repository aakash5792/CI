function add_feature_form_submit(){
var product =$("#product_id option:selected").text().split('-');
var product_id = product[0];
var field_name =$('#field_name').val();
var field_label =$('#field_label').val();
var field_col_sm_ =$('#field_col_sm_').val();
var field_type =$('#field_type').val();
var field_default =$('#field_default').val();
var field_options =$('#field_options').val();
var field_validations =$('#field_validations').val();
var onchange =$('#onchange	').val();
var product_category_id =$('#product_category_id').val();
var product_sub_category_id =$('#product_sub_category_id').val();
var product_name = product[1].trim();



	var url  =  '<?php echo base_url() ?>product/productfeaturemaster/add_feature_form_submit';
	$.post(url,{
		product_id:product_id,
		field_name:field_name,
		field_label:field_label,
		field_col_sm_:field_col_sm_,
		field_type:field_type,
		field_default:field_default,
		field_options:field_options,
		field_validations:field_validations,
		onchange:onchange,
		product_category_id:product_category_id,
		product_sub_category_id:product_sub_category_id,
		product_name:product_name
	 },function(data){
	var product_id =$('#product_id').val();
		var url  =  '<?php echo base_url() ?>product/productfeaturemaster/product_feature_fields/'+product_id;
		$.get(url,function(data){


			$('#product_feature_fields').html(data);
		//console.log(data);
		});

	});
}
