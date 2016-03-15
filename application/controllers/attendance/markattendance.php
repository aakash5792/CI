<?php

/**
 *
 */
class markattendance extends CI_Controller
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
    $this->load->model('attendance/markattendancemodel');
  }
    public function index(){
     $sql = 'select * from user_master';
    $data = $this->common->common_index($sql);

     $user_code =$_SESSION['user_data']['result'][0]['user_code'];

$data['client_master'] = $this->markattendancemodel->client_master($user_code);
$data['user_code_count'] = $this->markattendancemodel->user_code_count($user_code);

$data['user_code'] = $_SESSION['user_data']['result'][0]['user_code'];
$data['user_name'] = $_SESSION['user_data']['result'][0]['user_name'];


        $this->load->view('attendance/markattendance',$data);
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

           if($this->input->post('submit') == 'save'){
          //  echo '<pre>'.print_r($Input_data,true);
            $data = $this->markattendancemodel->attendance_insert($Input_data);
    $this->session->set_flashdata('message','Your Attendace Marked Successfully  ');

            }
           redirect(base_url().'attendance/markattendance/');

    }
    public function attendance_update(){
            $Input_data = $this->input->post();
    unset($Input_data['submit']);
      $Input_data["att_date"]=  date("Y-m-d h:i:s");
    $Input_data["user_modified_by"]= $_SESSION['user_data']['result'][0]['user_code'];
    $Input_data["user_modified_date"]= date("Y-m-d h:i:s");

           if($this->input->post('submit') == 'Update'){
          	$data = $this->markattendancemodel->attendance_update($Input_data,'att_id');
     				$this->session->set_flashdata('message','Attendance data  Successfully Updated ');

            }
           redirect(base_url().'attendance/markattendance/viewattendance');

    }



    public function viewattendance(){
        $sql = $this->markattendancemodel->index();
   $data = $this->common->common_index($sql);
$data['columns_header'] =  array('Attendance Id','Attendance Date',
      'Client Name','Client Branch Code',
      'Client Branch Name','Client Branch Process',
      'Client Branch Latitude','Client Branch Longitude',
      'User Code','Field Executive',
      'Attendance Status','User Name',
      'User Latitude','User Longitude',
      'User Accuracy','User Radius',
      'User Address','User Reason',
      'Branch Name'
      
      );
    $this->load->view('attendance/viewattendance',$data);
    $this->load->view('footer-links',$data);
    }
    
    public function markattendance_list(){
       $sql = $this->markattendancemodel->index();
    $sql_data =$this->common->columns($sql);
    $ssp_file = 'IncludeViews/ssp.php';
    require($ssp_file);
    echo json_encode(
        SSP::simple( $_POST, $sql_data['sql_details'], $sql, $sql_data['columns'] )
    );
  }
   public function markattendance_delete(){
    $del_array = $this->input->post('del_array');
    $data = $this->markattendancemodel->attendance_delete($del_array);
    $this->session->set_flashdata('message','Data Successfully Deleted');
    echo json_encode($data);
  }

}


 ?>
