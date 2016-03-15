<?php



/**
*
*/
class rolemaster extends CI_Controller
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
		$this->load->model('admin/rolemastermodel');
		$this->load->model('common');
	}





		public function index(){
		$sql ="SELECT
		distinct  role_name, role_code,role_url
		FROM  user_role_master rm";
		$data = $this->common->common_index($sql);
		$menus=$this->rolemastermodel->menu_category();
		foreach ($menus as $key => $value) {
			$menus[$key]['submenu']=  $this->rolemastermodel->menu_sub_category($value['menu_id']);
		}
		$data['menus'] = $menus;
		$file_data = json_encode($this->role_list());
		write_file('./IncludeViews/data.json', $file_data);
		foreach ($menus as $keys => $values) {
			//echo '<pre>'.print_r($values['submenu'],true);
			foreach ($values['submenu'] as $key => $value) {
				$menu_id =  $value['menu_id'];
				$url[$menu_id]['text'] = $value['menu_text'];
				$url[$menu_id]['url'] = $value['menu_navigate_url'];
			}
		}
		$data['columns_header'] =  array(
			'Role code','Role name',
			'Role url'
			);
		$data['url'] = $url;
		//echo '<pre>'.print_r($data,true);die();

		$this->load->view('admin/rolemaster',$data);
		$this->load->view('admin/footer-links-role',$data);
		}


	public function rolemaster_list(){
		$role_codes = $this->rolemastermodel->rolemaster_list();
		foreach ($role_codes as $key => $value) {
				$role_codes[$key]['menus'] = $this->rolemastermodel->role_code_menus($value['role_code']);
		}
		//echo '<pre>'.print_r($role_codes,true);
		$data['data'] =$role_codes;
		echo json_encode($data);
	}

	public function role_list(){
		$role_codes = $this->rolemastermodel->rolemaster_list();
		foreach ($role_codes as $key => $value) {
				$role_codes[$key]['menus'] = $this->rolemastermodel->role_code_menus($value['role_code']);
		}
		//echo '<pre>'.print_r($role_codes,true);
		$data['data'] =$role_codes;
		return $data;
	}
	public function role_action(){
$this->form_validation->set_rules('role_code', 'Role Code name', 'required');
$this->form_validation->set_rules('role_name', 'Role Code', 'required');
$this->form_validation->set_rules('role_url', 'Role URL', 'required');

		if ($this->form_validation->run() == FALSE)
		{
			$this->index();
		}else{

		$Input_data = $this->input->post();

// echo '<pre>'.print_r($Input_data,true);
// exit();
		$role_url = $this->input->post('role_url');
		$role_code = $this->input->post('role_code');
		$role_name = $this->input->post('role_name');
		$menus = $this->input->post('menu_id');

		unset($Input_data['submit']);
		$variable =array('role_menu_insert','role_menu_update','role_menu_delete','role_menu_export');
		foreach ($menus as $keys => $values) {
			foreach ($variable as $key => $value) {
			if (!array_key_exists($value,$values))
				{
				$menus[$values['role_menu_ids']][$value]= 'N';

				}
			}
		}
		foreach ($menus as $keys => $values) {
				$menus[$values['role_menu_ids']]['role_code']= $role_code;
				$menus[$values['role_menu_ids']]['role_name']= $role_name;
				$menus[$values['role_menu_ids']]['role_url']= $role_url;
		}

		 if($this->input->post('submit') == 'save'){
			$data = $this->rolemastermodel->role_insert($menus);
			$this->session->set_flashdata('message','role data Successfully Added ');
		 }else{
			$data = $this->rolemastermodel->role_update($menus,$role_code);
			$this->session->set_flashdata('message','role data  Successfully Updated ');

		 }
		 redirect(base_url().'admin/rolemaster/');
		}
	}
	public function rolemaster_delete(){
		$del_array = $this->input->post('del_array');
		$data = $this->rolemastermodel->role_delete($del_array);
		$this->session->set_flashdata('message','Data Successfully Deleted');
		echo json_encode($data);
	}
}


?>
