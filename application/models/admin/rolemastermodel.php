<?php


/**
*
*/
class rolemastermodel extends CI_Model
{
	public function index(){
		$data['ColumnNames'] =[
		['Field' =>	'role_name'],
		['Field' =>	'role_code'],
		['Field' =>	'role_url'],
		];
		

		return $data;
	}
	public function rolemaster_list()
	{
		$sql ="SELECT
		distinct  role_name, role_code,role_url
		FROM  user_role_master rm";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function role_code_menus($role_code)
	{
		$sql ="SELECT role_id, role_name, role_code,role_url,
		role_menu_ids, role_menu_insert, role_menu_update,
		role_menu_delete, role_menu_export
		FROM user_role_master WHERE
		role_code='$role_code'";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function menus()
	{
		$sql = "select * from menu_master";
		$query = $this->db->query($sql);
		return $query->result_array();

	}

	public function menu_category()
	{
		$sql = "select * from menu_master where menu_parent_id='0' ";
		$query = $this->db->query($sql);
		return $query->result_array();

	}
	public function menu_sub_category($menu_category_id)
	{
		$sql = "select * from menu_master where menu_parent_id='$menu_category_id' ";
		$query = $this->db->query($sql);
		return $query->result_array();

	}


	public function role_insert($Input_data){
		$this->db->insert_batch("user_role_master",$Input_data);
		//echo json_encode($this->db->last_query());
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}
	public function role_update($Upd_array,$id){
		$this->db->where_in("role_code",$id);
		$this->db->delete("user_role_master");
		//echo json_encode($this->db->last_query());
		$this->role_insert($Upd_array);
	}

	public function role_delete($del_array){
		$this->db->where_in("role_code",$del_array);
		$this->db->delete("user_role_master");
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}

}

?>
