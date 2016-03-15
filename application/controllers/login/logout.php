<?php


/**
* 
*/
class logout extends CI_Controller
{
		
	public function index(){
		echo 'logout ';
		unset($_SESSION['user_data']);
		unset($_COOKIE['user_data']);
		//print_r($_COOKIE);
		redirect(base_url().'login/');
	}
	
}

?>