<?php


/**
*
*/
class productcategorymodel extends CI_Model
{
	public function index(){
		$data['ColumnNames'] =$this->ViewColumnNames("product_category");
		return $data;
	}
	public function productcategory_list()
	{
		$sql ="SELECT * FROM product_category";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function productcategory_insert($Input_data){
		$this->db->insert("product_category",$Input_data);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}
	public function productcategory_update($Upd_array,$id){
		$this->db->where('product_category_id',$Upd_array[$id]);
		unset($Upd_array[$id]);
		$this->db->update('product_category', $Upd_array);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['affected_rows'] = $this->db->affected_rows();
		//print_r($data);
		return $data;
	}

	public function productcategory_delete($del_array){
		$this->db->where_in("product_category_id",$del_array);
		$this->db->delete("product_category");
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}

}

?>
