<?php

	//include all DAO files
	require_once('include_dao.php');
		
	//start new transaction
	$transaction = new Transaction();
	
	
	//创建一个group实例对象，把一条记录插入到Groups表中
	$group = new Group();
	$group->name = "administrator";
//	DAOFactory::getGroupsDAO()->insert($group);
	echo 'generated id = '.$group->id.'<br/>';	


  //查询Modules表中 主键为3的值
	//load row where primary key equal 3
	$module = DAOFactory::getModulesDAO()->load(3);
	echo $module->title.'<br/>';;
	
	
	//将次主键为3的记录 content值设置为 XXXX
	$module->content = "Sample content";
	//update row
	DAOFactory::getModulesDAO()->update($module);
	
	
	
	//删除Session表中 主键为10的记录
	//delete row where primary key equal 10
	$rowsDeleted = DAOFactory::getSessionDAO()->delete(10);
	echo 'rows deleted = '.$rowsDeleted.'<br/>';
		
		
  //提交
	//commit transaction
	$transaction->commit();

	echo '<br/><br/>';
	
	
	//打印Categories表中记录，按照title进行排序
	//print all rows order by title
	$arr = DAOFactory::getCategoriesDAO()->queryAllOrderBy('title');
	for($i=0;$i<count($arr);$i++){
		$row = $arr[$i];
		echo $row->id.' '.$row->title.'<br/>';
	}
	
	echo '<br/><br/>';
	
	
	//打印Modules时，以showtitle为排序，等于0的记录打印 
	//print all rows where column 'showtitle'  is equal '0'
	$arr = DAOFactory::getModulesDAO()->queryByShowtitle('0');
	for($i=0;$i<count($arr);$i++){
		$row = $arr[$i];
		echo $row->id.' '.$row->title.'<br/>';
	}
	
	echo '<br/><br/>';

  //打印Content表中 content like 'Mambo' 和 creted_by = 62 的
	//print all rows where content like 'Mambo' and creted_by is equal 62
	$arr = DAOFactory::getContentDAO()->queryByContentAndCreatedBy('Mambo', 62);
	for($i=0;$i<count($arr);$i++){
		$row = $arr[$i];
		echo $row->id.' '.$row->title.'<br/>';
	}
	
	echo '<br/>aaaaaaaaa<br/>';
	
	//打印关联Content和User表中, username和title的内容
	$tab = DAOFactory::getContentDAO()->getUserNameAndContentTitle();
	for($i=0;$i<count($tab);$i++){
		echo $tab[$i]->username.' : '.$tab[$i]->title.'<br/>';
	}
	
	echo '<br/><br/>';
	
	//取Content表中  CreatedBy条件= 62 的 数量 17个 
	echo DAOFactory::getContentDAO()->getCountByCreatedBy(62);
	
	echo '<br/><br/>';
	
	//start new transaction
	$transaction = new Transaction();


  //删除 所有 Modules 中 showtitle = 1 的记录
	//delete rows where content equal 'cnt'
	$rowsDeleted = DAOFactory::getModulesDAO()->deleteByShowtitle('1');
	echo 'rows deleted = '.$rowsDeleted.'<br/>';
	

	//回滚
	//clean table
	DAOFactory::getContentDAO()->clean();
	$transaction->rollback();
	
	
	//设置PlayersToTeams表中1:8, 2:2的记录,然后 更新name值为 new name
	//Examples how use complex primary keys
	$ptt = DAOFactory::getPlayersToTeamsDAO()->load(2,3);
	echo $ptt->name.'<br/>';
	$ptt->name = "new name";
	DAOFactory::getPlayersToTeamsDAO()->update($ptt);
	
	// 删除PlayersToTeams表中1:8, 2:2的记录.
	$rowsDeleted = DAOFactory::getPlayersToTeamsDAO()->delete(8,2);
	echo 'rows deleted = '.$rowsDeleted.'<br/>';
	
	//插入一条记录 指定记录
	$p = new PlayersToTeam();
	$p->teamId=17;
	$p->playerId=15;
	$p->name=test;
	DAOFactory::getPlayers2ToTeamsDAO()->insert($p);
?>