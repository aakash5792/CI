<?php

/**
 *
 */
class dbmodel extends CI_Model
{
    public function __construct()
    {
        parent::__construct();

    }
    function show_database()
    {
        $sql   = "show databases";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
    function show_tables($database)
    {
        $sql   = "show tables  from $database";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
    function show_table_field($table,$database)
    {

       $sql   = "SELECT column_name
FROM  information_schema.columns
WHERE table_name = '$table'
and table_schema='$database'";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
    function show_field_values($field,$table,$database)
    {

       $sql   = "SELECT $field
FROM  $database.$table";
        $query = $this->db->query($sql);
        return $query->result_array();
    }
    
    function get_sql_queries($database,$sql_queries)
    {
        $this->load->dbutil();
        $CI =& get_instance();
        $CI->load->database();
        $username = $data['username'] = $CI->db->username;
        $password = $data['password'] = $CI->db->password;
        $hostname = $data['hostname'] = $CI->db->hostname;
        $dbdriver = $data['dbdriver'] = $CI->db->dbdriver;
        $master_database = $data['master_database'] = $database;
        $dsn = $dbdriver . ':host=' . $hostname . ';dbname=' . $database;
        $dbc = new PDO($dsn, $username, $password);
        $query = $dbc->prepare($sql_queries);
        $query->execute();
$data['num_rows'] = $query->rowCount();
   $data['errorInfo'] = $query->errorInfo();
        $a = array();
foreach(range(0, $query->columnCount() - 1) as $column_index)
{
  $meta[] = $query->getColumnMeta($column_index);
}


foreach ($meta as $keys => $values) {
  foreach ($values as $key => $value) {
      if($key == 'name'){
       $b['Field'] =$value;
      array_push($a,$b);
      }
    }

}

        $data['columns'] =$a;


$data['result'] = $query->fetchAll(PDO::FETCH_ASSOC);


       // echo '<pre>'.print_r($data,true);die();

        return $data;
    }



    public function index($database,$table){
         $sql   = "SHOW COLUMNS from $database.$table";
        $query = $this->db->query($sql);
        $data['ColumnNames'] =$query->result_array();
        return $data;
    }

    function show_table_details($database, $table, $field, $from_date, $to_date)
    {
        $sql   = "select *  from $database.$table where
        $field between '$from_date'  and '$to_date'";
        $data =$this->get_sql_queries($database,$sql);
      return $data;
    }

    function backup($database, $table, $field, $from_date, $to_date)
    {
        $db_exist = $this->db_exist($database);
      //  echo '<pre>' . print_r($db_exist, true);
        $database =$database.'_backup';
        $masterdatabase = $db_exist['master_database'];
        $today          = date('d_m_Y_h_i_s');
        $table_new      = $table . '_' . $today;
        $create_sql     = "CREATE TABLE $database.$table_new LIKE $masterdatabase.$table";
        $this->db->query($create_sql);
        ///table created

        $sql = "INSERT INTO $database.$table_new
                    select *  from $masterdatabase.$table where
                   $field >='$from_date'  and $field <='$to_date'";
        if ($this->db->query($sql)) {
            ///table data inserted
            $data['insert_affected_rows'] = $this->db->affected_rows();

                      $sql = "Delete  from $masterdatabase.$table where
                    $field >='$from_date'  and $field <='$to_date'";

                    if ($this->db->query($sql)) {
                        //all data from master database deleted
                            $data['delete_affected_rows'] = $this->db->affected_rows();
                      $this->session->set_flashdata('message', 'Backup Successfully taken in database'.$database.' and table is '.$table_new);

                          $data['alert'] = 'Success';
                      } else {
                          $this->session->set_flashdata('message', 'Table creation Error');
                          $data['affected_rows'] = $this->db->affected_rows();
                          $data['alert']         = 'fail';
                      }

        } else {
            $this->session->set_flashdata('message', 'Table creation Error');
            $data['affected_rows'] = $this->db->affected_rows();

        }


        return $data;

    }

    function db_exist($database)
    {
        $this->load->dbutil();
        $CI =& get_instance();
        $CI->load->database();
        $username = $data['username'] = $CI->db->username;
        $password = $data['password'] = $CI->db->password;
        $hostname = $data['hostname'] = $CI->db->hostname;
        $dbdriver = $data['dbdriver'] = $CI->db->dbdriver;
        $master_database = $data['master_database'] = $database;
        $dsn = $dbdriver . ':host=' . $hostname . ';dbname=' . $database;


            $database_backup =$database.'_backup';
          //echo '<pre>'.print_r($database_backup,true);
 $this->dbutil->database_exists($database_backup);


 $sql  = "SELECT table_schema
FROM  information_schema.columns
WHERE table_schema = '$database_backup'";
$query = $this->db->query($sql);
        
        if ($query->num_rows() !=0) {
            //echo 'exist';
            $data['dbh'] = new PDO($dsn, $username, $password);
        } else {
            // echo 'not exist';
            if ($this->dbforge->create_database($database_backup)) {
                //echo 'Database created!';
                $data['dbh'] = new PDO($dsn, $username, $password);
            }
        }
        return $data;
    }



}


?>
