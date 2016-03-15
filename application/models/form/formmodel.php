<?php

/**
*
*/
class formmodel extends CI_Model
{
	function insert($Input_data){
		foreach ($Input_data['field_type'] as $key => $value) {
			if($value == 12){
			$fields[$Input_data['field_name'][$key]] =  array(
                                                 'type' => 'INT',
                                                 'constraint' => 11,
                                                 'unsigned' => TRUE,
                                                 'auto_increment' => TRUE
                                          );

			$this->dbforge->add_key($Input_data['field_name'][$key], TRUE);

			}else{
			$fields[$Input_data['field_name'][$key]] = $this->fields($value);
		}
	}


		//echo '<pre>'.print_r($fields,true);die();
		$this->dbforge->add_field($fields);
		$this->dbforge->create_table($Input_data['form_table_name'], TRUE);
		//echo '<pre>'.print_r($this->db->last_query(),true);die();

		return $Input_data['form_table_name'];

	}
	function fields($field_type){
		if($field_type != 7 && $field_type != 6 && $field_type != 13 && $field_type != 8 && $field_type != 2)
		{
		echo $sql = "select fm.type,fm.constraint
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
	function field_type(){
		$sql = "select *
		from field_master fm";

		$query = $this->db->query($sql);
		return $query->result_array();

	}
}

?>
