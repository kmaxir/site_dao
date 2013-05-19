<?php

	//include all DAO files
	require_once('include_dao.php');
		
	//start new transaction
	$transaction = new Transaction();
	
	
	//����һ��groupʵ�����󣬰�һ����¼���뵽Groups����
	$group = new Group();
	$group->name = "administrator";
//	DAOFactory::getGroupsDAO()->insert($group);
	echo 'generated id = '.$group->id.'<br/>';	


  //��ѯModules���� ����Ϊ3��ֵ
	//load row where primary key equal 3
	$module = DAOFactory::getModulesDAO()->load(3);
	echo $module->title.'<br/>';;
	
	
	//��������Ϊ3�ļ�¼ contentֵ����Ϊ XXXX
	$module->content = "Sample content";
	//update row
	DAOFactory::getModulesDAO()->update($module);
	
	
	
	//ɾ��Session���� ����Ϊ10�ļ�¼
	//delete row where primary key equal 10
	$rowsDeleted = DAOFactory::getSessionDAO()->delete(10);
	echo 'rows deleted = '.$rowsDeleted.'<br/>';
		
		
  //�ύ
	//commit transaction
	$transaction->commit();

	echo '<br/><br/>';
	
	
	//��ӡCategories���м�¼������title��������
	//print all rows order by title
	$arr = DAOFactory::getCategoriesDAO()->queryAllOrderBy('title');
	for($i=0;$i<count($arr);$i++){
		$row = $arr[$i];
		echo $row->id.' '.$row->title.'<br/>';
	}
	
	echo '<br/><br/>';
	
	
	//��ӡModulesʱ����showtitleΪ���򣬵���0�ļ�¼��ӡ 
	//print all rows where column 'showtitle'  is equal '0'
	$arr = DAOFactory::getModulesDAO()->queryByShowtitle('0');
	for($i=0;$i<count($arr);$i++){
		$row = $arr[$i];
		echo $row->id.' '.$row->title.'<br/>';
	}
	
	echo '<br/><br/>';

  //��ӡContent���� content like 'Mambo' �� creted_by = 62 ��
	//print all rows where content like 'Mambo' and creted_by is equal 62
	$arr = DAOFactory::getContentDAO()->queryByContentAndCreatedBy('Mambo', 62);
	for($i=0;$i<count($arr);$i++){
		$row = $arr[$i];
		echo $row->id.' '.$row->title.'<br/>';
	}
	
	echo '<br/>aaaaaaaaa<br/>';
	
	//��ӡ����Content��User����, username��title������
	$tab = DAOFactory::getContentDAO()->getUserNameAndContentTitle();
	for($i=0;$i<count($tab);$i++){
		echo $tab[$i]->username.' : '.$tab[$i]->title.'<br/>';
	}
	
	echo '<br/><br/>';
	
	//ȡContent����  CreatedBy����= 62 �� ���� 17�� 
	echo DAOFactory::getContentDAO()->getCountByCreatedBy(62);
	
	echo '<br/><br/>';
	
	//start new transaction
	$transaction = new Transaction();


  //ɾ�� ���� Modules �� showtitle = 1 �ļ�¼
	//delete rows where content equal 'cnt'
	$rowsDeleted = DAOFactory::getModulesDAO()->deleteByShowtitle('1');
	echo 'rows deleted = '.$rowsDeleted.'<br/>';
	

	//�ع�
	//clean table
	DAOFactory::getContentDAO()->clean();
	$transaction->rollback();
	
	
	//����PlayersToTeams����1:8, 2:2�ļ�¼,Ȼ�� ����nameֵΪ new name
	//Examples how use complex primary keys
	$ptt = DAOFactory::getPlayersToTeamsDAO()->load(2,3);
	echo $ptt->name.'<br/>';
	$ptt->name = "new name";
	DAOFactory::getPlayersToTeamsDAO()->update($ptt);
	
	// ɾ��PlayersToTeams����1:8, 2:2�ļ�¼.
	$rowsDeleted = DAOFactory::getPlayersToTeamsDAO()->delete(8,2);
	echo 'rows deleted = '.$rowsDeleted.'<br/>';
	
	//����һ����¼ ָ����¼
	$p = new PlayersToTeam();
	$p->teamId=17;
	$p->playerId=15;
	$p->name=test;
	DAOFactory::getPlayers2ToTeamsDAO()->insert($p);
?>