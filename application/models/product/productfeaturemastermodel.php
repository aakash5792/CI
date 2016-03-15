<?php


/**
*
*/
class productfeaturemastermodel extends CI_Model
{

	public function index(){
		$data['ColumnNames'] =$this->ViewColumnNames("product_sub_category");
		return $data;
	}
	public function product_category_id()
	{
		$sql ="SELECT * FROM product_category";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function product_sub_category_id($product_category_id)
	{
		$sql ="SELECT * FROM product_sub_category WHERE product_category_id ='$product_category_id'";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function product_id($product_sub_category_id)
	{
		$sql ="SELECT * FROM product_master WHERE product_sub_category_id ='$product_sub_category_id'";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function field_type()
	{
		$sql ="SELECT * FROM field_master";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function product_feature_fields_details($product_id)
	{
		   $sql ="SELECT  @row:=@row+1,  field_name, field_label, field_type, form_show, form_order, field_options, field_col_sm_, field_validations, form_app_show, form_import_show, onchange, dependon, field_property
			 FROM(SELECT   field_name, field_label, field_type, form_show, form_order, field_options, field_col_sm_, field_validations, form_app_show, form_import_show, onchange, dependon, field_property
			 FROM product_meta WHERE form_show='1'
				union all
			SELECT  field_name, field_label, field_type, form_show, form_order, field_options, field_col_sm_, field_validations, form_app_show, form_import_show, onchange, dependon, field_property
			 FROM product_feature_field_meta
			WHERE table_name ='$product_id')as ds,(select @row:=0 )as a
			order by form_order
			";
			$query = $this->db->query($sql);
		return $query->result_array();
	}



	public function productfeaturemaster_insert($Input_data){
 $table_name = 'z_tbl_product_'.$Input_data['product_category_id'].'_'.$Input_data['product_sub_category_id'].'_'.$Input_data['product_id'];
unset($Input_data['product_id']);
unset($Input_data['product_name']);
unset($Input_data['product_category_id']);
unset($Input_data['product_sub_category_id']);
//	echo '<pre>'.print_r($Input_data,true);
 echo $field_type =$Input_data['field_type'];
if($field_type != 7 && $field_type != 6 && $field_type != 13 && $field_type != 8 && $field_type != 2)
		{
		$sql = "select fm.type,fm.constraint
		from field_master fm
		where field_id ='$field_type' ";
	}else{
		$sql = "select fm.type
		from field_master fm
		where field_id ='$field_type' ";
	}
	$query = $this->db->query($sql);
 $data = $query->result_array();
$fields[$Input_data['field_name']] = $data[0];

//echo '<pre>'.print_r($data,true);die();

$this->dbforge->add_column($table_name,$fields);
	//echo '<pre>'.print_r($this->db->last_query(),true);
$this->db->insert("product_feature_field_meta",$Input_data);
//echo '<pre>'.print_r($this->db->last_query(),true);

 $data['insert_id'] = $this->db->insert_id();
 $data['affected_rows'] = $this->db->affected_rows();
 return $data;
	}

	public function productfeaturemaster_update($Upd_array,$id){
		$this->db->where('product_sub_category_id',$Upd_array[$id]);
		unset($Upd_array[$id]);
		$this->db->update('product_sub_category', $Upd_array);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['affected_rows'] = $this->db->affected_rows();
		//print_r($data);
		return $data;
	}

	public function productfeaturemaster_delete($del_array){
		$this->db->where_in("product_sub_category_id",$del_array);
		$this->db->delete("product_sub_category");
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}

}

?>
