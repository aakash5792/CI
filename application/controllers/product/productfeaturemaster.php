<?php

/**
*
*/
class productfeaturemaster extends CI_Controller
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
		$this->load->model('product/productfeaturemastermodel');

		$this->load->model('admin/dbmodel');
		
				$this->load->model('product/productsubcategorymodel');
			$this->load->model('common');
	}


	public function index(){
		$sql = 'select * from product_sub_category';
		$data = $this->common->common_index($sql);
		$data['product_category_id'] = $this->productfeaturemastermodel->product_category_id();
		$data['field_type'] = $this->productfeaturemastermodel->field_type();
		
		//echo print_r($data['main_menu'],true);
		$this->load->view('product/productfeaturemaster',$data);
		$this->load->view('footer-links',$data);
	}
	public function product_sub_category_id($product_category_id = null){
		$data = $this->productfeaturemastermodel->product_sub_category_id($product_category_id);
		echo json_encode($data);
	}
	public function product_id($product_sub_category_id = null){
		$data = $this->productfeaturemastermodel->product_id($product_sub_category_id);
		echo json_encode($data);
	}
	public function product_feature_fields($product_id = null){
		 $sql ="SELECT  meta_id,field_name, field_col_sm_, field_label,
		field_type, field_options,field_validations,
		onchange
		 FROM product_feature_field_meta
			WHERE table_name ='$product_id'
			";
		$data = $this->common->common_index($sql);
		$data['columns_header'] =  array('Field Id',
			'Field Name',
			'Field Colspan',
			'Field Label',
			'Field Type',
			'Field Option',
			'Field Validations',
			'Onchange');
	                     $this->load->dbutil();
		        $CI =& get_instance();
		        $CI->load->database();
		        $database =  $CI->db->database;
		$header = $this->dbmodel->get_sql_queries($database,$sql);
		//echo '<pre>'.print_r($header,true); die();
		$this->load->helper('file');
		$f['data'] =$header['result'];
		$file_data = json_encode($f);
		//die();
		write_file('./IncludeViews/data.json', $file_data);
		//echo '<pre>'.print_r($data,true);die();
		$data['file_path'] = 'assets/app/js/admin/usermaster.js';
		$data['url'] =base_url().'IncludeViews/data.json';
		$data['del_url'] =base_url().'admin/usermaster/user_delete';
		$this->load->view('product/product_feature_fields_table',$data);
		$this->load->view('table-links-1',$data);

	}
	public function product_feature_fields_details($product_id = null){
		
		$data = $this->common->index('product_sub_category');
	$Input_data = $this->input->post();
	
	$file_path ='assets/app/files/csv/products/';
$file_name_c = './'.$file_path.'z_tbl_product_'.$Input_data['product_category_id'].'_'.$Input_data['product_sub_category_id'].'_'.$Input_data['product_id'].'.csv';
$file_name = $file_path.'z_tbl_product_'.$Input_data['product_category_id'].'_'.$Input_data['product_sub_category_id'].'_'.$Input_data['product_id'].'.csv';
$data['form_fields'] = $this->productfeaturemastermodel->product_feature_fields_details($product_id);

		

		foreach ($data['form_fields'] as $key => $value) {
						$values[] = $value['field_name'];
		}
	$list = implode(',',$values);
$this->load->helper('file');

write_file($file_name_c, $list);
$data['csv_path'] = base_url().$file_name;
	$this->load->view('product/product_feature_fields-Add',$data);


	}
	public function add_feature_form_submit(){
		$Input_data = $this->input->post();
		//echo '<pre>'.print_r($Input_data,true);die();	
		$data = $this->productfeaturemastermodel->productfeaturemaster_insert($Input_data);
	 $this->session->set_flashdata('message','Field data Successfully Added ');
		echo json_encode($data);
	}

	public function productfeaturemaster_action(){
		$Input_data = $this->input->post();
		unset($Input_data['submit']);
			 if($this->input->post('submit') == 'save'){
			 $data = $this->productfeaturemastermodel->productfeaturemaster_insert($Input_data);
			 $this->session->set_flashdata('message','Menu data Successfully Added ');
			 }else{
			 $product_category_id = $this->input->post('product_category_id');
			 $data = $this->productfeaturemastermodel->productfeaturemaster_update($Input_data,'product_category_id');
			 $this->session->set_flashdata('message','Menu data  Successfully Updated ');

			 }
		redirect(base_url().'product/productfeaturemaster/');

	}
	public function productfeaturemaster_delete(){
		$del_array = $this->input->post('del_array');
		$data = $this->productfeaturemastermodel->productfeaturemaster_delete($del_array);
		$this->session->set_flashdata('message','menu Data Successfully Deleted');
		echo json_encode($data);
	}
}


?>
