<?php

/**
*
*/
class LoginModel extends CI_Model
{

	function username_check($username){
		$sql = "SELECT user_id, user_first_name, user_last_name,
		user_mobile_no, user_code, user_client_code, user_name, user_pass,
		 user_login_flag, user_status, user_role_code, user_product_names,
		 user_sec_question, user_sec_answer, role_name,um.user_created_date
		 ,um.user_created_by,um.user_modified_date,um.user_modified_by
		FROM user_master um,user_role_master urm
		WHERE um.user_role_code = urm.role_code
		and user_name	='$username'
		group by role_code
		";
		$query = $this->db->query($sql);
		$data['num_rows'] = $query->num_rows;
		$data['result'] = $query->result_array();
		return $data;
	}
	function login_log($data){
		$this->db->insert('mytable', $data);
	}
	function redirect_page($role_code){
		$sql = "SELECT distinct role_url
		FROM user_role_master urm
		WHERE role_code ='$role_code'
		";
		$query = $this->db->query($sql);

		$result = $query->result_array();
		// echo '<pre>'.print_r($result,true);

		return  $result[0]['role_url'];

	}
}


?>
