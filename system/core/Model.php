<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		EllisLab Dev Team
 * @copyright		Copyright (c) 2008 - 2014, EllisLab, Inc.
 * @copyright		Copyright (c) 2014 - 2015, British Columbia Institute of Technology (http://bcit.ca/)
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * CodeIgniter Model Class
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		EllisLab Dev Team
 * @link		http://codeigniter.com/user_guide/libraries/config.html
 */
class CI_Model {

	/**
	 * Constructor
	 *
	 * @access public
	 */
	function __construct()
	{
		log_message('debug', "Model Class Initialized");
	}

	/**
	 * __get
	 *
	 * Allows models to access CI's loaded classes using the same
	 * syntax as controllers.
	 *
	 * @param	string
	 * @access private
	 */
	function __get($key)
	{
		$CI =& get_instance();
		return $CI->$key;
	}

	public function ViewColumnNames($TableName)
	{
		$result = mysql_query("SHOW COLUMNS FROM $TableName");
		if (!$result) {
		    echo 'Could not run query: ' . mysql_error();
		    exit;
		}
		if (mysql_num_rows($result) > 0) {
			$result_array = array();
			while($row = mysql_fetch_assoc($result)){
			array_push($result_array,$row);
			}
			return $result_array;
		}
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
}
// END Model Class

/* End of file Model.php */
/* Location: ./system/core/Model.php */