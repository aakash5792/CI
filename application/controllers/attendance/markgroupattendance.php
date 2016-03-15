<?php

/**
 *
 */
class markgroupattendance extends CI_Controller
{
     public function __construct(){
    parent::__construct();
    if(!isset($_SESSION['user_data']) && !isset($_COOKIE['user_data']) )
    {
      //echo 'session is not set';
      redirect(base_url().'login');
    }else{
      $cookie =$_COOKIE['user_data'];
      $_SESSION['user_data'] = json_decode($cookie,true);
      //echo '<pre>'.print_r($_SESSION,true);die();
    }
    //unset($_SESSION['user_data']);
    $this->load->helper('file');
    $this->load->model('common');
    $this->load->model('attendance/markgroupattendancemodel');
  }
    public function index(){
       $sql = 'select * from user_master';
    $data = $this->common->common_index($sql);
    $user_code =$_SESSION['user_data']['result'][0]['user_code'];
     $user_role_code =$_SESSION['user_data']['result'][0]['user_role_code'];

    $data['GroupAttendanceList'] = $this->markgroupattendancemodel->GroupAttendanceList($user_code,$user_role_code);
    $data['user_code_count'] = $this->markgroupattendancemodel->user_code_count($user_code);



$data['user_code'] = $_SESSION['user_data']['result'][0]['user_code'];
$data['user_name'] = $_SESSION['user_data']['result'][0]['user_name'];

        $this->load->view('attendance/markgroupattendance',$data);
        $this->load->view('footer-links',$data);
    }
    public function attendance_action(){
      $Input_data = $this->input->post();
unset($Input_data['submit']);
  $Input_data["att_date"]=  date("Y-m-d h:i:s");
$Input_data["user_created_by"]= $_SESSION['user_data']['result'][0]['user_code'];
$Input_data["user_created_date"]=  date("Y-m-d h:i:s");
$Input_data["user_modified_by"]= $_SESSION['user_data']['result'][0]['user_code'];
$Input_data["user_modified_date"]= date("Y-m-d h:i:s");
$user_att_master = $Input_data['user_att_master'];
foreach ($user_att_master as $key => $value) {
  $user_att_master[$key]["att_date"]=$Input_data["att_date"];
  $user_att_master[$key]["user_created_by"]=$Input_data["user_created_by"];
  $user_att_master[$key]["user_created_date"]=$Input_data["user_created_date"];
  $user_att_master[$key]["user_modified_by"]=$Input_data["user_modified_by"];
  $user_att_master[$key]["user_modified_date"]=$Input_data["user_modified_date"];
}

     if($this->input->post('submit') == 'save'){
    //  echo '<pre>'.print_r($Input_data,true);
      $data = $this->markgroupattendancemodel->attendance_insert($user_att_master);
$this->session->set_flashdata('message','Your Attendace Marked Successfully  ');

      }
     redirect(base_url().'attendance/markgroupattendance/');

    }

  }

  ?>
