<?php
/*
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2009-11-24 17:17
 */
interface UsertypesDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Usertypes 
	 */
	public function load($id);

	/**
	 * Get all records from table
	 */
	public function queryAll();
	
	/**
	 * Get all records from table ordered by field
	 * @Param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn);
	
	/**
 	 * Delete record from table
 	 * @param usertype primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Usertypes usertype
 	 */
	public function insert($usertype);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Usertypes usertype
 	 */
	public function update($usertype);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByName($value);

	public function queryByMask($value);


	public function deleteByName($value);

	public function deleteByMask($value);


}
?>