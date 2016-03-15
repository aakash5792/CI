<?php


/**
* 
*/
class productdetails extends CI_Controller
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
		$this->load->model('product/productmastermodel');
		$this->load->model('product/productfeaturemastermodel');
		
		$this->load->model('common');
	}


	public function index(){
		$sql = 'select * from product_master';
		$data = $this->common->common_index($sql);
		
		$data['columns_header'] =  array('Product Category Id','Product Category Name');
		$data['product_category_id'] = $this->productfeaturemastermodel->product_category_id();
		
		//echo '<pre>'.print_r($data,true);
		$this->load->view('product/productdetails',$data);
		$this->load->view('footer-links',$data);
	}
}
?>