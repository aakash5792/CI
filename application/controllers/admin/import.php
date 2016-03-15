<?php



/**
 *
 */
class import extends CI_Controller
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
  //  $this->load->model('admin/importmodel');

  }


  public function index(){
   		$data =$this->common->index('import_master');

   		 //echo '<pre>'.print_r($data,true);die();
    $this->load->view($data['url'],$data);
    $this->load->view('footer-links-1',$data);
  }
  public function import_list()
  { $sql_data =$this->common->sql_list('import_master');
    //echo '<pre>'.print_r($sql_data,true);
    $ssp_file = 'IncludeViews/ssp1.php';
    require($ssp_file);
    echo json_encode(
        SSP::simple( $_POST, $sql_data['sql_details'],$sql_data['table'],$sql_data['primary_key'], $sql_data['columns'] )
    );
  }
  public function import_action(){

   $main ="assets/app/files/imports/";
    $file =$_FILES["import_file_path"];
   $dir =$main.$file['name'];


    $str = explode('.',$file['name']);
    $table = $str[0];
    $file = fopen($file['tmp_name'],"r");
    while(!feof($file))
        {
        $data[] =fgetcsv($file);
    }
    $labels = $data[0];
    unset($data[0]);
    foreach ($labels as $key => $value) {
      $fields[] = $this->common->get_table_field_name($table,$value);
    }
      foreach ($data as $key => $value) {
        //echo '<pre>'.print_r($value,true);
        foreach ($fields as $k => $v) {
            $line[$v] = $value[$k];
          }
          $line["user_created_by"]= $_SESSION['user_data']['result'][0]['user_code'];
    			$line["user_created_date"]=  date("Y-m-d h:i:s");
    			$line["user_modified_by"]= $_SESSION['user_data']['result'][0]['user_code'];
    			$line["user_modified_date"]= date("Y-m-d h:i:s");

          $array[] = $line;
      }
      $count = count($array) -1;
    unset($array[$count]);
    $validation = $this->common->import_validation($table);
    $data = $this->common->index($table);
    //echo '<pre>'.print_r($validation,true);
    foreach ($array as $keys => $values) {
      $_POST = $values;
      foreach ($validation as $key => $value) {
        $this->form_validation->set_rules($value['field_name'],$value['field_label'],str_replace(' ', '',$value['field_validations']));
      }
    }

if (move_uploaded_file($file['tmp_name'], $dir)) {

                $this->session->set_flashdata('message', "The files are been uploaded.");
            } else {
                  $this->session->set_flashdata('message', 'Sorry, there was an error uploading your file.');
            }


    if ($this->form_validation->run() == FALSE)
    {
     $data =$this->common->index('import_master');

       //echo '<pre>'.print_r($data,true);die();
    $this->load->view($data['url'],$data);
    $this->load->view('footer-links-1',$data);

    }else{
      $data = $this->common->insert_batch($array,$table);
      redirect('admin/import');
    }





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

  public function import_action_excel(){
    $file =$_FILES["file"];
    $main   = "assets/app/file/import/";
        $target_dir = $main;

        $file = $_FILES["file"];
        $names = $_FILES["file"]['name'];
        $newFileName = explode(".",$names);;
        echo '<pre>'.print_r($newFileName,true);
        $filename = $file['tmp_name'];
        chmod($filename,0777);
        $this->excel_reader->read($filename);
        $sheets = $this->excel_reader->sheets;
        $cell_data = $sheets[0]['cells'];
        $field =$cell_data[1];
        unset($cell_data[1]);
        $new_excel_data =  array();
        foreach ($cell_data as $cell_data_key => $cell_data_value) {
          foreach ($field as $field_key => $field_value) {
            $new_excel_data[$cell_data_key][$field_value] = (isset($cell_data_value[$field_key])) ? $cell_data_value[$field_key] : '';
          }

        }
        //echo '<pre>'.print_r($new_excel_data,true);

        //$data = $this->importmodel->import_insert($new_excel_data);
         //echo '<pre>'.print_r($data,true);
        //echo '<pre>'.print_r($cell_data[2],true);



  }

}




 ?>
