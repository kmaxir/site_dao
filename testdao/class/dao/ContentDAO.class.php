<?php
/*
 * Intreface DAO
 *
 * @author: http://phpdao.com
 * @date: 2009-11-24 17:17
 */
interface ContentDAO{

	/**
	 * Get Domain object by primry key
	 *
	 * @param String $id primary key
	 * @Return Content 
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
 	 * @param content primary key
 	 */
	public function delete($id);
	
	/**
 	 * Insert record to table
 	 *
 	 * @param Content content
 	 */
	public function insert($content);
	
	/**
 	 * Update record in table
 	 *
 	 * @param Content content
 	 */
	public function update($content);	

	/**
	 * Delete all rows
	 */
	public function clean();

	public function queryByTitle($value);

	public function queryByTitleAlias($value);

	public function queryByIntrotext($value);

	public function queryByFulltext($value);

	public function queryByState($value);

	public function queryBySectionid($value);

	public function queryByMask($value);

	public function queryByCatid($value);

	public function queryByCreated($value);

	public function queryByCreatedBy($value);

	public function queryByCreatedByAlias($value);

	public function queryByModified($value);

	public function queryByModifiedBy($value);

	public function queryByCheckedOut($value);

	public function queryByCheckedOutTime($value);

	public function queryByPublishUp($value);

	public function queryByPublishDown($value);

	public function queryByImages($value);

	public function queryByUrls($value);

	public function queryByAttribs($value);

	public function queryByVersion($value);

	public function queryByParentid($value);

	public function queryByOrdering($value);

	public function queryByMetakey($value);

	public function queryByMetadesc($value);

	public function queryByAccess($value);

	public function queryByHits($value);


	public function deleteByTitle($value);

	public function deleteByTitleAlias($value);

	public function deleteByIntrotext($value);

	public function deleteByFulltext($value);

	public function deleteByState($value);

	public function deleteBySectionid($value);

	public function deleteByMask($value);

	public function deleteByCatid($value);

	public function deleteByCreated($value);

	public function deleteByCreatedBy($value);

	public function deleteByCreatedByAlias($value);

	public function deleteByModified($value);

	public function deleteByModifiedBy($value);

	public function deleteByCheckedOut($value);

	public function deleteByCheckedOutTime($value);

	public function deleteByPublishUp($value);

	public function deleteByPublishDown($value);

	public function deleteByImages($value);

	public function deleteByUrls($value);

	public function deleteByAttribs($value);

	public function deleteByVersion($value);

	public function deleteByParentid($value);

	public function deleteByOrdering($value);

	public function deleteByMetakey($value);

	public function deleteByMetadesc($value);

	public function deleteByAccess($value);

	public function deleteByHits($value);


}
?>