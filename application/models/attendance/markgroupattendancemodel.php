<?php

/**
 *
 */
class markgroupattendancemodel extends CI_Model
{

  public function GroupAttendanceList($user_code,$user_role_code){
      $att_date=  date("Y-m-d h:i:s");
          $date=  date("Y-m-d");

if($user_role_code == 'SU' || $user_role_code == 'C') {
      $sql ="SELECT  CONCAT(user_first_name,' ',user_last_name) field_executive,
     '$att_date' as att_date,user_name,uam.user_code ,
     cbm.client_branch_name ,uam.client_branch_code,cbm.client_code,
     client_branch_latitude, client_branch_longitude
    FROM  user_assign_master uam,user_master um,client_branch cbm
    WHERE uam.user_code =um.user_code
    and uam.client_branch_code =cbm.client_branch_code
    and uam.user_code not in (select user_code from user_att_master
      where att_date  like '%$date%')
        and
    uam.client_branch_code
    IN (
    	SELECT  user_client_branch_code
    	FROM  user_sup_assign_master
    )";
  }    else{
     $sql ="SELECT  CONCAT(user_first_name,' ',user_last_name) field_executive,
    user_name,uam.user_code ,'$att_date' as att_date,
    cbm.client_branch_name ,uam.client_branch_code,cbm.client_code,
     client_branch_latitude, client_branch_longitude
    FROM  user_assign_master uam,user_master um,client_branch cbm
    WHERE uam.user_code =um.user_code
    and uam.client_branch_code =cbm.client_branch_code
and uam.user_code not in (select user_code from user_att_master
  where att_date  like '%$date%')
    and
    uam.client_branch_code
    IN (
      SELECT  user_client_branch_code
      FROM  user_sup_assign_master
      WHERE  user_code =  '$user_code'
    )";
  }
    $query = $this->db->query($sql);
    return $query->result_array();
  }
  public function index(){
    $data['ColumnNames'] =$this->ViewColumnNames("user_att_master");
    return $data;
  }
  public function attendance_list()
  {
    $sql ="SELECT * FROM user_att_master";
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
    $sql ="SELECT * FROM client_branch
    where client_branch_code in (select client_branch_code
from user_assign_master
where user_code='$user_code') ";
    $query = $this->db->query($sql);
    return $query->result_array();
  }
  public function attendance_insert($Input_data){
    $this->db->insert_batch("user_att_master",$Input_data);
    echo '<pre>'.print_r($this->db->last_query(),true);
    $data['insert_id'] = $this->db->insert_id();
    $data['affected_rows'] = $this->db->affected_rows();
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
