<?php


/**
*
*/
class markattendancemodel extends CI_Model
{
	public function index(){
		  $user_code=$_SESSION['user_data']['result'][0]['user_code'];
         $user_client_code =$_SESSION['user_data']['result'][0]['user_client_code'];
      
          $user_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
    		
		if($user_role_code == 'SU') {
    		 $sql ="SELECT att_id, att_date, client_code,
    		  client_branch_code, client_branch_name, 
    		  client_branch_latitude, 
    		 client_branch_longitude, user_code, field_executive,
    		  attendance_status, user_name, user_latitude,
    		   user_longitude, user_accuracy, 
    		 user_radius, user_address, user_reason, 
    		 user_visit_branch FROM user_att_master";
    }else if($user_role_code == 'C') {
          $sql ="SELECT  att_id, att_date, client_code,
          client_branch_code, client_branch_name, 
           client_branch_latitude,
           client_branch_longitude, user_code, field_executive,
            attendance_status, user_name, user_latitude,
             user_longitude, user_accuracy,
          user_radius, user_address, user_reason, user_visit_branch FROM user_att_master where client_code='$user_client_code'";
    }else{
    	$sql ="SELECT  att_id, att_date, client_code, client_branch_code, client_branch_name,  client_branch_latitude, client_branch_longitude, user_code, field_executive, attendance_status, user_name, user_latitude, user_longitude, user_accuracy,
    	 user_radius, user_address, user_reason, user_visit_branch FROM user_att_master where client_branch_code in
    	(select user_client_branch_code
    		from user_sup_assign_master
    		where user_code='$user_code')";

    }
    return $sql;
	}
	public function attendance_list()
	{
		$user_code= $_SESSION['user_data']['result'][0]['user_code'];
		$user_role_code= $_SESSION['user_data']['result'][0]['user_role_code'];

		if($user_role_code == 'SU') {
		$sql ="SELECT * FROM user_att_master";
}else{
	$sql ="SELECT * FROM user_att_master where client_branch_code in
	(select user_client_branch_code
		from user_sup_assign_master
		where user_code='$user_code')";

}


		$query = $this->db->query($sql);
		return $query->result_array();
	}


 public function user_code_count($user_code){
	 $date = date('Y-m-d');
		 $sql ="SELECT * FROM user_att_master
where user_code='$user_code' and att_date like '%$date%' ";
	 $query = $this->db->query($sql);
	 return $query->num_rows;

 }
	public function client_master($user_code)
	{
	 	$sql ="SELECT client_branch_id, client_code, client_branch_code, client_branch_name,
	 	  client_branch_latitude, client_branch_longitude, client_branch_address, 
	 	client_branch_accuracy, client_branch_radius,
CONCAT(user_first_name,' ',user_last_name) field_executive
FROM client_branch cbm ,user_master um
where
cbm.client_code = um.user_client_code
and user_code='$user_code'
and
client_branch_code in (select client_branch_code
from user_assign_master
where user_code='$user_code') ";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function attendance_insert($Input_data){
		$this->db->insert("user_att_master",$Input_data);
		echo '<pre>'.print_r($this->db->last_query(),true);
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}
	public function attendance_update($Upd_array,$id){
		$this->db->where('att_id',$Upd_array[$id]);
		unset($Upd_array[$id]);
		$this->db->update('user_att_master', $Upd_array);
//		echo '<pre>'.print_r($this->db->last_query(),true);

		$data['affected_rows'] = $this->db->affected_rows();
		//print_r($data);
		return $data;
	}

	public function attendance_delete($del_array){
		$this->db->where_in("att_id",$del_array);
		$this->db->delete("user_att_master");
		$data['affected_rows'] = $this->db->affected_rows();
		return $data;
	}

}

?>
