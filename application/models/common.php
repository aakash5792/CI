<?php

/**
*
*/
class common extends CI_Model
{
	public $table;
	public $table_meta;
	public $primary_key;

	public function index($table_name){
		$this->load->helper('file');
		//above line helps to create and write the file

		$role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
		//above line helps to get user code from session

		$product_name= $_SESSION['user_data']['result'][0]['user_product_names'];
		//above line helps to get user product from session

		$data['module'] = $module = $this->uri->segment(1);
		//above line helps to get user module from browser url

		$data['class'] = $class = $this->uri->segment(2);
		//above line helps to get user class on which we shall work

		$data['url'] = $url = $module.'/'.$class;
		//above line helps to get the access control information

		$get_page_details_controls = $this->get_page_details_controls($url,$role_code);
		//this get function uses the query to get info from role master

		$data['page_name'] = $page_name = $get_page_details_controls[0]['menu_text'];
		$data['page_breadcrumb'] =  array($module,$class);
		$data['page_form_name'] = $page_name.' Form';
		$data['page_list_name'] = $page_name.' List';

		$data['page_access_controls'] =  $get_page_details_controls[0];

		$data['form_url'] =  base_url().$url.'/'.$class.'_action';
		$data['list_url'] =  base_url().$module.'/'.$class.'/'.$class.'_list';
		$data['del_url'] =   base_url().$url.'/'.$class.'_delete';
		$data['get_option_url'] =   base_url().$url.'/'.'get_option';

		$data['js_function_path'] = 'assets/app/js/'.$module.'/'.$module.'_function.js';
		$data['js_path'] = 'assets/app/js/'.$url.'.js';
		$data['main_menu']=$this->menus($role_code,$product_name);
		$this->set_table($table_name);
		$data['table'] = $this->table;
		$data['columns'] = $this->field_label();
		$data['form_fields'] = $this->form_details();
		$data['csv_path'] = $this->form_import_details();

		$data ['primary_key'] =  $this->primary_key =$this->primary_key();

		//echo '<pre>'.print_r($data,true);die();
		return $data;

	}
	public function common_index($sql_queries){
		$this->load->helper('file');
		//above line helps to create and write the file

		$role_code =$_SESSION['user_data']['result'][0]['user_role_code'];
		//above line helps to get user code from session

		$product_name= $_SESSION['user_data']['result'][0]['user_product_names'];
		//above line helps to get user product from session

		$data['module'] = $module = $this->uri->segment(1);
		//above line helps to get user module from browser url

		$data['class'] = $class = $this->uri->segment(2);
		//above line helps to get user class on which we shall work

		$data['url'] = $url = $module.'/'.$class;
		//above line helps to get

		$get_page_details_controls = $this->get_page_details_controls($url,$role_code);
		$data['page_access_controls'] =  $get_page_details_controls[0];

$data['page_name'] = $page_name = $get_page_details_controls[0]['menu_text'];
		$data['page_breadcrumb'] =  array($module,$class);
		$data['page_form_name'] = $page_name.' Form';
		$data['page_list_name'] = $page_name.' List';

		$data['form_name'] = $page_name.' Form';
		$data['form_url'] =  base_url().$url.'/'.$class.'_action';
		$data['list_name'] = $page_name.' List';
		$data['list_url'] =  base_url().$module.'/'.$class.'/'.$class.'_list';
		$data['del_url'] =   base_url().$url.'/'.$class.'_delete';
		$columns = $this->columns($sql_queries);
		$data['columns'] = $columns['columns'];
		$data['js_function_path'] = 'assets/app/js/'.$module.'/'.$module.'_function.js';
		$data['errorInfo'] = $columns['errorInfo'];

		$data['js_path'] = 'assets/app/js/'.$url.'.js';
		$data['main_menu']=$this->menus($role_code,$product_name);
		//echo '<pre>'.print_r($data['main_menu'],true);die();
		return $data;

	}
	public function readfile($path){
		$file = fopen($path,"r");
		while(!feof($file))
		{
		    $file_data[] =fgets($file);
		}
		return $file_data;
	}

