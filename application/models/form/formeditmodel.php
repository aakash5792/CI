<?php

/**
*
*/
class formeditmodel extends CI_Model
{

	function meta_tables(){
		$this->load->dbutil();
        $CI =& get_instance();
        $CI->load->database();
        $database = $CI->db->database;;
		$sql = "select distinct(table_name) as meta_tables
 from information_schema.columns
 where table_schema ='$database'
 and table_name like '%_meta'";

		$query = $this->db->query($sql);
		return $query->result_array();

	}
	public function getmeta($table){
		$this->load->dbutil();
        $CI =& get_instance();
		 $CI->load->database();
        $data['database'] = $CI->db->database;;

		$data['sql'] ="select * from ".$table;
		return $data;
	}
	public function altertable($table,$fields){
		$this->dbforge->modify_column($table, $fields);

	}
	public function alteradd($table,$fields){
		$this->dbforge->add_column($table, $fields);

	}


	function getfieldname($table,$meta_id){
		$sql = "select field_name
		from ".$table."
		where meta_id ='$meta_id' ";
		$query = $this->db->query($sql);
		$data['result'] = $query->result_array();
		$data['num_rows'] = $query->num_rows();

		return $data;
	}
	function insert($table,$Input_data){
		$this->db->insert($table,$Input_data);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		$data['error_message'] = $this->db->_error_message();


		return $data;

	}

	public function update($table,$Input_data,$key){


		$this->db->where($key,$Input_data[$key]);
		unset($Input_data[$key]);
		$this->db->update($table,$Input_data);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['affected_rows'] = $this->db->affected_rows();
		$data['error_message'] = $this->db->_error_message();
		$this->session->set_flashdata('message','Data Successfully Updated and Affected are '.$data['affected_rows']);

		//print_r($data);
		return $data;
	}

	function fields($field_type){
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
		$result = $query->result_array();
		return $result[0];
	}
}

?>
