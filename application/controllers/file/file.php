<?php

/**
*
*/
class file extends CI_Controller
{

	public function __construct(){
		parent::__construct();
		if(!isset($_SESSION['user_data']))
		{
			//echo 'session is not set';
			redirect(base_url().'login');
		}
		//unset($_SESSION['user_data']);
		$this->load->helper('file');
		$this->load->model('common');
	}

     public function file_action()
    {

        $main       = $this->input->post('file_path');
        $target_dir = $main;

        $files = $_FILES["files"];
        $names = $_FILES["files"]['name'];
        //echo '<pre>'.print_r($files,true);


        foreach ($names as $key => $value) {
            $target_file = $target_dir .'/'. basename($files['name'][$key]);
            if (move_uploaded_file($files['tmp_name'][$key], $target_file)) {

                $this->session->set_flashdata('message', "The files are been uploaded.");
            } else {
                echo "Sorry, there was an error uploading your file.";
            }


        }
        redirect(base_url() . 'file/file/fileupload/');

    }
    public function fileupload()
    {
    $data =$this->common->index('file');
        //echo '<pre>'.print_r($data,true);die();
        $main                     = "assets/app/file/mens/";
     $dir   = $main;
        // Open a directory, and read its contents
        $files = array();
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if ($file != '.' && $file != '..') {
                        $file_path                =  $main.$file;
                        $file_detail['file_path'] = $file_path;
                        $file_detail['file_name'] = ucfirst($file);
                        array_push($files, $file_detail);
                    }
                }
                closedir($dh);
            }
        }
        $data['dir'] = $files;
        $this->load->view('file/fileupload', $data);
        $this->load->view('footer-links', $data);

    }
    public function fileview()
    {
    $data =$this->common->index('file');
        //echo '<pre>'.print_r($data,true);die();
        $main                     = "assets/app/file/mens/";
    $dir   = $main;
       // Open a directory, and read its contents
       $files = array();
       if (is_dir($dir)) {
           if ($dh = opendir($dir)) {
               while (($file = readdir($dh)) !== false) {
                   if ($file != '.' && $file != '..') {
                       $file_path                =  $main.$file;
                       $file_detail['file_path'] = $file_path;
                       $file_detail['file_name'] = ucfirst($file);
                       array_push($files, $file_detail);
                   }
               }
               closedir($dh);
           }
       }
        $data['dir'] = $files;
        //echo '<pre>'.print_r($data['dir'],true);
        $this->load->view('file/fileview', $data);
        $this->load->view('footer-links', $data);

    }
    public function fileviewajax()
    {
        $main  = $this->input->post('file_path');
        $dir   = $main;
        // Open a directory, and read its contents
        $files = array();
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if ($file != '.' && $file != '..') {
                        $file_path                = $main . '/' . $file;
                        $file_detail['file_path'] = $file_path;
                        $file_detail['file_name'] = $file;
                        array_push($files, $file_detail);
                    }
                }
                closedir($dh);
            }
        }
        $data['dir'] = $files;
        //echo '<pre>'.print_r($data['dir'],true);
        $this->load->view('file/fileviewajax', $data);
    }
    public function delete_file()
    {
        $main = $this->input->post('file_path');
        $dir  = $main;
        if (is_file($dir)) {
            unlink($dir);
            $data['alert'] = 'Succesfull';
        } else {
            $data['alert'] = 'fail';
        }
        echo json_encode($data);

    }
	public function index(){
		$data =$this->common->index('file');
		//echo '<pre>'.print_r($data,true);die();
		$this->load->view($data['url'],$data);
		$this->load->view('footer-links-1',$data);

	}
	public function file_list(){
		$sql_data =$this->common->sql_list('file');
		//echo '<pre>'.print_r($sql_data,true);
		$ssp_file = 'IncludeViews/ssp1.php';
		require($ssp_file);
		echo json_encode(
		    SSP::simple( $_POST, $sql_data['sql_details'],$sql_data['table'],$sql_data['primary_key'], $sql_data['columns'] )
		);
	}

	/*public function file_action(){
		$data =$this->common->index('file');
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

	}*/
	public function file_delete(){
		$data =$this->common->index('file');
		$Input_data = $this->input->post('Input_data');
		$data = $this->common->delete($Input_data);

		echo json_encode($data);
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
	
}

?>
