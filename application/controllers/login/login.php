	<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('login/loginmodel');
		if(isset($_SESSION['user_data']) && isset($_COOKIE['user_data']))
		{
			//echo 'session is not set';
			$role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
			$redirect_page =$this->loginmodel->redirect_page($role_code);
			redirect(base_url().$redirect_page);

		}
		//unset($_SESSION['user_data']);
	}
	public function index(){
		$this->load->model('login/loginmodel');

		$this->form_validation->set_rules('email', 'Email', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');

		if ($this->form_validation->run() == FALSE)
		{
			$this->load->view('login/loginform');
		}
		else
		{
			$username = $this->input->post('email');
			$password = $this->input->post('password');
			$username_check = $this->loginmodel->username_check($username);
			if($username_check['num_rows'] != 0){
				if($password != $username_check['result'][0]['user_pass'])
				{
					$data['password_error'] = 'Password incorrect';
					$this->load->view('login/loginform',$data);
				}else{
					$_SESSION['user_data']= $data['username_check'] = $username_check ;
				$cookie_name = "user_data";
				$cookie_value =json_encode($_SESSION['user_data']);
				setcookie($cookie_name, $cookie_value, time() + (86400), "/"); // 86400 = 1 day
				//echo '<pre>'.print_r($_SESSION['user_data'],true);
				//exit();
				redirect(base_url().'login');
				}

			}else{
				$data['username_error'] = 'User name does not exist';
				$this->load->view('login/loginform',$data);
			}
		}

	}


}

?>
