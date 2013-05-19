<?php
/*
 * Class that operate on table 'content'. Database Mysql.
 *
 * @author: http://phpdao.com
 * @date: 2009-11-24 17:17
 */
class ContentMySqlDAO implements ContentDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @return ContentMySql 
	 */
	public function load($id){
		$sql = 'SELECT * FROM content WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM content';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param $orderColumn column name
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM content ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
 	 * Delete record from table
 	 * @param content primary key
 	 */
	public function delete($id){
		$sql = 'DELETE FROM content WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($id);
		return $this->executeUpdate($sqlQuery);
	}
	
	/**
 	 * Insert record to table
 	 *
 	 * @param ContentMySql content
 	 */
	public function insert($content){
		$sql = 'INSERT INTO content (title, title_alias, introtext, fulltext, state, sectionid, mask, catid, created, created_by, created_by_alias, modified, modified_by, checked_out, checked_out_time, publish_up, publish_down, images, urls, attribs, version, parentid, ordering, metakey, metadesc, access, hits) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($content->title);
		$sqlQuery->set($content->titleAlia);
		$sqlQuery->set($content->introtext);
		$sqlQuery->set($content->fulltext);
		$sqlQuery->setNumber($content->state);
		$sqlQuery->setNumber($content->sectionid);
		$sqlQuery->setNumber($content->mask);
		$sqlQuery->setNumber($content->catid);
		$sqlQuery->set($content->created);
		$sqlQuery->setNumber($content->createdBy);
		$sqlQuery->set($content->createdByAlia);
		$sqlQuery->set($content->modified);
		$sqlQuery->setNumber($content->modifiedBy);
		$sqlQuery->setNumber($content->checkedOut);
		$sqlQuery->set($content->checkedOutTime);
		$sqlQuery->set($content->publishUp);
		$sqlQuery->set($content->publishDown);
		$sqlQuery->set($content->image);
		$sqlQuery->set($content->url);
		$sqlQuery->set($content->attrib);
		$sqlQuery->setNumber($content->version);
		$sqlQuery->setNumber($content->parentid);
		$sqlQuery->setNumber($content->ordering);
		$sqlQuery->set($content->metakey);
		$sqlQuery->set($content->metadesc);
		$sqlQuery->setNumber($content->acces);
		$sqlQuery->setNumber($content->hit);

		$id = $this->executeInsert($sqlQuery);	
		$content->id = $id;
		return $id;
	}
	
	/**
 	 * Update record in table
 	 *
 	 * @param ContentMySql content
 	 */
	public function update($content){
		$sql = 'UPDATE content SET title = ?, title_alias = ?, introtext = ?, fulltext = ?, state = ?, sectionid = ?, mask = ?, catid = ?, created = ?, created_by = ?, created_by_alias = ?, modified = ?, modified_by = ?, checked_out = ?, checked_out_time = ?, publish_up = ?, publish_down = ?, images = ?, urls = ?, attribs = ?, version = ?, parentid = ?, ordering = ?, metakey = ?, metadesc = ?, access = ?, hits = ? WHERE id = ?';
		$sqlQuery = new SqlQuery($sql);
		
		$sqlQuery->set($content->title);
		$sqlQuery->set($content->titleAlia);
		$sqlQuery->set($content->introtext);
		$sqlQuery->set($content->fulltext);
		$sqlQuery->setNumber($content->state);
		$sqlQuery->setNumber($content->sectionid);
		$sqlQuery->setNumber($content->mask);
		$sqlQuery->setNumber($content->catid);
		$sqlQuery->set($content->created);
		$sqlQuery->setNumber($content->createdBy);
		$sqlQuery->set($content->createdByAlia);
		$sqlQuery->set($content->modified);
		$sqlQuery->setNumber($content->modifiedBy);
		$sqlQuery->setNumber($content->checkedOut);
		$sqlQuery->set($content->checkedOutTime);
		$sqlQuery->set($content->publishUp);
		$sqlQuery->set($content->publishDown);
		$sqlQuery->set($content->image);
		$sqlQuery->set($content->url);
		$sqlQuery->set($content->attrib);
		$sqlQuery->setNumber($content->version);
		$sqlQuery->setNumber($content->parentid);
		$sqlQuery->setNumber($content->ordering);
		$sqlQuery->set($content->metakey);
		$sqlQuery->set($content->metadesc);
		$sqlQuery->setNumber($content->acces);
		$sqlQuery->setNumber($content->hit);

		$sqlQuery->setNumber($content->id);
		return $this->executeUpdate($sqlQuery);
	}

	/**
 	 * Delete all rows
 	 */
	public function clean(){
		$sql = 'DELETE FROM content';
		$sqlQuery = new SqlQuery($sql);
		return $this->executeUpdate($sqlQuery);
	}

	public function queryByTitle($value){
		$sql = 'SELECT * FROM content WHERE title = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByTitleAlias($value){
		$sql = 'SELECT * FROM content WHERE title_alias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByIntrotext($value){
		$sql = 'SELECT * FROM content WHERE introtext = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByFulltext($value){
		$sql = 'SELECT * FROM content WHERE fulltext = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByState($value){
		$sql = 'SELECT * FROM content WHERE state = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryBySectionid($value){
		$sql = 'SELECT * FROM content WHERE sectionid = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMask($value){
		$sql = 'SELECT * FROM content WHERE mask = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCatid($value){
		$sql = 'SELECT * FROM content WHERE catid = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCreated($value){
		$sql = 'SELECT * FROM content WHERE created = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCreatedBy($value){
		$sql = 'SELECT * FROM content WHERE created_by = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCreatedByAlias($value){
		$sql = 'SELECT * FROM content WHERE created_by_alias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByModified($value){
		$sql = 'SELECT * FROM content WHERE modified = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByModifiedBy($value){
		$sql = 'SELECT * FROM content WHERE modified_by = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCheckedOut($value){
		$sql = 'SELECT * FROM content WHERE checked_out = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByCheckedOutTime($value){
		$sql = 'SELECT * FROM content WHERE checked_out_time = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPublishUp($value){
		$sql = 'SELECT * FROM content WHERE publish_up = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByPublishDown($value){
		$sql = 'SELECT * FROM content WHERE publish_down = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByImages($value){
		$sql = 'SELECT * FROM content WHERE images = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByUrls($value){
		$sql = 'SELECT * FROM content WHERE urls = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAttribs($value){
		$sql = 'SELECT * FROM content WHERE attribs = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByVersion($value){
		$sql = 'SELECT * FROM content WHERE version = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByParentid($value){
		$sql = 'SELECT * FROM content WHERE parentid = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByOrdering($value){
		$sql = 'SELECT * FROM content WHERE ordering = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMetakey($value){
		$sql = 'SELECT * FROM content WHERE metakey = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByMetadesc($value){
		$sql = 'SELECT * FROM content WHERE metadesc = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->getList($sqlQuery);
	}

	public function queryByAccess($value){
		$sql = 'SELECT * FROM content WHERE access = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}

	public function queryByHits($value){
		$sql = 'SELECT * FROM content WHERE hits = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->getList($sqlQuery);
	}


	public function deleteByTitle($value){
		$sql = 'DELETE FROM content WHERE title = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByTitleAlias($value){
		$sql = 'DELETE FROM content WHERE title_alias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByIntrotext($value){
		$sql = 'DELETE FROM content WHERE introtext = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByFulltext($value){
		$sql = 'DELETE FROM content WHERE fulltext = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByState($value){
		$sql = 'DELETE FROM content WHERE state = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteBySectionid($value){
		$sql = 'DELETE FROM content WHERE sectionid = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMask($value){
		$sql = 'DELETE FROM content WHERE mask = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCatid($value){
		$sql = 'DELETE FROM content WHERE catid = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCreated($value){
		$sql = 'DELETE FROM content WHERE created = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCreatedBy($value){
		$sql = 'DELETE FROM content WHERE created_by = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCreatedByAlias($value){
		$sql = 'DELETE FROM content WHERE created_by_alias = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByModified($value){
		$sql = 'DELETE FROM content WHERE modified = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByModifiedBy($value){
		$sql = 'DELETE FROM content WHERE modified_by = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCheckedOut($value){
		$sql = 'DELETE FROM content WHERE checked_out = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByCheckedOutTime($value){
		$sql = 'DELETE FROM content WHERE checked_out_time = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPublishUp($value){
		$sql = 'DELETE FROM content WHERE publish_up = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByPublishDown($value){
		$sql = 'DELETE FROM content WHERE publish_down = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByImages($value){
		$sql = 'DELETE FROM content WHERE images = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByUrls($value){
		$sql = 'DELETE FROM content WHERE urls = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAttribs($value){
		$sql = 'DELETE FROM content WHERE attribs = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByVersion($value){
		$sql = 'DELETE FROM content WHERE version = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByParentid($value){
		$sql = 'DELETE FROM content WHERE parentid = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByOrdering($value){
		$sql = 'DELETE FROM content WHERE ordering = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMetakey($value){
		$sql = 'DELETE FROM content WHERE metakey = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByMetadesc($value){
		$sql = 'DELETE FROM content WHERE metadesc = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByAccess($value){
		$sql = 'DELETE FROM content WHERE access = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}

	public function deleteByHits($value){
		$sql = 'DELETE FROM content WHERE hits = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->setNumber($value);
		return $this->executeUpdate($sqlQuery);
	}


	
	/**
	 * Read row
	 *
	 * @return ContentMySql 
	 */
	protected function readRow($row){
		$content = new Content();
		
		$content->id = $row['id'];
		$content->title = $row['title'];
		$content->titleAlia = $row['title_alias'];
		$content->introtext = $row['introtext'];
		$content->fulltext = $row['fulltext'];
		$content->state = $row['state'];
		$content->sectionid = $row['sectionid'];
		$content->mask = $row['mask'];
		$content->catid = $row['catid'];
		$content->created = $row['created'];
		$content->createdBy = $row['created_by'];
		$content->createdByAlia = $row['created_by_alias'];
		$content->modified = $row['modified'];
		$content->modifiedBy = $row['modified_by'];
		$content->checkedOut = $row['checked_out'];
		$content->checkedOutTime = $row['checked_out_time'];
		$content->publishUp = $row['publish_up'];
		$content->publishDown = $row['publish_down'];
		$content->image = $row['images'];
		$content->url = $row['urls'];
		$content->attrib = $row['attribs'];
		$content->version = $row['version'];
		$content->parentid = $row['parentid'];
		$content->ordering = $row['ordering'];
		$content->metakey = $row['metakey'];
		$content->metadesc = $row['metadesc'];
		$content->acces = $row['access'];
		$content->hit = $row['hits'];

		return $content;
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
	 * @return ContentMySql 
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