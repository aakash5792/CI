<?php
/**
*
*/
class userstructure extends CI_Controller
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
		$this->load->model('admin/userstructuremodel');
	
	}

	public function index(){
		$data =$this->common->index('user_structure');
		//echo '<pre>'.print_r($data,true);die();
		$this->load->view($data['url'],$data);
		$this->load->view('footer-links-1',$data);

	}
	public function userstructure_list(){
		$sql_data =$this->common->sql_list('user_structure');
		//echo '<pre>'.print_r($sql_data,true);
		$ssp_file = 'IncludeViews/ssp1.php';
		require($ssp_file);
		echo json_encode(
		    SSP::simple( $_POST, $sql_data['sql_details'],$sql_data['table'],$sql_data['primary_key'], $sql_data['columns'] )
		);
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
	
	public function userstructure_action(){
		$data =$this->common->index('user_structure');
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
	public function user_struct($user_parent_id = null){
				$data = $this->userstructuremodel->get_child($user_parent_id);
			foreach ($data as $key => $value) {
								$data[$key][$key]  = $this->my_for_each($this->userstructuremodel->get_child($value['user_struct_id']));
			}
			echo  '<pre>'.print_r($data,true);
	}
	public function my_for_each($data){
				foreach ($data as $key => $value) {
						if(count($this->userstructuremodel->get_child($value['user_struct_id'])) != 0){
										$data[$key][$key] = $this->userstructuremodel->get_child($value['user_struct_id']);
										$data[$key][$key] =	$this->my_for_each($data[$key][$key]);
						}
				}
				return $data;
	}
	public function user_action(){
		$this->form_validation->set_rules('user_parent_id', 'User Parent Id', 'required');
		$this->form_validation->set_rules('user_position_name', 'User Position Name ', 'required');
	if ($this->form_validation->run() == FALSE)
		{
			$this->index();
		}else{
		$Input_data = $this->input->post();
		unset($Input_data['submit']);
		if($this->input->post('submit') == 'save'){
		$data = $this->userstructuremodel->user_insert($Input_data);
		//echo '<pre>'.print_r($data);exit();
		if($data['affected_rows'] != 0)
		{
			$data['msgcolor'] ='success';
		$this->session->set_flashdata('message','Users data Successfully Added ');
		}else{
				$data['msgcolor'] ='danger';
		$this->session->set_flashdata('message',$data['error']);
		}
		}else{
		$user_struct_id = $this->input->post('user_struct_id');
		$data = $this->userstructuremodel->user_update($Input_data,'user_struct_id');
		$this->session->set_flashdata('message','Users data  Successfully Updated ');
		}
		redirect(base_url().'admin/userstructure/');
		}
	}
	public function user_delete(){
		$del_array = $this->input->post('del_array');
		$data = $this->userstructuremodel->user_delete($del_array);
		$this->session->set_flashdata('message','Data Successfully Deleted');
		echo json_encode($data);
	}
	public function user_name_chk(){
		$user_name =$this->input->post('user_name');
		$data = $this->userstructuremodel->user_name_chk($user_name);
	 	echo json_encode($data);
	}
}
?>
