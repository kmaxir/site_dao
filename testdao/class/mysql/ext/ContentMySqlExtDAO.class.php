<?php
/*
 * Class that operate on table 'content'. Database Mysql.
 * Here you can write non standard sql queries
 *
 * @author: http://phpdao.com
 * @date: 2009-10-17 03:43
 */
class ContentMySqlExtDAO extends ContentMySqlDAO{
	
	function queryByContentAndCreatedBy($content, $createdBy){
		$sql = "SELECT * FROM content WHERE title like '%".$content."%' AND created_by=?";
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($createdBy);
		return $this->getList($sqlQuery);
	}	

	/**
	 * Get rows count where column created_by is equal to method param
	 */
	function getCountByCreatedBy($createdBy){
		$sql = "SELECT count(*) FROM content WHERE created_by=?";
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($createdBy);
		return $this->querySingleResult($sqlQuery);
	}
	
	/**
	 * This method returns array of object UserContent. 
	 * Here sql query gets data from two tables.
	 * Developer must loop by variable tab and create for all rows objec UserContent
	 * and add this object to new array
	 */
	function getUserNameAndContentTitle(){		
		$sql = "SELECT u.name, c.title FROM users u, content c WHERE c.created_by=u.id";
		$sqlQuery = new SqlQuery($sql);
		$tab = $this->execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$userContent = new UserContent();
			$userContent->username = $tab[$i]["name"];
			$userContent->title = $tab[$i]["title"];
			$ret[$i] = $userContent; 
		}
		return $ret;
	}
}

/**
 * Non standard transfer object 
 */
class UserContent{
	var $username;
	var $title;
}
?>
