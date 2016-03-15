<?php



/**
 *
 */
class sql extends CI_Controller
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
   		$data =$this->common->index('sql_master');
   
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
    $data = $this->sqlmodel->show_tables($database);
    echo json_encode($data);
  }
  public function show_table_field(){
     $database = $this->input->post('database');
 
     $table = $this->input->post('table');
$data = $this->sqlmodel->show_table_field($table,$database);
    echo json_encode($data);
  }
  public function show_field_values(){
    $database = $this->input->post('database');
    $table = $this->input->post('table');
    $field = $this->input->post('field');
    
    $data = $this->sqlmodel->show_field_values($field,$table,$database);
    echo json_encode($data);
  }
  
  public function get_sql_queries(){
    $database = $this->input->post('database');
    $sql_queries = $this->input->post('sql_queries');
     
    
    /*$database = 'pmsresof_country_11';
   $sql_queries = "select * from tbl_cases where created_date >='2016-01-01' and created_date <='2016-01-02' ";
*/
$header = $this->dbmodel->get_sql_queries($database,$sql_queries);
//echo '<pre>'.print_r($header,true); die();
$this->load->helper('file');
$f['data'] =$header['result'];
$file_data = json_encode($f);
write_file('./IncludeViews/data.json', $file_data);
//echo '<pre>'.print_r($f,true);
//die();
$data['file_path'] = 'assets/app/js/admin/usermaster.js';
$data['url'] =base_url().'IncludeViews/data.json';
$data['del_url'] =base_url().'admin/usermaster/user_delete';
$data['num_rows'] = $header['num_rows'];
$data['errorInfo'] = $header['errorInfo'];
$data['columns'] = $header['columns'];
$this->load->view('admin/db_table_values',$data);
$this->load->view('table-links',$data);


  }
}




 ?>
