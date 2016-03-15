<?php


/**
*
*/
class productmastermodel extends CI_Model
{
	public function index(){
		$data['ColumnNames'] =$this->ViewColumnNames("product_master");
		return $data;
	}
	public function field_master()
	{
		$sql ="SELECT  fm.field_id,field_name,type,fm.constraint
			FROM product_feature_field_master pffm ,field_master fm 
			WHERE pffm.field_type = fm.field_type and product_id ='0'";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function productmaster_insert($fields,$Input_data){
		
		$this->db->insert("product_master",$Input_data);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		$table_name = 'z_tbl_product_'.$Input_data['product_category_id'].'_'.$Input_data['product_sub_category_id'].'_'.$data['insert_id'];
		$this->dbforge->add_field($fields); 
		$this->dbforge->create_table($table_name);
		//echo '<pre>'.print_r($this->dbforge,true);die();
		return $data;
	}
	public function productmaster_update($Upd_array,$id){
		$this->db->where('product_id',$Upd_array[$id]);
		unset($Upd_array[$id]);
		$this->db->update('product_master', $Upd_array);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['affected_rows'] = $this->db->affected_rows();
		//print_r($data);
		return $data;
	}

	public function productmaster_delete($Input_data){

		foreach ($Input_data as $keys => $values) {
			foreach ($values as $key => $value) {

			$this->db->where_in("product_id",$value['product_id']);
			$this->db->delete("product_master");
			$data[$key]['product_master_affected_rows'] = $this->db->affected_rows();
			$table_name = 'z_tbl_product_'.$value['product_category_id'].'_'.$value['product_sub_category_id'].'_'.$value['product_id'];
			$this->dbforge->drop_table($table_name);
			$this->db->where_in("product_id",$value['product_id']);
			$this->db->delete("product_feature_field_master");
			$data[$key]['field_master_affected_rows'] = $this->db->affected_rows();
			
			}
		
		}

		return $data;
	}

}

?>
