<?php



/**
 *
 */
class db extends CI_Controller
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
    $this->load->model('admin/dbmodel');

  }


  public function index(){
   		$data =$this->common->index('backup_master');
   
   		 //echo '<pre>'.print_r($data,true);die();
    $this->load->view($data['url'],$data);
    $this->load->view('footer-links-1',$data);
  }
  public function get_option()
  {
    $field_val =$this->input->post('field_val');
    $field_id = $this->input->post('field_id');
    $table = $this->input->post('table');
    
    $data = $this->common->dependon($table,$field_id,$field_val);
    echo json_encode($data);     
  }
  public function show_tables(){
    $database = $this->input->post('database');
    $data = $this->dbmodel->show_tables($database);
    echo json_encode($data);
  }
  public function show_table_field(){
     $database = $this->input->post('database');
 
     $table = $this->input->post('table');
$data = $this->dbmodel->show_table_field($table,$database);
    echo json_encode($data);
  }
  public function show_field_values(){
    $database = $this->input->post('database');
    $table = $this->input->post('table');
    $field = $this->input->post('field');
    
    $data = $this->dbmodel->show_field_values($field,$table,$database);
    echo json_encode($data);
  }
  
  public function show_table_details(){
  $database = $this->input->post('database');
  $table = $this->input->post('table');
  $field = $this->input->post('field');
  $to_date = $this->input->post('to_date');
  $from_date = $this->input->post('from_date');
  $header = $this->dbmodel->show_table_details($database,$table,$field,$from_date,$to_date);
  $this->load->helper('file');
  $f['data'] =$header['result'];
  $file_data = json_encode($f);
  write_file('./IncludeViews/data.json', $file_data);
  //echo '<pre>'.print_r($header,true); die();
  $data['file_path'] = 'assets/app/js/admin/usermaster.js';
  $data['url'] =base_url().'IncludeViews/data.json';
  $data['del_url'] =base_url().'admin/usermaster/user_delete';
  $data['num_rows'] = $header['num_rows'];
  $data['errorInfo'] = $header['errorInfo'];
  $data['columns'] = $header['columns'];
  $this->load->view('admin/db_table_values',$data);
  $this->load->view('table-links',$data);

  }
  public function backup(){
    $database_backup = $this->input->post('database');
  $table = $this->input->post('table');
  $field = $this->input->post('field');
  $to_date = $this->input->post('to_date');
  $from_date = $this->input->post('from_date');
/*    $database = 'sample';
    $table ='user_master';
    $field = 'user_modified_date';
    $to_date =     '31-12-2015';
    $from_date = '01-12-2015';*/

          $data = $this->dbmodel->backup($database_backup, $table, $field, $from_date, $to_date);
          echo json_encode($data);
  }

}




 ?>
