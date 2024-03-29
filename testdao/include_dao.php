<?php
	//include all DAO files
	require_once('class/sql/Connection.class.php');
	require_once('class/sql/ConnectionFactory.class.php');
	require_once('class/sql/ConnectionProperty.class.php');
	require_once('class/sql/QueryExecutor.class.php');
	require_once('class/sql/Transaction.class.php');
	require_once('class/sql/SqlQuery.class.php');
	require_once('class/core/ArrayList.class.php');
	require_once('class/dao/DAOFactory.class.php');
 	
	require_once('class/dao/BannerDAO.class.php');
	require_once('class/dto/Banner.class.php');
	require_once('class/mysql/BannerMySqlDAO.class.php');
	require_once('class/mysql/ext/BannerMySqlExtDAO.class.php');
	require_once('class/dao/BannerclientDAO.class.php');
	require_once('class/dto/Bannerclient.class.php');
	require_once('class/mysql/BannerclientMySqlDAO.class.php');
	require_once('class/mysql/ext/BannerclientMySqlExtDAO.class.php');
	require_once('class/dao/BannerfinishDAO.class.php');
	require_once('class/dto/Bannerfinish.class.php');
	require_once('class/mysql/BannerfinishMySqlDAO.class.php');
	require_once('class/mysql/ext/BannerfinishMySqlExtDAO.class.php');
	require_once('class/dao/CategoriesDAO.class.php');
	require_once('class/dto/Categorie.class.php');
	require_once('class/mysql/CategoriesMySqlDAO.class.php');
	require_once('class/mysql/ext/CategoriesMySqlExtDAO.class.php');
	require_once('class/dao/CommentDAO.class.php');
	require_once('class/dto/Comment.class.php');
	require_once('class/mysql/CommentMySqlDAO.class.php');
	require_once('class/mysql/ext/CommentMySqlExtDAO.class.php');
	require_once('class/dao/ComponentsDAO.class.php');
	require_once('class/dto/Component.class.php');
	require_once('class/mysql/ComponentsMySqlDAO.class.php');
	require_once('class/mysql/ext/ComponentsMySqlExtDAO.class.php');
	require_once('class/dao/ContactDetailsDAO.class.php');
	require_once('class/dto/ContactDetail.class.php');
	require_once('class/mysql/ContactDetailsMySqlDAO.class.php');
	require_once('class/mysql/ext/ContactDetailsMySqlExtDAO.class.php');
	require_once('class/dao/ContainersDAO.class.php');
	require_once('class/dto/Container.class.php');
	require_once('class/mysql/ContainersMySqlDAO.class.php');
	require_once('class/mysql/ext/ContainersMySqlExtDAO.class.php');
	require_once('class/dao/ContentDAO.class.php');
	require_once('class/dto/Content.class.php');
	require_once('class/mysql/ContentMySqlDAO.class.php');
	require_once('class/mysql/ext/ContentMySqlExtDAO.class.php');
	require_once('class/dao/ContentFrontpageDAO.class.php');
	require_once('class/dto/ContentFrontpage.class.php');
	require_once('class/mysql/ContentFrontpageMySqlDAO.class.php');
	require_once('class/mysql/ext/ContentFrontpageMySqlExtDAO.class.php');
	require_once('class/dao/ContentRatingDAO.class.php');
	require_once('class/dto/ContentRating.class.php');
	require_once('class/mysql/ContentRatingMySqlDAO.class.php');
	require_once('class/mysql/ext/ContentRatingMySqlExtDAO.class.php');
	require_once('class/dao/CoreAclAroDAO.class.php');
	require_once('class/dto/CoreAclAro.class.php');
	require_once('class/mysql/CoreAclAroMySqlDAO.class.php');
	require_once('class/mysql/ext/CoreAclAroMySqlExtDAO.class.php');
	require_once('class/dao/CoreAclAroGroupsDAO.class.php');
	require_once('class/dto/CoreAclAroGroup.class.php');
	require_once('class/mysql/CoreAclAroGroupsMySqlDAO.class.php');
	require_once('class/mysql/ext/CoreAclAroGroupsMySqlExtDAO.class.php');
	require_once('class/dao/CoreAclAroSectionsDAO.class.php');
	require_once('class/dto/CoreAclAroSection.class.php');
	require_once('class/mysql/CoreAclAroSectionsMySqlDAO.class.php');
	require_once('class/mysql/ext/CoreAclAroSectionsMySqlExtDAO.class.php');
	require_once('class/dao/CoreAclGroupsAroMapDAO.class.php');
	require_once('class/dto/CoreAclGroupsAroMap.class.php');
	require_once('class/mysql/CoreAclGroupsAroMapMySqlDAO.class.php');
	require_once('class/mysql/ext/CoreAclGroupsAroMapMySqlExtDAO.class.php');
	require_once('class/dao/GroupsDAO.class.php');
	require_once('class/dto/Group.class.php');
	require_once('class/mysql/GroupsMySqlDAO.class.php');
	require_once('class/mysql/ext/GroupsMySqlExtDAO.class.php');
	require_once('class/dao/MambotsDAO.class.php');
	require_once('class/dto/Mambot.class.php');
	require_once('class/mysql/MambotsMySqlDAO.class.php');
	require_once('class/mysql/ext/MambotsMySqlExtDAO.class.php');
	require_once('class/dao/MenuDAO.class.php');
	require_once('class/dto/Menu.class.php');
	require_once('class/mysql/MenuMySqlDAO.class.php');
	require_once('class/mysql/ext/MenuMySqlExtDAO.class.php');
	require_once('class/dao/MessagesDAO.class.php');
	require_once('class/dto/Message.class.php');
	require_once('class/mysql/MessagesMySqlDAO.class.php');
	require_once('class/mysql/ext/MessagesMySqlExtDAO.class.php');
	require_once('class/dao/MessagesCfgDAO.class.php');
	require_once('class/dto/MessagesCfg.class.php');
	require_once('class/mysql/MessagesCfgMySqlDAO.class.php');
	require_once('class/mysql/ext/MessagesCfgMySqlExtDAO.class.php');
	require_once('class/dao/ModulesDAO.class.php');
	require_once('class/dto/Module.class.php');
	require_once('class/mysql/ModulesMySqlDAO.class.php');
	require_once('class/mysql/ext/ModulesMySqlExtDAO.class.php');
	require_once('class/dao/ModulesMenuDAO.class.php');
	require_once('class/dto/ModulesMenu.class.php');
	require_once('class/mysql/ModulesMenuMySqlDAO.class.php');
	require_once('class/mysql/ext/ModulesMenuMySqlExtDAO.class.php');
	require_once('class/dao/NewsfeedsDAO.class.php');
	require_once('class/dto/Newsfeed.class.php');
	require_once('class/mysql/NewsfeedsMySqlDAO.class.php');
	require_once('class/mysql/ext/NewsfeedsMySqlExtDAO.class.php');
	require_once('class/dao/ParametersDAO.class.php');
	require_once('class/dto/Parameter.class.php');
	require_once('class/mysql/ParametersMySqlDAO.class.php');
	require_once('class/mysql/ext/ParametersMySqlExtDAO.class.php');
	require_once('class/dao/PlayersToTeamsDAO.class.php');
	require_once('class/dto/PlayersToTeam.class.php');
	require_once('class/mysql/PlayersToTeamsMySqlDAO.class.php');
	require_once('class/mysql/ext/PlayersToTeamsMySqlExtDAO.class.php');
	require_once('class/dao/PollDataDAO.class.php');
	require_once('class/dto/PollData.class.php');
	require_once('class/mysql/PollDataMySqlDAO.class.php');
	require_once('class/mysql/ext/PollDataMySqlExtDAO.class.php');
	require_once('class/dao/PollDateDAO.class.php');
	require_once('class/dto/PollDate.class.php');
	require_once('class/mysql/PollDateMySqlDAO.class.php');
	require_once('class/mysql/ext/PollDateMySqlExtDAO.class.php');
	require_once('class/dao/PollMenuDAO.class.php');
	require_once('class/dto/PollMenu.class.php');
	require_once('class/mysql/PollMenuMySqlDAO.class.php');
	require_once('class/mysql/ext/PollMenuMySqlExtDAO.class.php');
	require_once('class/dao/PollsDAO.class.php');
	require_once('class/dto/Poll.class.php');
	require_once('class/mysql/PollsMySqlDAO.class.php');
	require_once('class/mysql/ext/PollsMySqlExtDAO.class.php');
	require_once('class/dao/SectionsDAO.class.php');
	require_once('class/dto/Section.class.php');
	require_once('class/mysql/SectionsMySqlDAO.class.php');
	require_once('class/mysql/ext/SectionsMySqlExtDAO.class.php');
	require_once('class/dao/SessionDAO.class.php');
	require_once('class/dto/Session.class.php');
	require_once('class/mysql/SessionMySqlDAO.class.php');
	require_once('class/mysql/ext/SessionMySqlExtDAO.class.php');
	require_once('class/dao/TemplatePositionsDAO.class.php');
	require_once('class/dto/TemplatePosition.class.php');
	require_once('class/mysql/TemplatePositionsMySqlDAO.class.php');
	require_once('class/mysql/ext/TemplatePositionsMySqlExtDAO.class.php');
	require_once('class/dao/TemplatesMenuDAO.class.php');
	require_once('class/dto/TemplatesMenu.class.php');
	require_once('class/mysql/TemplatesMenuMySqlDAO.class.php');
	require_once('class/mysql/ext/TemplatesMenuMySqlExtDAO.class.php');
	require_once('class/dao/UsersDAO.class.php');
	require_once('class/dto/User.class.php');
	require_once('class/mysql/UsersMySqlDAO.class.php');
	require_once('class/mysql/ext/UsersMySqlExtDAO.class.php');
	require_once('class/dao/UsertypesDAO.class.php');
	require_once('class/dto/Usertype.class.php');
	require_once('class/mysql/UsertypesMySqlDAO.class.php');
	require_once('class/mysql/ext/UsertypesMySqlExtDAO.class.php');
	require_once('class/dao/WeblinksDAO.class.php');
	require_once('class/dto/Weblink.class.php');
	require_once('class/mysql/WeblinksMySqlDAO.class.php');
	require_once('class/mysql/ext/WeblinksMySqlExtDAO.class.php');

?>