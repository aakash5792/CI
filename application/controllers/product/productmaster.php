<?php


/**
* 
*/
class productmaster extends CI_Controller
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
		$this->load->helper('file');
		$this->load->model('common');
		//$this->load->model('menu/usermenumodel');
	}


	public function index(){
		$data =$this->common->index('product_master');
		//echo '<pre>'.print_r($data,true);die();
		$data['product_category_id'] = $this->productfeaturemastermodel->product_category_id();
		$data['columns_header'] =  array('Product Sub Category Id','Product Category Id','Product Sub Category Name','Product Sub Category Seq');
		
		//echo '<pre>'.print_r($data,true);
		$this->load->view('product/productmaster',$data);
		$this->load->view('footer-links-1',$data);
	}
	public function productmaster_list(){
		$sql = 'select * from product_master';
		$sql_data =$this->common->columns($sql);
		$ssp_file = 'IncludeViews/ssp.php';
		require($ssp_file);
		echo json_encode(
		    SSP::simple( $_POST, $sql_data['sql_details'], $sql, $sql_data['columns'] )
		);
	}
	public function productmaster_action(){
		$Input_data = $this->input->post();
		unset($Input_data['submit']);
		$field_master =$this->productmastermodel->field_master();
		foreach ($field_master as $key => $value) {
			$fields[$value['field_name']] = $value;
			unset($fields[$value['field_name']]['field_name']);
			if($value['field_id'] == 7 || $value['field_id'] == 6 || $value['field_id'] == 13 || $value['field_id'] == 8  || $value['field_id'] == 2)
				{
					unset($fields[$value['field_name']]['constraint']);
				}
				unset($fields[$value['field_name']]['field_id']);
		}
		//echo '<pre>'.print_r($fields,true);die();
		
		if($this->input->post('submit') == 'save'){
			
		$data = $this->productmastermodel->productmaster_insert($fields,$Input_data);
		$this->session->set_flashdata('message','Product Successfully Added ');
		}
		redirect(base_url().'product/productmaster/');

	}
	public function productmaster_delete(){
		$Input_data = $this->input->post();
		$data = $this->productmastermodel->productmaster_delete($Input_data);
		//echo '<pre>'.print_r($data,true);
		
		$this->session->set_flashdata('message','menu Data Successfully Deleted');
		echo json_encode($data);
	}
}

?>