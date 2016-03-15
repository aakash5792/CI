<?php

/**
*
*/
class formedit extends CI_Controller
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
		$this->load->dbforge();
		$this->load->helper('file');
		$this->load->model('common');

		$this->load->model('admin/dbmodel');
		$this->load->model('form/formeditmodel');
		$this->load->model('form/formmodel');

	}

	public function index(){
		$data =$this->common->index('form_edit');
		$data['meta_tables'] = $this->formeditmodel->meta_tables();
		$data['field_type'] = $this->formmodel->field_type();

		//echo '<pre>'.print_r($data,true);die();
		$this->load->view($data['url'],$data);
		$this->load->view('footer-links-1',$data);

	}
	public function getmeta(){

    $table = $this->input->post('table');
     $data =$this->formeditmodel->getmeta($table);

    /*$database = 'pmsresof_country_11';
   $sql_queries = "select * from tbl_cases where created_date >='2016-01-01' and created_date <='2016-01-02' ";
*/
$header = $this->dbmodel->get_sql_queries($data['database'],$data['sql']);
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
$this->load->view('form/db_table_values',$data);
$this->load->view('form/table-links',$data);

	}
	public function formedit_list(){
		$sql_data =$this->common->sql_list('form_edit');
		//echo '<pre>'.print_r($sql_data,true);
		$ssp_file = 'IncludeViews/ssp1.php';
		require($ssp_file);
		echo json_encode(
		    SSP::simple( $_POST, $sql_data['sql_details'],$sql_data['table'],$sql_data['primary_key'], $sql_data['columns'] )
		);
	}

	public function formedit_action(){
		$data =$this->common->index('form_edit');
		$fields = $this->input->post('fields');
		$Input_data = $this->input->post();
		unset($Input_data['fields']);
		$a = '';
		foreach ($fields as $key => $value) {
			//echo $value['name'];
			if($value['name'] == 'field_validations[]')
			{
			$a .= $value['value'].'|';
			$Input_data['field_validations'] =$a;
			$Input_data['field_validations']= substr($Input_data['field_validations'], 0, -1);;
			}else{
			$Input_data[$value['name']] =$value['value'];
			}
		}
		$table = $Input_data["meta_tables"];
	$new_table = substr($table,0,-5);
	$fields = $this->formeditmodel->fields($Input_data["field_type"]);
	$field_type = $Input_data["field_type"];

		//echo $a;die();
		//echo '<pre>'.print_r($Input_data,true);die();
		unset($Input_data['example1_length']);
		if($Input_data['submit'] == 'save') {
			unset($Input_data['submit']);
			$Input_data["user_created_by"]= $_SESSION['user_data']['result'][0]['user_code'];
			$Input_data["user_created_date"]=  date("Y-m-d h:i:s");
			$Input_data["user_modified_by"]= $_SESSION['user_data']['result'][0]['user_code'];
			$Input_data["user_modified_date"]= date("Y-m-d h:i:s");
$field_name= $Input_data["field_name"];
	$fields[$field_name] = $fields;
	unset($fields['type']);
	unset($fields['constraint']);


				$msg['msg_insert'] =$this->common->insert($Input_data);
				$msg['msg_update'] =$this->formeditmodel->alteradd($new_table,$fields);
				unset($Input_data['meta_tables']);
					unset($Input_data["user_created_by"]);
					unset($Input_data["user_created_date"]);
				unset($Input_data["user_modified_by"]);
				unset($Input_data["user_modified_date"]);
				$msg['msg_update'] =$this->formeditmodel->insert($table,$Input_data);

			}else{

			$Input_data["user_modified_by"]= $_SESSION['user_data']['result'][0]['user_code'];
			$Input_data["user_modified_date"]= date("Y-m-d h:i:s");
				unset($Input_data['submit']);
				$meta_id= $Input_data["meta_id"];
				$field =$this->formeditmodel->getfieldname($table,$meta_id);
				$field_name = $field['result'][0]['field_name'];
				$fields['name'] = $Input_data["field_name"];

				$fields[$field_name] = $fields;
				unset($fields['type']);
				unset($fields['constraint']);
				unset($fields['name']);
				//print_r($fields);
				if($field_type != 12 && $new_table != 'product_feature_field'){
				$this->formeditmodel->altertable($new_table,$fields);
				//print_r($this->db->last_query());
				}
				unset($Input_data['meta_tables']);
				unset($Input_data["user_modified_by"]);
				unset($Input_data["user_modified_date"]);
				$msg['msg_update'] =$this->formeditmodel->update($table,$Input_data,'meta_id');
				$msg['msg_insert'] =$this->common->insert($Input_data);
			}
			echo json_encode($msg);


	}
	public function formedit_delete(){
		$data =$this->common->index('form_edit');
		$Input_data = $this->input->post('Input_data');
		$data = $this->common->delete($Input_data);

		echo json_encode($data);
	}
	public function validation($data,$Input_data){

		foreach ($data['form_fields'] as $key => $fields) {
		if($Input_data['submit'] != 'save'){
			//echo $Input_data['submit'];
			$this->form_validation->set_rules(@$fields['field_name'], @$fields['field_label'],'required'.str_replace(@$fields['field_validations'],'',@$fields['field_validations']));
			}else{
			$this->form_validation->set_rules(@$fields['field_name'], @$fields['field_label'],str_replace(' ', '',@$fields['field_validations']));
			}
		}
		if ($this->form_validation->run() === FALSE)
		{
			$this->load->view($data['url'],$data);
			$this->load->view('footer-links-1',$data);
			return FALSE;
		}else{
			return TRUE;
		}
	}
	public function get_option()
	{
	 $sql = $this->input->post('sql');
     $data =$this->common->get_option($sql);
    	echo json_encode($data);
	}
	public function duplicate($str,$id)
	{
		$num_rows =$this->common->duplicate($str,$id);

		if ($num_rows != 0)
		{
			$this->form_validation->set_message('duplicate','The %s already exist ');
			return FALSE;
		}else{
			return TRUE;
		}
	}
}

?>
