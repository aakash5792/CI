<?php

/**
 *
 */
class userassignmastermodel extends CI_Model
{
  public function index(){
      $user_code =$_SESSION['user_data']['result'][0]['user_code'];
    $user_client_code =$_SESSION['user_data']['result'][0]['user_client_code'];
    
    $user_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
    if($user_role_code =='SU'){ 
    $sql = "SELECT user_assign_id, client_code, 
    client_branch_code, user_code, user_role_code
    FROM user_assign_master";
            }else
            if($user_role_code =='C'){ 
    $sql = "SELECT user_assign_id, client_code, 
    client_branch_code, user_code, user_role_code
    FROM user_assign_master where client_code='$user_client_code'";
            }else {
                $sql = "SELECT user_assign_id, client_code, client_branch_code, user_code, user_role_code
    FROM user_assign_master WHERE user_created_by='$user_code'";
            }
            return $sql;
  }
  public function user_role_code()
  {      
              $user_code =$_SESSION['user_data']['result'][0]['user_code'];
    
    $user_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
 
                $sql = "SELECT distinct role_code,role_name  FROM user_role_master WHERE role_code in ('FS')";
 
    $query = $this->db->query($sql);
    return $query->result_array();
  }
  public function user_insert($Input_data){
    $this->db->insert_batch("user_assign_master",$Input_data);
    echo json_encode($this->db->last_query());
    //$data['insert_id'] = $this->db->insert_id();
    //$data['affected_rows'] = $this->db->affected_rows();
    //return $data;
  }
  public function user_delete($del_array){
    $this->db->where_in("user_assign_id",$del_array);
    $this->db->delete("user_assign_master");
    $data['affected_rows'] = $this->db->affected_rows();
    return $data;
  }
  public function user_client_code(){
        $user_client_code =$_SESSION['user_data']['result'][0]['user_client_code'];
    
    $user_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
    if($user_role_code =='SU'){ 
    $sql = "SELECT *
    FROM client_master";
            }else{
                $sql = "SELECT *
    FROM client_master WHERE client_code ='$user_client_code'";
            }
    
    $query = $this->db->query($sql);
    return $query->result_array();
  }

  public function client_branch_code($client_code,$user_code){

      $user_code =$_SESSION['user_data']['result'][0]['user_code'];
      $user_client_code =$_SESSION['user_data']['result'][0]['user_client_code'];
    
    $user_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
    if($user_role_code =='SU'){ 
    $sql = "SELECT *
    FROM client_branch WHERE client_code='$client_code'";
            }else if($user_role_code =='C'){ 


    $sql = "SELECT *
    FROM client_branch WHERE client_code='$client_code'";
           
            }else {
                $sql = "SELECT *
    FROM client_branch WHERE user_created_by='$user_code'";
            }



    $query = $this->db->query($sql);
    return $query->result_array();
  }
  public function get_user_list($client_code,$user_role_code){
    $user_code =$_SESSION['user_data']['result'][0]['user_code'];
    
    $session_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];

    if($user_role_code == 'FS' &&  $session_role_code == 'CH'){
    $sql ="SELECT *
               FROM user_master
               WHERE user_client_code='$client_code'
               AND user_role_code='$user_role_code'
               and user_code not in (select user_code from user_assign_master)
               and user_created_by='$user_code'";
             }else if($user_role_code == 'FS' &&  $session_role_code == 'C'){
    $sql ="SELECT *
               FROM user_master
               WHERE user_client_code='$client_code'
 AND user_role_code='$user_role_code'
               and user_code not in (select user_code from user_assign_master)
             ";
             }else {
               $sql ="SELECT *
                          FROM user_master
                          WHERE user_client_code='$client_code'
                          AND user_role_code='$user_role_code'
                          AND user_code NOT IN(SELECT user_code from user_assign_master) 
                          ";
             }
    $query = $this->db->query($sql);
    return $query->result_array();
  }


}


 ?>
