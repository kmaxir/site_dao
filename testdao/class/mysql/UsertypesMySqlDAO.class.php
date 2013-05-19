<?php
/*
 * Class that operate on table 'usertypes'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2009-11-24 17:17
 */
class UsertypesMySqlDAO implements UsertypesDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return UsertypesMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM usertypes WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM usertypes';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM usertypes ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param usertype primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM usertypes WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param UsertypesMySql usertype
 	 */
	public function insert($usertype){
		$sql = 'INSERT INTO usertypes (name, mask) VALUES (?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($usertype->name);
		$sqlQuery->set($usertype->mask);

		$id = $this->executeInsert($sqlQuery);	
		$usertype->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param UsertypesMySql usertype
 	 */
	public function update($usertype){
		$sql = 'UPDATE usertypes SET name = ?, mask = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($usertype->name);
		$sqlQuery->set($usertype->mask);

		$sqlQuery->setNumber($usertype->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM usertypes';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByName($value){
		$sql = 'SELECT * FROM usertypes WHERE name = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMask($value){
		$sql = 'SELECT * FROM usertypes WHERE mask = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByName($value){
		$sql = 'DELETE FROM usertypes WHERE name = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMask($value){
		$sql = 'DELETE FROM usertypes WHERE mask = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return UsertypesMySql 
	 */
	protected function readRow($row){
		$usertype = new Usertype();
		
		$usertype->id = $row['id'];
		$usertype->name = $row['name'];
		$usertype->mask = $row['mask'];

		return $usertype;
	}
	
	protected function getList($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$ret[$i] = $this->readRow($tab[$i]);
		}
		return $ret;
	}
	
	/**
	 * Get row
	 *
	 * @return UsertypesMySql 
	 */
	protected function getRow($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		if(count($tab)==0){
			return null;
		}
		return $this->readRow($tab[0]);		
	}
	
	/**
	 * Execute sql query
	 */
	protected function execute($sqlQuery){
		return QueryExecutor::execute($sqlQuery);
	}
	
		
	/**
	 * Execute sql query
	 */
	protected function executeUpdate($sqlQuery){
		return QueryExecutor::executeUpdate($sqlQuery);
	}

	/**
	 * Query for one row and one column
	 */
	protected function querySingleResult($sqlQuery){
		return QueryExecutor::queryForString($sqlQuery);
	}

	/**
	 * Insert row to table
	 */
	protected function executeInsert($sqlQuery){
		return QueryExecutor::executeInsert($sqlQuery);
	}
}
?>