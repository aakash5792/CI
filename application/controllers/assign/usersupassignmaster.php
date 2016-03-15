<?php

/**
* 
*/
class usersupassignmaster extends CI_Controller
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
			$this->load->model('assign/usersupassignmastermodel');
	}

	public function index(){
		$data =$this->common->index('user_sup_assign_master');
		//echo '<pre>'.print_r($data,true);die();
		$this->load->view($data['url'],$data);
		$this->load->view('footer-links-1',$data);

	}
	public function usersupassignmaster_list(){
		$sql_data =$this->common->sql_list('user_sup_assign_master');
		//echo '<pre>'.print_r($sql_data,true);
		$ssp_file = 'IncludeViews/ssp1.php';
		require($ssp_file);
		echo json_encode(
		    SSP::simple( $_POST, $sql_data['sql_details'],$sql_data['table'],$sql_data['primary_key'], $sql_data['columns'] )
		);
	}
	
	public function usersupassignmaster_action(){
		$data =$this->common->index('user_sup_assign_master');
		$Input_data = $this->input->post();
		//echo '<pre>'.print_r($data,true);die();
		if($this->validation($data,$Input_data) ) {
			if($Input_data['submit'] == 'save') {
				unset($Input_data['submit']);
				$data['msg'] =$this->common->insert($Input_data);
			}else{
				unset($Input_data['submit']);
				$data['msg'] =$this->common->update($Input_data);
			}
			redirect($data['url']);
		}
		
	}	
	public function usersupassignmaster_delete(){
		$data =$this->common->index('user_sup_assign_master');
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

  	public function client_branch_code(){
  		$client_code = $this->input->post('client_code');
        $user_code = $this->input->post('user_code');
  		$data = $this->usersupassignmastermodel->client_branch_code($client_code,$user_code);
  			echo json_encode($data);
  		}

  		public function get_user_list(){
  				$client_code = $this->input->post('client_code');
  				$user_role_code = $this->input->post('user_role_code');
  				$data = $this->usersupassignmastermodel->get_user_list($client_code,$user_role_code);
  				echo json_encode($data);

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