<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct(){
		parent::__construct();
		if(!isset($_SESSION['user_data']) && !isset($_COOKIE['user_data']))
		{
			//echo 'session is not set';
			redirect(base_url().'login');
		}else{
			$cookie =$_COOKIE['user_data'];
			$_SESSION['user_data'] = json_decode($cookie,true);
			//echo '<pre>'.print_r($_SESSION,true);die();
			redirect(base_url().'admin/usermaster');	
		}
		//unset($_SESSION['user_data']);
	}
	public function index()
	{
		$this->load->view('welcome_message');
	}
	public function Login()
	{
		$this->load->view('Login/LoginForm');
	}
	public function Dashboard()
	{
		$this->load->view('Dashboard/Dashboard-1');
	}
	public function Datatables()
	{
		$this->load->view('Datatables/Datatables');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */