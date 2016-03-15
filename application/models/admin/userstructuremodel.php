<?php


/**
*
*/
class userstructuremodel extends CI_Model
{
	public function index(){
		$data['ColumnNames'] =$this->ViewColumnNames("user_structure");
		return $data;
	}
	public function user_list()
	{
		$sql ="SELECT * FROM user_structure";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function user_parent_id(){
		$sql ="SELECT * FROM user_structure";
		$query = $this->db->query($sql);
		return $query->result_array();
}
public function user_parent_ids(){
	 $sql ="select distinct user_parent_id from user_structure";
	$query = $this->db->query($sql);
	return $query->result_array();
}

public function get_child($user_parent_id){
	  $sql ="select * from user_structure where user_parent_id='$user_parent_id' ";
		//  $result = mysql_query($sql);
		//  $num_rows = mysql_num_rows($result);
		//  if($num_rows != 0){
		//  while ($row = mysql_fetch_assoc($result)) {
		//  					$result_array[$row['user_struct_id']] =$row;
		//  }}else{
		// 	 		 $result_array = array();
		//  }
		// return $result_array;
		$query = $this->db->query($sql);
		return $query->result_array();
}
	public function user_insert($Input_data){
		$data =$this->db->insert("user_structure",$Input_data);

		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}
	public function user_update($Upd_array,$id){
		$this->db->where('user_struct_id',$Upd_array[$id]);
		unset($Upd_array[$id]);
		$this->db->update('user_structure', $Upd_array);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['affected_rows'] = $this->db->affected_rows();
		//print_r($data);
		return $data;
	}
	public function user_name_chk($user_name){
		$sql ="SELECT * FROM user_structure where user_name ='$user_name'";
		$query = $this->db->query($sql);
		$data['num_rows'] = $query->num_rows;
		$data['result'] = $query->result_array();
		return $data;
	}
	public function user_delete($del_array){
		$this->db->where_in("user_struct_id",$del_array);
		$this->db->delete("user_structure");
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}

}

?>
