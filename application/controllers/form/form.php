<?php

/**
*
*/
class form extends CI_Controller
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
		$this->load->model('form/formmodel');

	}

	public function index(){
		$data =$this->common->index('form');
		$data['field_type'] = $this->formmodel->field_type();
		//echo '<pre>'.print_r($data,true);die();
		$this->load->view($data['url'],$data);
		$this->load->view('footer-links-1',$data);

	}
	public function form_list(){
		$sql_data =$this->common->sql_list('form');
		//echo '<pre>'.print_r($sql_data,true);
		$ssp_file = 'IncludeViews/ssp1.php';
		require($ssp_file);
		echo json_encode(
		    SSP::simple( $_POST, $sql_data['sql_details'],$sql_data['table'],$sql_data['primary_key'], $sql_data['columns'] )
		);
	}

	public function form_action(){
		$data =$this->common->index('form');
		$Input_data = $this->input->post();
		//echo '<pre>'.print_r($Input_data,true);die();
$file_names = array('controllers','models','views');
foreach ($file_names as $key => $value) {
	$this->file_creation($value,$Input_data);
}
$js_path = './assets/app/js/'.$Input_data['form_module'].'/'.$Input_data['form_name'].'.js';
 write_file($js_path,' ');
//echo '<pre>'.print_r($new_table_content,true);
//die();


		if($this->validation($data,$Input_data) ) {
			if($Input_data['submit'] == 'save') {
				unset($Input_data['submit']);
				$table =$this->formmodel->insert($Input_data);
				$data['create_meta'] =$this->common->create_meta($table);
			}else{
				unset($Input_data['submit']);
				$data['msg'] =$this->common->update($Input_data);
			}
			redirect($data['url']);
		}
	}
	public function file_creation($file_name,$Input_data){
		 $path = 'IncludeViews/sample/'.$file_name.'.php';
 	$content =$this->common->readfile($path);
 	$new_content = $this->common->file_content_replace($content,'#class#',$Input_data['form_name']);
 	$new_table_content = $this->common->file_content_replace($new_content,'#table#',$Input_data['form_table_name']);
 $path = 'application/'.$file_name.'/'.$Input_data['form_module'].'/'.$Input_data['form_name'].'.php';
 $create_path = './'.$path;
 write_file($create_path,' ');
  $myfile = fopen($path, "w") or die("Unable to open file!");
  foreach ($new_table_content as $key => $value) {
 //$txt = $value."\n";
 	fwrite($myfile, $value);
 }
 fclose($myfile);
	}
	public function form_delete(){
		$data =$this->common->index('user_master');
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