	public function file_content_replace($content,$replace_word,$replace_value){
		foreach ($content as $key => $value) {
			$new_content[] = str_replace($replace_word,$replace_value, $value);
		}
		return $new_content;
	}
	public function columns($sql_queries)
    {
        $this->load->dbutil();
        $CI =& get_instance();
        $CI->load->database();
        $username = $data['sql_details']['user']=  $CI->db->username;
        $password = $data['sql_details']['pass']= $CI->db->password;
        $hostname = $data['sql_details']['host']=  $CI->db->hostname;
        $database = $data['sql_details']['db']=  $CI->db->database;
        $dbdriver = $data['sql_details']['dbdriver']=  $CI->db->dbdriver;



        $dsn = $dbdriver . ':host=' . $hostname . ';dbname=' . $CI->db->database;;
        $dbc = new PDO($dsn, $username, $password, array( PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ));
        $query = $dbc->prepare($sql_queries);
        $query->execute();
		//if($data['num_rows'] != 0) {
		foreach(range(0, $query->columnCount() - 1) as $column_index)
		{
		  $meta[] = $query->getColumnMeta($column_index);
		}
		$a = array();
//$i =0;
		foreach ($meta as $keys => $values) {

		  foreach ($values as $key => $value) {


		      if($key == 'name'){

		       $b['db'] =$value;
		       $b['dt'] =$value;
		     //  $b['dt'] =$i;
		      $a[]=$b;

		      }

		    }
		     //$i++;
		}
		$data['columns'] =$a;
	   // }

        $data['errorInfo'] = $query->errorInfo();
        return $data;
    }
	public function menus($role_code,$product_name)
	{
		$main_menu =$this->main_menu($role_code,'0',$product_name);
		//echo '<pre>'.print_r($main_menu,true);
		for ($i=0;$i <count($main_menu) ; $i++) {
			$sub_menu= $this->main_menu($role_code,$main_menu[$i]['menu_id'],$product_name);

			$main_menu[$i]['sub_menu'] =$sub_menu;
		}

		return $main_menu;

	}
	public function main_menu($role_code,$menu_parent_id,$menu_product)
	{
		$sql="SELECT menu_id , menu_text , menu_parent_id , menu_navigate_url , menu_sequence , menu_product
			FROM menu_master mm, user_role_master urm
			WHERE mm.menu_id = urm.role_menu_ids
			AND menu_parent_id = '$menu_parent_id'
			AND role_code = '$role_code'
			AND menu_product ='$menu_product'";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	public function get_page_details_controls($url,$role_code){
		$sql="select menu_id,menu_text, role_name,role_code,role_menu_insert,role_menu_update,role_menu_delete,
role_menu_export from menu_master mm ,user_role_master urm
where menu_navigate_url = '$url'
and urm.role_menu_ids =mm.menu_id
and urm.role_code='$role_code'";

		$query = $this->db->query($sql);

		return $query->result_array();

	}
	function duplicate($column_value,$column_name){
		$sql="SELECT ".$column_name."
			FROM ".$this->table." WHERE ".$column_name."='".$column_value."'";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}
	function get_option($sql)
	{
		//echo $sql;
		$query = $this->db->query($sql);
		return $query->result_array();

	}
	function dependon($table,$field_id,$field_val)
	{
		$sql ="select dependon from ".$table."_meta
		where field_name='".$field_id."'";
		$query = $this->db->query($sql);
		$val = $query->result_array();
		return $this->get_option(str_replace('#field_val#',$field_val,$val[0]['dependon']));

	}

	function sql_list($table)
	{
		$this->load->dbutil();
        $CI =& get_instance();
        $CI->load->database();
        $username = $data['sql_details']['user']=  $CI->db->username;
        $password = $data['sql_details']['pass']= $CI->db->password;
        $hostname = $data['sql_details']['host']=  $CI->db->hostname;
        $database = $data['sql_details']['db']=  $CI->db->database;
        $dbdriver = $data['sql_details']['dbdriver']=  $CI->db->dbdriver;
       	$this->set_table($table);
       	$field_names = $this->field_name();
		foreach ($field_names as $keys => $values) {
		       $b['db'] =$values['field_name'];
		       $b['dt'] =$values['field_name'];
			   $a[]=$b;
	    }
		$data['table'] =$table;
		$data['columns'] =$a;
	   	$data ['primary_key'] =  $this->primary_key =$this->primary_key();
		//echo "<pre>".print_r($data,true);
        return $data;
	}
	public function GenerateNewPrimaryCodeEx($ColName,$tableName,$StrConCat)
	{
		 $sql ="SELECT CONCAT('$StrConCat',
			MAX(CAST(REPLACE($ColName, SUBSTR($ColName,1,3), '')
			AS UNSIGNED))+1) as NEWCODE FROM $tableName";
		$query = $this->db->query($sql);

		$result_array = $query->result_array();
		if(strlen($result_array[0]['NEWCODE']) == 0)
		{
		$data['PrimaryCode']= $StrConCat.'1';
		}else{
		$data['PrimaryCode']= $result_array[0]['NEWCODE'];
		}
		return $data['PrimaryCode'];
	}

	function create_meta($table,$db=null){
		$this->load->dbforge();
    $this->load->dbutil();
    $CI =& get_instance();
    $CI->load->database();
    $db = $data['db']=  $CI->db->database;
    $table_meta = $table.'_meta';

	 $sql_table_meta ="CREATE TABLE ".$table_meta." SELECT *
FROM form_meta WHERE 1=0";
$this->db->query($sql_table_meta);
$sql_table_meta_pri = "SELECT column_name
FROM  information_schema.columns
WHERE table_name = 'form_meta'
and  table_schema = 'sample'
and EXTRA='auto_increment'";
$query = $this->db->query($sql_table_meta_pri);
		$result = $query->result_array();

$pri_key =$result[0]['column_name'];
$sql_alter_table_meta ="ALTER TABLE ".$table_meta."
MODIFY COLUMN $pri_key int AUTO_INCREMENT ,
ADD PRIMARY KEY ($pri_key)";

$this->db->query($sql_alter_table_meta);
//echo '<pre>'.print_r($new_table_content,true);

echo $sql="INSERT INTO ".$table_meta."(

	field_name,
	field_label,
	field_type,
	field_col_sm_,
	form_show,
	form_app_show,
	form_import_show,
	form_order
	)
SELECT
column_name as 	field_name
,REPLACE(CONCAT(UCASE(MID(column_name,1,1)),MID(column_name,2)),'_',' ') as field_label
,case
  when EXTRA='auto_increment'
  then 12
when field_type is null then 1
  else field_id
end
,'4' as field_col_sm_
,'1' as form_show
,'1' as form_app_show
,'1' as form_import_show
,ORDINAL_POSITION as form_order
FROM  information_schema.columns as isf join (select @row:=0) as a
LEFT JOIN sample.field_master as sfm ON (isf.data_type = sfm.type)
and (isf.CHARACTER_MAXIMUM_LENGTH = sfm.constraint)
WHERE table_name = '$table'
and table_schema = '$db'
 order by ORDINAL_POSITION";
 $this->db->query($sql);
 $data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		$data['error_message'] = $this->db->_error_message();
return $data;

	}
	function set_table($table_name)
	{
		$this->table = "".$table_name;
		$this->table_meta = "".$table_name."_meta";
	}




	function field_name(){
		$sql = "select field_name from ".$this->table_meta."
		 where form_show ='1' order by form_order";
		$query = $this->db->query($sql);
		return $query->result_array();

	}
	function field_label(){
		$sql = "select field_label from ".$this->table_meta."
		 where form_show ='1' order by form_order";
		$query = $this->db->query($sql);
		return $query->result_array();

	}
	function primary_key(){
		$sql = "select field_name from ".$this->table_meta."
		 where field_type ='12' order by form_order";
		$query = $this->db->query($sql);
		$data =$query->result_array();
		return $data[0]['field_name'];
	}
	function form_import_details(){


		$sql = "select field_label from ".$this->table_meta."
		where form_import_show ='1' and field_type!='12' order by form_order";
		$query = $this->db->query($sql);
		$data =$query->result_array();
		foreach ($data as $key => $value) {
			$list[] = $value['field_label'];
		}

		$file_data =  implode(',',$list);
		$file_path ='assets/app/files/csv/';
		$file_name = $this->table.'.csv';
		$path = './'.$file_path.$file_name;
		write_file($path, $file_data);
		return base_url().$file_path.$file_name;

	}
	function form_details(){
		$sql = "select field_name,field_label,field_type,
		field_options,field_validations,field_col_sm_,
		onchange,field_property
		 from ".$this->table_meta."
		 where form_show ='1' order by form_order";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	function validation_details($table){
		$sql = "select field_label,field_name,field_validations
		 FROM ".$this->table_meta."
		 where field_validations is not null order by form_order";
		$query = $this->db->query($sql);
		return $query->result_array();
	}
	function get_table_field_name($table,$label)
	{

		$sql = "select field_name from ".$table."_meta
		 where field_label ='$label' order by form_order";
		$query = $this->db->query($sql);
		$data =$query->result_array();
		return $data[0]['field_name']   ;
	}
	function import_validation($table)
	{

		$sql = "select field_label,field_name,field_validations
		from ".$table."_meta";
		$query = $this->db->query($sql);
		$data =$query->result_array();
		return $data;
	}
	function insert_batch($Input_data,$table){
		$this->db->insert_batch($table,$Input_data);
		//echo json_encode($this->db->last_query());
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		$this->session->set_flashdata('message','Data Successfully Inserted and Affected are '.$data['affected_rows']);
		return $data;

	}
	function insert($Input_data){
		$this->db->insert($this->table,$Input_data);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['insert_id'] = $this->db->insert_id();
		$data['affected_rows'] = $this->db->affected_rows();
		$data['error_message'] = $this->db->_error_message();


		return $data;

	}


	public function update($Input_data){


		$this->db->where($this->primary_key,$Input_data[$this->primary_key]);
		unset($Input_data[$this->primary_key]);
		$this->db->update($this->table,$Input_data);
		//echo '<pre>'.print_r($this->db->last_query(),true);
		$data['affected_rows'] = $this->db->affected_rows();
		$data['error_message'] = $this->db->_error_message();
		$this->session->set_flashdata('message','Data Successfully Updated and Affected are '.$data['affected_rows']);

		//print_r($data);
		return $data;
	}
	public function delete($Input_data){
		$this->db->where_in($this->primary_key,$Input_data);
		$this->db->delete($this->table);
		$data['affected_rows'] = $this->db->affected_rows();
		$data['error_message'] = $this->db->_error_message();
		$this->session->set_flashdata('message','Data Successfully Deleted and Affected are '.$data['affected_rows']);
		return $data;
	}

}

?>
