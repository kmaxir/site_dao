-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas wygenerowania: 17 Paź 2009, 06:18
-- Wersja serwera: 5.1.35
-- Wersja PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `tomek2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `banner`
--

CREATE TABLE `banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT 'banner',
  `name` varchar(50) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `banner`
--

INSERT INTO `banner` (`bid`, `cid`, `type`, `name`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`) VALUES
(3, 2, '', 'Mambo Needs You!', 0, 31, 0, 'RecruitmentBanner.gif', 'http://source.mambo-foundation.org/content/view/9/28/', '2005-11-18 20:55:34', 1, 0, '0000-00-00 00:00:00', NULL, NULL),
(4, 2, '', 'Support Mambo Foundation', 0, 40, 0, 'SupportMFBanner.gif', 'http://mambo-foundation.org/content/view/11/27/', '2005-11-18 20:58:11', 1, 0, '0000-00-00 00:00:00', NULL, NULL),
(5, 2, '', 'Mambo Foundation (Clean)', 0, 39, 0, 'mamboFoundation_468_60.gif', 'http://mambo-foundation.org/content/view/11/27/', '2005-11-18 20:59:07', 1, 0, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `bannerclient`
--

CREATE TABLE `bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `contact` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Zrzut danych tabeli `bannerclient`
--

INSERT INTO `bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(2, 'Mambo Foundation', 'Mambo Foundation', 'info@mambo-foundation.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `bannerfinish`
--

CREATE TABLE `bannerfinish` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `impressions` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(50) NOT NULL DEFAULT '',
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `bannerfinish`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(10) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_section` (`section`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `name`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(2, 0, 'Mambo', 'Mambo', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Mambo project.', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(3, 0, 'Newsflash', 'Newsflash', '', '2', 'left', '<strong><em>:: Explanatory Note</em></strong> -- <em>This </em><em>Category, </em><em>and its parent </em><em>Section, </em><em>are not linked\r\nto any menu and therefore are directly viewable on the front end of the\r\nwebsite. Rather the Content Items contained inside this Category are only used to feed items into the NewFlash Module. <u>See also</u>, MODULES&gt;SITE MODULES&gt;NEWSFLASH&nbsp;<strong> </strong></em><strong>::</strong>', 1, 0, '0000-00-00 00:00:00', '', 1, 0, 0, ''),
(4, 0, 'Mambo', 'Mambo', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(10, 0, 'Linux', 'Linux', '', 'com_newsfeeds', 'left', '<br />\r\n', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, ''),
(12, 0, 'Contacts', 'Contacts', '', 'com_contact_details', 'left', 'Contact Details for this website', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Open Source', 'Open Source', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(14, 0, 'Web Development', 'Web Development', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(15, 0, 'General Interest', 'General Interest', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(16, 0, 'Getting Started', 'Getting Started', '', '4', 'left', '<span class="contentheading">Getting Started</span>\r\n<p><em><strong>:: </strong><strong>Explanatory Note</strong></em> -- This set of content items is\r\nbeing used to demonstrate one way to order content logically and\r\ndisplay it on the page. You see here an example of a &quot;flat&quot; hierarchy\r\nof content. There is only one level of content items, so we created a\r\nSection named &quot;Getting Started&quot; and then we created within that Section\r\na Category with the same name (&quot;Getting Started&quot;). We loaded the\r\ncontent items into the category and then created a Main Menu item named\r\n&quot;Getting Started&quot;. When we created that Menu Item we chose the &quot;Table -\r\nContent Category&quot; format option, which gives us the table layout\r\ncontaining the content items, below. On the Content Items in this\r\nCategory we have used the Content Items Parameters tab to enable the\r\nItem Rating option. Note the Content Item <em>Getting the Most Out of Your Mambo Site</em> demonstrates how to create multi-page content. <em><strong>::</strong></em></p>\r\n\r\n<p>&nbsp;</p>', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(17, 0, 'Managing Users', 'Managing Users', 'taking_notes.jpg', '3', 'left', '<span class="contentheading">Managing Users</span>\r\n<p><em><strong>:: Explanatory Note</strong></em> -- <em>The Main Menu link &quot;Managing Users&quot; is a child of the parent &quot;FAQs&quot;. Mambo enables you to\r\ncreate sub-menus automatically when you make a new menu\r\nitem. The format selected for this Menu Item is &quot;Table - Content\r\nCategory&quot; which displays a list of the Content Items in a Category in table format.&nbsp; </em><em>Order </em><em>and Filter options are\r\ncontrolled by the Parameters setting for this Menu Item. Throughout\r\nthe Section we use Parameters settings for each Content Item\r\nto display the Back button and to hide the PDF and Print icons.</em> <em><strong>::</strong></em></p>\r\n\r\n<p>&nbsp;</p>', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(18, 0, 'Mambo and Security', 'Mambo and Security', 'key.jpg', '3', 'left', '<span class="contentheading">Mambo and Security</span>\r\n<p><em><strong>:: Explanatory Note</strong></em> -- <em>The Main Menu link &quot;Mambo and\r\nSecurity&quot; is a child of the parent &quot;FAQs&quot;. Mambo enables you to\r\ncreate sub-menus automatically when you make a new menu\r\nitem. The format selected for this Menu Item is &quot;Table - Content\r\nCategory&quot; which displays a list of the Content Items in a Category in table format.&nbsp; Order and Filter options are\r\ncontrolled by the Parameters setting for this Menu Item. Throughout\r\nthe Section we use Parameters settings for each Content Item\r\nto display the Back button and to hide the PDF and Print icons.</em> <em><strong>::</strong></em></p>\r\n\r\n<p>&nbsp;</p>', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(19, 0, 'Managing Content', 'Managing Content', 'articles.jpg', '3', 'left', '<span class="contentheading">Managing Content</span>\r\n<p><em><strong>:: Explanatory Note</strong></em> -- <em>The Main Menu link &quot;Managing Content&quot; is a child of the parent &quot;FAQs&quot;. Mambo enables you to\r\ncreate sub-menus automatically when you make a new menu\r\nitem. The format selected for this Menu Item is &quot;Table - Content\r\nCategory&quot; which displays a list of the Content Items in a Category in table format.&nbsp; </em><em>Order </em><em>and Filter options are\r\ncontrolled by the Parameters setting for this Menu Item. Throughout\r\nthe Section we use Parameters settings for each Content Item\r\nto display the Back button and to hide the PDF and Print icons.</em> <em><strong>::</strong></em></p>\r\n\r\n<p><em><strong /></em></p>\r\n\r\n<p><strong><strong><strong><strong><strong><strong><strong>&nbsp;</strong></strong></strong></strong></strong></strong></strong></p>', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleid` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `comments` text NOT NULL,
  `startdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `comment`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `components`
--

CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `components`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `contact_details`
--

CREATE TABLE `contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `con_position` varchar(50) DEFAULT NULL,
  `address` text,
  `suburb` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `fax` varchar(25) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(100) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(100) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `contact_details`
--

INSERT INTO `contact_details` (`id`, `name`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`) VALUES
(1, 'Name', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'asterisk.png', 'top', 'email@email.com', 1, 1, 0, '0000-00-00 00:00:00', 1, '', 0, 12, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `containers`
--

CREATE TABLE `containers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` smallint(6) NOT NULL DEFAULT '0',
  `childcount` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `windowtitle` varchar(50) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(25) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `containers`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `content`
--

CREATE TABLE `content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `title_alias` varchar(100) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(100) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_mask` (`mask`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Zrzut danych tabeli `content`
--

INSERT INTO `content` (`id`, `title`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`) VALUES
(2, 'Need Help With Mambo?', '', 'New to Mambo? Looking for help or more information? Visit <a title="docs.mambo-foundation.org" target="_blank" href="http://docs.mambo-foundation.org">Mambo''s\r\nofficial online help center</a> or join the\r\ndiscussions at <a title="forum.mambo-foundation.org" target="_blank" href="http://forum.mambo-foundation.org">the Mambo Forums</a><a target="_blank" href="http://forum.mambo-foundation.org" />', '', 1, 2, 0, 3, '2004-08-09 08:30:34', 62, '', '2005-11-19 21:06:57', 62, 0, '0000-00-00 00:00:00', '2004-08-09 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=', 6, 0, 1, '', '', 0, 0),
(3, 'Extending Mambo', '', 'You can extend the functionality of your Mambo site by installing new\r\nmodules, components or mambots. Additional languages can also be\r\nenabled by installing language packs. Download them free of charge from the <a href="http://www.mamboxchange.com" target="_blank" title="MamboXchange">MamboXchange</a>.<br />', '', 1, 2, 0, 3, '2004-08-09 08:30:34', 62, '', '2005-11-19 21:06:32', 62, 0, '0000-00-00 00:00:00', '2004-08-09 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=', 5, 0, 2, '', '', 0, 1),
(4, 'OSI Certified', '', 'Mambo is OSI certified Open Source software. It is free of charge and\r\nis governed by the General Public License (GPL). Learn more about Open\r\nSource and the OSI at <a href="http://www.opensource.org" target="_blank" title="Opensource.org">the Open Source Initiative (OSI) website</a>.', '', 1, 2, 0, 3, '2004-08-09 08:30:34', 62, '', '2005-11-19 21:08:20', 62, 0, '0000-00-00 00:00:00', '2004-08-09 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=', 4, 0, 3, '', '', 0, 2),
(5, 'Mambo License Guidelines', '', '<p><em><strong>:: Explanatory Note</strong></em> -- This page is an example of a\r\nStatic Content Item. The page does not belong to any Section or\r\nCategory. It is found in the Admin system inside the Static Content\r\nManager <em><strong>::</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n{mosimage}<p>&nbsp;</p>\r\n<p>Mambo\r\nis free software released under the GNU General Public License. A copy\r\nof this license is included with your copy of Mambo and can also be\r\nfound at <a href="http://www.fsf.org/licenses/gpl.html" target="_blank">http://www.fsf.org/licenses/gpl.html</a>. Unofficial translations can also be found at <a href="http://www.fsf.org/licenses/translations.html" target="_blank">http://www.fsf.org/licenses/translations.html</a>.</p>\r\n      \r\n<p><br />\r\n&nbsp;</p>\r\n      \r\n<p><strong>1. Who owns the copyright to Mambo?</strong><br />\r\nThe copyright to the Mambo brand and logo is held by Mambo Foundation,\r\na non profit corporation organized under the laws of Australia and run\r\nby the membership. Copyrights in the code are owned by the authors. You\r\nshould be aware that under the GPL who holds the copyright to the code\r\nbears little relation to the use of the code. The terms of the GPL,\r\nrathe than copyright law, spell out how the code may be used,\r\nmodified,&nbsp; and distributed.<br />\r\n</p>\r\n      \r\n<p><strong>2. Are there any restrictions to your use of Mambo?</strong><br />\r\n        The GNU GPL grants you the freedom to use the software for whatever purpose you see fit.</p>\r\n      \r\n<p><strong>3. May I charge money to distribute Mambo?</strong><br />\r\nThe GPL allows everyone the freedom to do this. The right to charge\r\nmoney to distribute Mambo is part of the definition of &quot;free&quot; software.\r\nWhen people think of &quot;selling software&quot;, they usually imagine doing it\r\nthe way most companies do it, making the software ''proprietary'' rather\r\nthan free. So to avoid ambiguity, you may charge to distribute the\r\nsoftware and any other service you provide along the way. You may not\r\ncharge for the software itself. Remember if someone pays your fee, the\r\nGPL also gives him or her the freedom to pass on the software with or\r\nwithout a fee.</p>\r\n      \r\n<p><strong>4. May I remove &quot;powered by Mambo, Copyright Mambo Foundation&rdquo; from the footer?</strong><br />\r\n        Yes you can, although, we would hope that you would retain it to help spread the word about Mambo.</p>\r\n      \r\n<p><strong>5. May I remove the &quot;copyright&quot; statements from the source code to Mambo?</strong><br />\r\n    No, you must keep all copyright notices and credits in the source code.</p>\r\n      \r\n<p><strong>6. Does the GPL mean that my web site content is also GPL?</strong><br />\r\nNo. The copyright and license of Mambo does not cover the content that\r\nyou create. Using Mambo does not place any restrictions, legally, on\r\nthe license or copyright you use for the content of your web site.</p>\r\n      \r\n<p><strong>7. I have modified Mambo for my own web site. Do I have to release these modifications?</strong><br />\r\nThe GPL permits anyone to make a modified version for their own use\r\nwithout the requirement to distribute it or pass on those changes to\r\nothers.</p>\r\n      \r\n<p><strong>8. I have made a modification (hack) to the Mambo core code. Do I have to release it under the GPL?</strong><br />\r\nIf you chose to distribute your modifications to others it must be\r\nreleased under the same terms that you received the original code. So\r\nyour modifications must be released under the GPL. You may of course in\r\nthis case modify the headers for the source code to include your own\r\ncopyright statement after the original copyright statements. If you do\r\nso, you must clearly annotate in the source code your amendments,\r\nchanges or additions.</p>\r\n      \r\n<p><strong>9. I have written a Component, Module, Template for Mambo. Do I have to release it under the GPL?</strong><br />\r\nNo. The GPL allows you to write your own extensions for Mambo and to\r\nrelease those extensions under whatever license you choose.</p>\r\n      \r\n<p><strong>10.\r\nI have written a Component, Module, Template for Mambo and released it\r\nunder the GPL and I charge a fee for it, but web site X is giving it\r\naway for free! Is that right?</strong><br />\r\n Remember if someone pays your\r\nfee, the GPL also gives him or her the freedom to pass on the software\r\nwith or without a fee because the GNU GPL license must go along with\r\nthe distribution of the software.</p>\r\n      \r\n<p><strong>11. May I purchase a copy of Mambo, which has the copyright statements removed?</strong><br />\r\n        No. Some GPL products are distributed that way (often called &ldquo;dual licensing&rdquo;) but Mambo is not.</p>\r\n      \r\n<p><strong>12. I believe someone is in breach of the GPL, what should I do?</strong><br />\r\n    We would ask you to report it, but please first check all the facts before you send an e-mail to us at: <a href="mailto:license-violation@mambo-foundation.org">license-violation@mambo-foundation.org</a>.</p>\r\n      \r\n<p><strong>13. Who has the power to enforce the GNU GPL license of Mambo?</strong><br />\r\nOnly the copyright holder, Mambo Foundation, has the power to do this.\r\nIf the Mambo Development Team finds, or is made aware of, a breach of\r\nthe GPL, they will report it to the Foundation for them to take any\r\nnecessary action.</p>\r\n      \r\n<p><strong>14.\r\nWeb site X is using or offering my non-GPL Component, Module, Template\r\nwithout my permission, or in breach of its license, can you help me?</strong><br />\r\nWhilst this is not within the remit or responsibility of Mambo, we are\r\nwilling to act as intermediaries in this on your behalf. In most cases\r\nthese situations arise out of simple misunderstandings and can be\r\nsettled amicably. You should e-mail full details to <a href="mailto:license-violation@mambo-foundation.org">license-violation@mambo-foundation.org</a>.</p>\r\n      \r\n<p><strong>15. What about translations of Mambo? Who owns those?</strong><br />\r\n    All translation files, as they are derived works of the original Mambo files, are licensed under the GNU/GPL.<br />\r\n            </p>\r\n      \r\n<p><em>DISCLAIMER<br />\r\nThis document refers to the software program Mambo, Version 4.x and all\r\nsubsequent versions, released under the GNU General Public License and\r\ncopyrighted Mambo Foundation.</em></p>\r\n      \r\n<p><em>This document is subject to additions, modifications and other changes at any time without notice.</em></p>\r\n      \r\n<p><em>A\r\nlawyer has not prepared this document. You should consult a lawyer\r\nexperienced in copyright, licensing and intellectual property for\r\nclarification.</em></p>\r\n      \r\n<p>Document Rev. 1.4 - 16 Nov 2005</p>', '', 1, 0, 0, 0, '2004-08-19 20:11:07', 62, '', '2005-11-22 08:19:31', 62, 0, '0000-00-00 00:00:00', '2004-08-19 00:00:00', '0000-00-00 00:00:00', 'opensource-110x95.png|left|OSI Certified|0||bottom||', '', 'menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=', 1, 0, 11, '', '', 0, 21),
(12, 'Get Involved', '', 'Would you like to be involved in the Mambo Open Source project? Join\r\nthe Mambo Foundation or become a member of Team Mambo. Learn more by\r\nvisiting <a href="http://www.mambo-foundation.org" target="_blank" title="Mambo-Foundation.org">Mambo-Foundation.org</a>.<a target="_blank" href="http://www.mambo-foundation.org" />', '', 1, 2, 0, 3, '2005-11-13 16:27:27', 62, '', '2005-11-19 21:09:33', 62, 0, '0000-00-00 00:00:00', '2005-11-13 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=', 4, 0, 4, '', '', 0, 0),
(13, 'Getting the Most Out of Your Mambo Site', 'Getting the Most Out of Your Mambo Site', '<em>An introduction to Components, Modules &amp; Mambots</em><br />\r\n<p>The default installation of Mambo includes a variety of features\r\nwhich are available for your use at the click of a mouse. Without\r\ninstalling any additional software, you can manage banners, set up\r\nsurveys and polls, syndicate your content, and do many other common\r\ntasks. </p>\r\n<p>The tools that make these functions possible are called Components, Modules and Mambots.</p>', '<strong>What is the distinction among Components, Modules &amp; Mambots?</strong>\r\n\r\n\r\n<ul>\r\n<li>You can consider a <strong>Component</strong> as a full application\r\nthat runs inside Mambo. Components extend Mambo and give it extra\r\nfunctionality. The output of a component is displayed inside the main\r\ncontent area.</li><li><strong>Modules</strong> are smaller, generally\r\n&ldquo;helper&rdquo; applications. Some run autonomously, others work in\r\ncooperation with Components. They are generally displayed around the\r\nedges of the main content area, in places defined inside the templates\r\n(called &ldquo;module positions&rdquo;).</li><li><strong>Mambots</strong> are small\r\npieces of code that enable a new feature across the entire site. There\r\nare two types of Mambots: Those that have a visual effect (like\r\n{mosimage}), and those that affect the way Mambo behaves but without\r\nadding any true visual impact (like the search Mambots).</li>\r\n</ul>\r\n\r\n\r\n<p>Just to make things a bit more confusing, sometimes a function will\r\nrequire a combination of these tools. For example, the Banners and the\r\nPolls functions include both a Component and a Module.</p>\r\n\r\n\r\n<p>While the technical distinction between these items is useful\r\ninformation, the most important points concern what they can do, and\r\nhow you can use them. To assist with that, we have provided below a\r\nquick summary of the Components and Modules bundled in your Mambo\r\npackage.{mospagebreak}<br />\r\n</p>\r\n\r\n\r\n<p><strong>A Quick Overview of the Bundled Components</strong></p>\r\n\r\n\r\n<ol>\r\n<li><strong>Banners</strong>: Controls the Banner ads on your site. This\r\ncomponent allows you to manage the banners, while the display is\r\nhandled by the Banners Module.</li><li><strong>Mass Mail</strong>: Allows you to send email to all registered users.</li><li><strong>News Feeds</strong>: A tool for managing News Feeds (RSS) to display on your site.</li><li><strong>Polls</strong>: Allows you to create a Poll (Survey) for the visitors to your site. Works in conjunction with the Polls Module.</li><li><strong>Syndicate</strong>: Use this component to format the RSS syndication of your site&rsquo;s contents.</li>\r\n<li><strong>Web Links</strong>: A component for creating and maintaining\r\na &ldquo;Links&rdquo; page for your site.<br />\r\n </li>\r\n</ol>\r\n{mospagebreak}\r\n\r\n\r\n<p><strong>A Quick Overview of the Bundled Modules </strong></p>\r\n\r\n\r\n<p>Mambo provides for two types of Modules: Site Modules and\r\nAdministrator Modules. The difference between the two has to do with\r\nwhere the modules are displayed. Site Modules are displayed on the\r\nfront end of the site, visible to your visitors. Administrator Modules\r\nare visible only when logged into the Administrator system and are\r\nprimarily intended to make the Admin interface friendlier and more\r\nuseful. We discuss here only the Site Modules. If you wish to learn\r\nmore about the Administrator Modules, please visit our Help Site. </p>\r\n\r\n\r\n<p><strong>Site Modules</strong></p>\r\n\r\n\r\n<ol>\r\n<li><strong>Banners</strong>: The Banners module will display banners from the Banners component.</li><li><strong>Main Menu</strong>: This is the module that controls the menu on your site named &ldquo;Main&rdquo;.</li><li><strong>Latest News</strong>: This module shows a list of the most recently published Items.</li><li><strong>User Menu</strong>: This is the module that controls the menu on your site named &ldquo;User&rdquo;.</li><li><strong>Other Menu</strong>: This is the module that controls the menu on your site named &ldquo;Other&rdquo;.</li><li><strong>Login Form</strong>: This module displays a Username and Password login form.</li><li><strong>Syndicate</strong>: The Syndicate module will display a link whereby people can syndicate your site contents (typically via RSS).</li><li><strong>Statistics</strong>: The Statistics module shows information about your server installation and statistics on the web site.</li><li><strong>Template Chooser</strong>:\r\nThe Template Chooser module allows a visitor to change the site\r\ntemplate on the fly from the front-end via a drop down selection list.</li><li><strong>Archive</strong>: This module shows a list of the calendar months which contain Archived items.</li><li><strong>Sections</strong>: The Section module shows a list of all Sections configured in your database.</li><li><strong>Related Items</strong>: This module displays other Content Items that are related to the Item currently displayed.</li><li><strong>Wrapper</strong>: This module will display an iFrame window in a specified location.</li><li><strong>Polls</strong>: This module compliments the Polls component. It is used to display the Polls.</li><li><strong>Who&rsquo;s Online</strong>: The Who''s Online module displays the number of users that are currently accessing the web site.</li><li><strong>Random Image</strong>: This module displays a random image from a directory.</li><li><strong>Newsflash</strong>: The Newsflash module randomly selects one of the published items from a category upon each page refresh.</li><li><strong>Popular</strong>: This module shows a list of the currently published Items that have been viewed the most.</li><li><strong>Top Menu</strong>: This is the module that controls the menu on your site named &ldquo;Top&rdquo;.</li><li><strong>Search</strong>: This module will display a search box.{mospagebreak}<br />\r\n  </li>\r\n</ol>\r\n\r\n\r\n<p><strong>A Quick Overview of Mambots </strong></p>\r\n\r\n\r\n<p>As Mambots are a bit more technical, we ask that you refer to the\r\nHelp site to learn more about what these are and how you can extend the\r\nfunctionality of your site through the use of Mambots. You can find\r\nmore information here: <a target="_blank" href="http://help.mamboserver.com/index.php?option=com_content&task=view&id=92&Itemid=121">http://help.mamboserver.com/index.php?option=com_content&amp;task=view&amp;id=92&amp;Itemid=121</a> </p>\r\n\r\n<strong>How Do I Install Additional Components, Modules or Mambots? </strong>\r\n<p>Mambo users enjoy access to a wide variety of extensions for their\r\nsites. Many are free, others are commercial. All can be installed\r\neasily by anyone, without the need for programming skills. To learn\r\nmore about how to install these tools on your site, please visit our\r\nHelp site and read the following:<br />\r\n  <a target="_blank" href="http://help.mamboserver.com/index.php?option=com_content&task=view&id=149&Itemid=68%20">http://help.mamboserver.com/index.php?option=com_content&amp;task=view&amp;id=149&amp;Itemid=68 </a><br />\r\n</p>\r\n\r\n\r\n<p><strong>Where Can I Find More Information?</strong></p>\r\n\r\n\r\n<ul>\r\n<li>Team Mambo maintains a useful Help site: <a target="_blank" href="http://docs.mambo-foundation.org">http://docs.mambo-foundation.org</a> </li><li>A wide selection of free Components, Modules and Mambots can be found at the MamboXchange: <a target="_blank" href="http://www.mamboxchange.com">http://www.mamboxchange.com</a> </li><li>Visit our Forums to get answers to questions and to discuss Mambo issues with the community: <a target="_blank" href="http://forum.mambo-foundation.org">http://forum.mambo-foundation.org</a></li>\r\n</ul>\r\n\r\n<p><br />\r\n </p>', 1, 4, 0, 16, '2005-11-19 07:25:47', 62, '', '2005-12-21 22:07:24', 62, 0, '0000-00-00 00:00:00', '2005-11-19 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=1\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=', 11, 0, 2, '', '', 0, 23),
(14, 'Using Templates Effectively', 'Using Templates Effectively', '<p>Your Mambo installation comes bundled with a default template and CSS. The template that displays when you first install the site is optimized for screen displays of 1024 x 768 and higher. In addition, we have included a second version of this template optimized for 800 x 600 displays.</p>\r\n<p>Mambo supports a number of options which allow you to change the display of the content on your site, enabling you to achieve a personalized look and feel without having to modify the template file. </p>', '<p>The default installation with the sample data is designed to demonstrate a variety of different techniques for formatting information and displaying content. It is a virtual sampler of some of the different tools and techniques made possible by the Mambo system. We have included at the top of most pages ::Explanatory Text:: which helps you understand how that particular page, section or category was created.</p>\r\n<p>Since our goal is to show you ways to use the system, we have not optimized the settings for the most attractive appearance. Moreover, not every site will need the same options we have selected to show you in this sampler.</p>\r\n<p>As a means of extending the examples we have given, here are some changes you might want to consider to help make your site more attractive:\r\n</p>\r\n<ul>\r\n<li>The &quot;Top Menu&quot; can be hidden (it''s a bit redundant at present,\r\ngiven the choices included and how close they are to the Main Menu)</li>\r\n<li>The &quot;Latest News&quot;and &quot;Popular&quot; modules can be hidden to give the Home Page a cleaner, simpler look.</li>\r\n<li>Experiment with the Parameters controlling the Front Page Component to change the number of articles, columns or links that appear on the Home Page.</li>\r\n<li>Vary the number and types of modules included in the left and right columns and make the selections relevant to the content of the pages on which they appear.</li>\r\n<li>If you use the 800 x 600 version of the template, you may not want to use the &quot;Table - Content Category&quot; or &quot;Table - Content Section&quot; layout options, as the center column becomes very crowded.\r\n</li>\r\n</ul>\r\n<p>If you wish to change the company logo space (&quot;Water &amp; Stone&quot; -\r\nat the top of the template), it is very simple. The present header is an image. The easiest way to replace it is to overwrite the image file via FTP or by using the Media Manager (that is, upload a new file with the same name). If you do not wish to use an image for the company logo, then you will need to edit the template file directly. Changing the image at the top of the template (the wide picture) can be achieved in the same manner.</p>\r\n\r\n<p>If you wish to change the colors of the template you will have to be able to use an image editing program to create new background images (which are tiled to give many of the effects on this template). Changing fonts and font colors is easier as they are all controlled by the CSS.</p>\r\n<p>Note that the template files and the CSS include numerous comment tags that are intended to help make modifying the files faster and easier. The best way to learn how to create or edit Mambo templates is to open one up and experiment. Make copies of the original before you start and you won''t have any serious problems.</p>\r\n<p>Good Luck and Welcome to Mambo!</p>', 1, 4, 0, 16, '2005-11-19 07:34:35', 62, '', '2005-11-29 21:46:55', 62, 0, '0000-00-00 00:00:00', '2005-11-19 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=1\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=', 6, 0, 3, '', '', 0, 0),
(15, 'Welcome to Mambo!', 'Welcome to Mambo!', '<p>{mosimage}Thank you for choosing Mambo. You have completed successfully the\r\ninstallation of the Mambo files and are now viewing part of the sample\r\ncontent that is included in the default Mambo installation. You can\r\ndelete all of this information and replace it with your own contents\r\nvery easily. However, before you do that, we recommend that you review\r\nthese sample files, as they contain some information you might find to\r\nbe helpful.</p>\r\n\r\n<p>Included in the sample content you will find:</p>\r\n<ul>\r\n<li>An overview of Mambo (this content item)</li>\r\n<li>An introduction to Components &amp; Modules</li>\r\n<li>A summary of the templates that are included in this release, and</li>\r\n<li>Information about Mambo&rsquo;s Licensing Terms (GPL)</li>\r\n</ul>', '<p>It is quite literally true to say that Mambo is an Open Source\r\nsuccess story. The original program was developed by the Australian\r\nsoftware company <a href="http://www.miro.com.au" target="_blank">Miro</a>,\r\nwho released the code to the Open Source community under the terms of\r\nthe GNU GPL in March of 2001. Until August of 2005, the development of\r\nMambo was controlled by a loosely organized community of volunteers.\r\nDuring the course of development, Mambo grew in complexity and ability\r\nand won a number of awards together with a wide following of loyal\r\nusers. Version 4.5.2 of Mambo was downloaded 1.8 million times!</p>\r\n<p>In August 2005, the <a href="http://www.mambo-foundation.org" target="_blank">Mambo Foundation</a>\r\nwas formed, signaling a new era for the system. The Foundation is a\r\nnon-profit corporation whose sole purpose is the growth and development\r\nof Mambo. The Foundation is run by the members of the community.\r\nMembership in the Foundation is open to all and entitles members to\r\nelect their representatives on the Board of Directors and to\r\nparticipate more fully in matters affecting the development of the\r\nproject. </p>\r\n<p>Non-profit structures like the Mambo Foundation have been used successfully by <a href="http://foundation.gnome.org/" target="_blank">GNOME</a>, <a href="http://www.eclipse.org/org/index.html" target="_blank">Eclipse</a>, <a href="http://www.mozilla.org/foundation/" target="_blank">Mozilla</a>\r\nand many other Open Source projects. The non-profit corporate structure\r\nis popular, at least part, because it adds a level of stability and\r\naccountability absent in ad hoc community driven projects. The\r\nexistence of the Mambo Foundation means that users of Mambo can be\r\nassured that the code will remain Open Source, will remain backed by a\r\ntransparent and accountable organization, and will have the ongoing\r\nsupport and promotion that gives developers and business users the\r\nconfidence to choose Mambo over other systems.</p>\r\n<p>If you would like to become involved in the development of Mambo and\r\nbe a part of the dynamic Mambo community, please contact us at <a href="mailto:membership@mambo-foundation.org">membership@mambo-foundation.org</a><br />\r\n</p>', 1, 4, 0, 16, '2005-11-19 07:52:18', 62, '', '2005-11-22 07:01:22', 62, 0, '0000-00-00 00:00:00', '2005-11-19 00:00:00', '0000-00-00 00:00:00', 'asterisk.png|left|Mambo Logo|0||bottom||', '', 'pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=1\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=', 11, 0, 1, '', '', 0, 8),
(16, 'What is Static Content?', 'What is Static Content?', 'Static Content is simply a content item which is not part of a Section\r\nor a Category. Static Content cannot be added to a Blog, a Section or a\r\nCategory. Static Content is, in other words, an independent, stand alone\r\npage. Static Content pages can be created, edited and deleted in the\r\nStatic Content Manager. In the sample content you have installed with\r\nMambo, the Main Menu choice &quot;The Mambo License&quot; shows an example of a\r\nStatic Content page.', '', 1, 3, 0, 19, '2005-11-22 01:45:07', 62, '', '2005-11-22 07:41:22', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 11, 0, 5, '', '', 0, 10),
(17, 'Do I have to keep this sample content?', 'Do I have to keep this sample content?', 'No. This sample content appears because it was selected as an option\r\nduring the installation process. The information contained in the site\r\nis intended to assist new users in learning the system and to help them\r\nget started using Mambo immediately. We have inserted the content using\r\na variety of formats and options to help users get some idea of the\r\nchoices available to them. You may delete any of this content without\r\ncausing any problems to the site installation.<br />', '', 1, 3, 0, 19, '2005-11-22 01:53:08', 62, '', '2005-11-22 07:36:23', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 4, 0, 4, '', '', 0, 1),
(18, 'What''s the difference between a Section and a Category?', 'What''s the difference between a Section and a Category?', 'A Category is a subset of a Section. Content Items belong to\r\nCategories; Categories belong to Sections. The only exception to this\r\nhierarchy is Static Content, which exists outside of the Sections &gt;\r\nCategories structure.<br />', '', 1, 3, 0, 19, '2005-11-22 01:55:35', 62, '', '2005-11-22 07:35:41', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 5, 0, 3, '', '', 0, 6),
(19, 'Why can''t I delete a Section / Category?', 'Why can''t I delete a Section / Category?', 'A Category must be empty of all Content Items before it can be deleted.\r\nA Section must be empty of all Categories before it can be deleted.\r\nRemember, in Mambo, when you delete an item, it moves to the Trash\r\nManager. To delete it permanently, you must go to the Trash Manager and\r\ndelete the items a second time; only then can you delete the related\r\nCategory / Section.<br />', '', 1, 3, 0, 19, '2005-11-22 01:58:30', 62, '', '2005-11-22 07:35:03', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 5, 0, 2, '', '', 0, 6),
(20, 'How do I secure my Mambo site?', 'How do I secure my Mambo site?', 'A simple question with a complex answer! It is complex because security\r\nissues arise from a variety of sources: your code, your server, the\r\nother things running on your server, the users, etc. While Mambo itself\r\nis relatively secure, you may still experience problems if the server\r\nis compromised or if a user gives up a password. The basic steps you\r\nshould take however include:<br />\r\n<ul>\r\n  <li>Do not unnecessarily leave directories open with CHMOD set at 777 (configuration.php in particular should be set to chmod 644)</li>\r\n  <li>Delete your old installation directory (don''t just rename it!).</li>\r\n  <li>Implement HTTP access controls for your admin login.</li>\r\n  <li>Make all your admin passwords at least 8 characters and containing symbols and numbers as well as letters.</li>\r\n</ul>\r\nThere''s more that you can do, but it is outside the scope of this FAQ.<br />', '', 1, 3, 0, 18, '2005-11-22 02:06:51', 62, '', '2005-11-22 07:34:45', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 8, 0, 2, '', '', 0, 7),
(21, 'How do I keep track of security advisories?', 'How do I keep track of security advisories?', 'Visit the Forums regularly and subscribe to the Mambo Security Announcements mailing list.<br />', '', 1, 3, 0, 18, '2005-11-22 02:08:13', 62, '', '2005-11-22 07:34:04', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 5, 0, 1, '', '', 0, 11),
(22, 'Can I show different users different content?', 'Can I show different users different content?', 'Within limits. The Mambo User Manager currently only supports a few\r\nlevels (&quot;groups&quot;) of users. You can show different content to different\r\ngroups, but you cannot show each individual user a unique set of\r\ncontent. Put another way, every user in the group will see the same\r\ncontent as the other users in the group. If you really need this\r\nfunctionality, there are some third party components which add\r\nadditional flexibility.<br />', '', 1, 3, 0, 17, '2005-11-22 02:16:17', 62, '', '2005-11-22 07:42:06', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=0\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 4, 0, 2, '', '', 0, 1),
(23, 'Can users edit content from the front end?', 'Can users edit content from the front end?', 'Yes, if they are registered users who are logged into the system, and\r\nif you have given them permission. There are three user levels which\r\nhave this power:<br />\r\n<ul>\r\n  <li>Author - This group allows a user to post content, usually via a link in the User Menu.</li>\r\n  <li>Editor - This group allows a user to post and edit any content item from the Front-end.</li>\r\n  <li>Publisher - This group allows a user to post, edit and publish any content item from the Front-end.</li>\r\n</ul>', '', 1, 3, 0, 17, '2005-11-22 02:49:48', 62, '', '2005-11-22 07:41:41', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 4, 0, 1, '', '', 0, 3),
(24, 'Can I change the format of the Home Page?', 'Can I change the format of the Home Page?', 'Yes, and it is very easy to do. The formatting of the Home Page -- the\r\nnumber of columns, the number of articles, etc. -- is controlled by the\r\nParameters tab found on the Main Menu Item &quot;Home&quot;. GoTo:\r\nMENU&gt;MAINMENU and select HOME. In the right column you will see the\r\nParameters...<br />', '', 1, 3, 0, 19, '2005-11-22 07:58:52', 62, '', '2005-11-22 08:00:27', 62, 0, '0000-00-00 00:00:00', '2005-11-22 00:00:00', '0000-00-00 00:00:00', '', '', 'pageclass_sfx=\nback_button=1\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=\nkeyref=\ndocbook_type=', 2, 0, 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `content_frontpage`
--

CREATE TABLE `content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `content_frontpage`
--

INSERT INTO `content_frontpage` (`content_id`, `ordering`) VALUES
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(13, 3),
(14, 2),
(15, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `content_rating`
--

CREATE TABLE `content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `content_rating`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `core_acl_aro`
--

CREATE TABLE `core_acl_aro` (
  `aro_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aro_id`),
  UNIQUE KEY `gacl_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `gacl_hidden_aro` (`hidden`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `core_acl_aro`
--

INSERT INTO `core_acl_aro` (`aro_id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `core_acl_aro_groups`
--

CREATE TABLE `core_acl_aro_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `parent_id_aro_groups` (`parent_id`),
  KEY `gacl_parent_id_aro_groups` (`parent_id`),
  KEY `gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Zrzut danych tabeli `core_acl_aro_groups`
--

INSERT INTO `core_acl_aro_groups` (`group_id`, `parent_id`, `name`, `lft`, `rgt`) VALUES
(17, 0, 'ROOT', 1, 22),
(18, 29, 'Registered', 4, 11),
(19, 18, 'Author', 5, 10),
(20, 19, 'Editor', 6, 9),
(21, 20, 'Publisher', 7, 8),
(23, 30, 'Manager', 14, 19),
(24, 23, 'Administrator', 15, 18),
(25, 24, 'Super Administrator', 16, 17),
(28, 17, 'USERS', 2, 21),
(29, 28, 'Public Frontend', 3, 12),
(30, 28, 'Public Backend', 13, 20);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `core_acl_aro_sections`
--

CREATE TABLE `core_acl_aro_sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `value_aro_sections` (`value`),
  UNIQUE KEY `gacl_value_aro_sections` (`value`),
  KEY `hidden_aro_sections` (`hidden`),
  KEY `gacl_hidden_aro_sections` (`hidden`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Zrzut danych tabeli `core_acl_aro_sections`
--

INSERT INTO `core_acl_aro_sections` (`section_id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `core_acl_groups_aro_map`
--

CREATE TABLE `core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `core_acl_groups_aro_map`
--

INSERT INTO `core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(25, '', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `core_log_items`
--

CREATE TABLE `core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `core_log_items`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `core_log_searches`
--

CREATE TABLE `core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `core_log_searches`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `groups`
--

CREATE TABLE `groups` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=246 ;

--
-- Zrzut danych tabeli `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(2, 'administrator'),
(4, 'administrator'),
(6, 'administrator'),
(8, 'administrator'),
(10, 'administrator'),
(12, 'administrator'),
(16, 'administrator'),
(18, 'administrator'),
(20, 'administrator'),
(22, 'administrator'),
(24, 'administrator'),
(26, 'administrator'),
(28, 'administrator'),
(30, 'administrator'),
(32, 'administrator'),
(34, 'administrator'),
(36, 'administrator'),
(38, 'administrator'),
(40, 'administrator'),
(42, 'administrator'),
(44, 'administrator'),
(46, 'administrator'),
(48, 'administrator'),
(54, 'administrator'),
(62, 'administrator'),
(64, 'administrator'),
(66, 'administrator'),
(68, 'administrator'),
(70, 'administrator'),
(72, 'administrator'),
(90, 'administrator'),
(92, 'administrator'),
(94, 'administrator'),
(96, 'administrator'),
(98, 'administrator'),
(100, 'administrator'),
(102, 'administrator'),
(104, 'administrator'),
(106, 'administrator'),
(108, 'administrator'),
(110, 'administrator'),
(112, 'administrator'),
(114, 'administrator'),
(116, 'administrator'),
(118, 'administrator'),
(120, 'administrator'),
(122, 'administrator'),
(124, 'administrator'),
(126, 'administrator'),
(128, 'administrator'),
(130, 'administrator'),
(132, 'administrator'),
(134, 'administrator'),
(136, 'administrator'),
(138, 'administrator'),
(140, 'administrator'),
(142, 'administrator'),
(144, 'administrator'),
(146, 'administrator'),
(148, 'administrator'),
(150, 'administrator'),
(152, 'administrator'),
(154, 'administrator'),
(156, 'administrator'),
(158, 'administrator'),
(160, 'administrator'),
(162, 'administrator'),
(164, 'administrator'),
(166, 'administrator'),
(168, 'administrator'),
(170, 'administrator'),
(172, 'administrator'),
(174, 'administrator'),
(176, 'administrator'),
(178, 'administrator'),
(180, 'administrator'),
(182, 'administrator'),
(184, 'administrator'),
(186, 'administrator'),
(188, 'administrator'),
(190, 'administrator'),
(192, 'administrator'),
(194, 'administrator'),
(196, 'administrator'),
(198, 'administrator'),
(200, 'administrator'),
(202, 'administrator'),
(204, 'administrator'),
(206, 'administrator'),
(208, 'administrator'),
(210, 'administrator'),
(212, 'administrator'),
(214, 'administrator'),
(216, 'administrator'),
(218, 'administrator'),
(220, 'administrator'),
(222, 'administrator'),
(224, 'administrator'),
(226, 'administrator'),
(228, 'administrator'),
(230, 'administrator'),
(232, 'administrator'),
(234, 'administrator'),
(236, 'administrator'),
(238, 'administrator'),
(240, 'administrator'),
(242, 'administrator'),
(244, 'administrator');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `mambots`
--

CREATE TABLE `mambots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Zrzut danych tabeli `mambots`
--

INSERT INTO `mambots` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'MOS Image', 'mosimage', 'content', 0, -10000, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'MOS Pagination', 'mospaging', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(3, 'Legacy Mambot Includer', 'legacybots', 'content', 0, 1, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'SEF', 'mossef', 'content', 0, 3, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'MOS Rating', 'mosvote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(6, 'Search Content', 'content.searchbot', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(7, 'Search Web Links', 'weblinks.searchbot', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(8, 'Code support', 'moscode', 'content', 0, 2, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(9, 'No WYSIWYG Editor', 'none', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(11, 'MOS Image Editor Button', 'mosimage.btn', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(12, 'MOS Pagebreak Editor Button', 'mospage.btn', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(13, 'Search Contacts', 'contacts.searchbot', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Search Categories', 'categories.searchbot', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(15, 'Search Sections', 'sections.searchbot', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Email Cloaking', 'mosemailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(17, 'GeSHi', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(18, 'Search Newsfeeds', 'newsfeeds.searchbot', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Load Module Positions', 'mosloadposition', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(20, 'MOStlyCE', 'mostlyce', 'editors', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'User Authenticator', 'mosvaliduserbot', 'authenticator', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'MOS Comment', 'moscomment', 'content', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(25) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Zrzut danych tabeli `menu`
--

INSERT INTO `menu` (`id`, `menutype`, `name`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`) VALUES
(1, 'mainmenu', 'Home', 'index.php?option=com_frontpage', 'components', 1, 0, 10, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\npageclass_sfx=\nheader=\npage_title=0\nback_button=\nleading=1\nintro=2\ncolumns=2\nlink=3\norderby_pri=\norderby_sec=front\npagination=2\npagination_results=0\nimage=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nitem_title=1\nlink_titles=\nreadmore=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=0\nprint=0\nemail=0'),
(2, 'mainmenu', 'Advanced Search', 'index.php?option=com_search', 'components', 1, 0, 16, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, ''),
(3, 'mainmenu', 'Contact Us', 'index.php?option=com_contact', 'components', 1, 0, 7, 0, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, ''),
(5, 'mainmenu', 'Advanced Search', 'index.php?option=com_search', 'components', 1, 0, 16, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=\npageclass_sfx=\nback_button=\npage_title=1\nheader='),
(7, 'mainmenu', 'News Feeds', 'index.php?option=com_newsfeeds', 'components', 1, 0, 12, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\npageclass_sfx=\nback_button=1\npage_title=1\nheader=\nother_cat_section=1\nother_cat=0\ncat_description=1\ncat_items=1\ndescription=1\ndescription_text=:: Explanatory Note -- This is a collection of RSS News Feeds, drawn into this site through use of the Newsfeed Component. ::\nimage=-1\nimage_align=right\nheadings=1\nname=1\narticles=1\nlink=0\nfeed_image=1\nfeed_descr=1\nitem_descr=1\nword_count=0'),
(8, 'mainmenu', 'Wrapper', 'index.php?option=com_wrapper', 'wrapper', 1, 0, 0, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\npageclass_sfx=\nback_button=\npage_title=1\nheader=This uses a wrapper to include an HTML page from another domain.\nscrolling=auto\nwidth=100%\nheight=600\nheight_auto=1\nadd=1\nurl=www.dmoz.org'),
(9, 'mainmenu', 'Blog', 'index.php?option=com_content&task=blogsection&id=0', 'content_blog_section', 1, 0, 0, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1\npageclass_sfx=\nback_button=\nheader=Blog - Content Section Layout\npage_title=1\nleading=0\nintro=5\ncolumns=1\nlink=5\norderby_pri=\norderby_sec=\npagination=2\npagination_results=1\nimage=0\ndescription=0\ndescription_image=0\ncategory=0\ncategory_link=0\nitem_title=1\nlink_titles=\nreadmore=1\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=0\nprint=0\nemail=0\nsectionid='),
(10, 'othermenu', 'The Source', 'http://source.mambo-foundation.org', 'url', 1, 0, 0, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, ''),
(11, 'othermenu', 'Administrator', 'administrator/', 'url', 1, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'menu_image=-1'),
(12, 'othermenu', 'MamboXchange', 'http://mamboxchange.com', 'url', 1, 0, 0, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, ''),
(13, 'usermenu', 'Submit FAQ', 'index.php?option=com_content&task=new&sectionid=3', 'url', 1, 0, 0, 0, 2, 0, '2000-00-00 00:00:00', 0, 0, 1, 2, ''),
(14, 'usermenu', 'Submit Web Link', 'index.php?option=com_weblinks&task=new', 'url', 1, 0, 0, 0, 4, 0, '2000-00-00 00:00:00', 0, 0, 1, 2, ''),
(15, 'usermenu', 'Check-In My Items', 'index.php?option=com_user&task=CheckIn', 'url', 1, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 1, 2, ''),
(16, 'usermenu', 'Logout', 'index.php?option=com_login', 'components', 1, 0, 15, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, ''),
(21, 'usermenu', 'Your Details', 'index.php?option=com_user&task=UserDetails', 'url', 1, 0, 0, 0, 1, 0, '2000-00-00 00:00:00', 0, 0, 1, 3, ''),
(23, 'mainmenu', 'Links', 'index.php?option=com_weblinks', 'components', 1, 0, 4, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=web_links.jpg\npageclass_sfx=\nback_button=\npage_title=1\nheader=\nheadings=1\nhits=\nitem_description=1\nother_cat=1\ndescription=1\ndescription_text=\nimage=-1\nimage_align=right\nweblink_icons='),
(26, 'mainmenu', 'The Mambo License', 'index.php?option=com_content&task=view&id=5', 'content_typed', 1, 0, 5, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1'),
(27, 'mainmenu', 'Getting Started', 'index.php?option=com_content&task=category&sectionid=4&id=16', 'content_category', 1, 0, 16, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npage_title=0\npageclass_sfx=\nback_button=\norderby=\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=0\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nother_cat=1\nempty_cat=0\ncat_items=1\ncat_description=1'),
(28, 'topmenu', 'Home', 'index.php?option=com_frontpage', 'components', 1, 0, 10, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npageclass_sfx=\nheader=\npage_title=1\nback_button=\nleading=1\nintro=2\ncolumns=2\nlink=3\norderby_pri=\norderby_sec=front\npagination=2\npagination_results=1\nimage=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nitem_title=1\nlink_titles=\nreadmore=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=0\nprint=0\nemail=0'),
(29, 'topmenu', 'Links', 'index.php?option=com_weblinks', 'components', 1, 0, 4, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npageclass_sfx=\nback_button=\npage_title=1\nheader=\nheadings=1\nhits=\nitem_description=1\nother_cat_section=1\nother_cat=1\ndescription=1\ndescription_text=\nimage=-1\nimage_align=right\nweblink_icons='),
(30, 'topmenu', 'Contact Us', 'index.php?option=com_contact&task=view&contact_id=1', 'contact_item_link', 1, 0, 1, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npageclass_sfx=\npage_title=1\nheader='),
(32, 'mainmenu', 'FAQs', 'index.php?option=com_content&task=section&id=3', 'content_section', 1, 0, 3, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npage_title=0\npageclass_sfx=\nback_button=\norderby=\nother_cat_section=1\ndescription=1\ndescription_image=0\nother_cat=0\nempty_cat=0\ncat_items=1\ncat_description=0\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=0\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title'),
(33, 'mainmenu', 'Mambo and Security', 'index.php?option=com_content&task=category&sectionid=3&id=18', 'content_category', 1, 32, 18, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npage_title=0\npageclass_sfx=\nback_button=\norderby=\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=0\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nother_cat=0\nempty_cat=0\ncat_items=1\ncat_description=0'),
(34, 'mainmenu', 'Managing Content', 'index.php?option=com_content&task=category&sectionid=3&id=19', 'content_category', 1, 32, 19, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npage_title=0\npageclass_sfx=\nback_button=\norderby=\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=0\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nother_cat=0\nempty_cat=0\ncat_items=1\ncat_description=0'),
(35, 'mainmenu', 'Managing Users', 'index.php?option=com_content&task=category&sectionid=3&id=17', 'content_category', 1, 32, 17, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\npage_title=0\npageclass_sfx=\nback_button=\norderby=\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=0\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nother_cat=0\nempty_cat=0\ncat_items=1\ncat_description=0'),
(36, 'othermenu', 'Mambo Foundation', 'http://mambo-foundation.org', 'url', 1, 0, 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, ''),
(37, 'othermenu', 'Mambo Forums', 'http://forum.mambo-foundation.org', 'url', 1, 0, 0, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, ''),
(38, 'othermenu', 'Mambo Docs Site', 'http://docs.mambo-foundation.org', 'url', 1, 0, 0, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `messages`
--

CREATE TABLE `messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(230) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `messages`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `messages_cfg`
--

CREATE TABLE `messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `messages_cfg`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(10) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Zrzut danych tabeli `modules`
--

INSERT INTO `modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`) VALUES
(1, 'Polls', '', 1, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_poll', 0, 0, 1, '', 0, 0),
(2, 'User Menu', '', 2, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu', 1, 0),
(3, 'Main Menu', 'Sample content', 1, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'class_sfx=\nmoduleclass_sfx=\nmenutype=mainmenu\nmenu_style=vert_indent\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=', 1, 0),
(4, 'Login Form', '', 4, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 0),
(5, 'Syndicate', '', 5, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_rssfeed', 0, 0, 1, 'text=\ncache=0\nmoduleclass_sfx=\nrss091=1\nrss10=1\nrss20=1\natom=1\nopml=1\nrss091_image=\nrss10_image=\nrss20_image=\natom_image=\nopml_image=', 1, 0),
(6, 'Latest News', '', 1, 'user2', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'moduleclass_sfx=\ncache=0\ntype=1\nshow_front=1\ncount=5\ncatid=\nsecid=', 1, 0),
(7, 'Statistics', '', 6, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_stats', 0, 0, 1, 'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=', 0, 0),
(8, 'Who''s Online', '', 1, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_whosonline', 0, 0, 1, 'online=1\nusers=1\nmoduleclass_sfx=', 0, 0),
(9, 'Popular', '', 1, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_mostread', 0, 0, 1, 'moduleclass_sfx=\ncache=0\ntype=1\nshow_front=1\ncount=5\ncatid=\nsecid=\nhits=1', 0, 0),
(10, 'Template Chooser', '', 7, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_templatechooser', 0, 0, 1, 'show_preview=1', 0, 0),
(11, 'Archive', '', 8, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_archive', 0, 0, 1, '', 1, 0),
(12, 'Sections', '', 9, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_sections', 0, 0, 1, '', 1, 0),
(13, 'Newsflash', '', 1, 'newsflash', 0, '0000-00-00 00:00:00', 1, 'mod_newsflash', 0, 0, 0, 'catid=3\nstyle=random\nimage=0\nlink_titles=\nreadmore=0\nitem_title=0\nitems=\ncache=0\nmoduleclass_sfx=', 0, 0),
(14, 'Related Items', '', 10, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_related_items', 0, 0, 1, '', 0, 0),
(15, 'Search', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\ncache=0\nwidth=20\ntext=\nbutton=\nbutton_pos=right\nbutton_text=', 0, 0),
(16, 'Random Image', '', 9, 'right', 0, '0000-00-00 00:00:00', 0, 'mod_random_image', 0, 0, 1, '', 0, 0),
(17, 'Top Menu', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'class_sfx=-nav\nmoduleclass_sfx=\nmenutype=topmenu\nmenu_style=list_flat\ncache=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=', 1, 0),
(18, 'Banners', '', 1, 'banner', 0, '0000-00-00 00:00:00', 1, 'mod_banners', 0, 0, 0, 'banner_cids=\nmoduleclass_sfx=\n', 1, 0),
(19, 'Components', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_components', 0, 99, 1, '', 1, 1),
(20, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 99, 1, '', 0, 1),
(21, 'Latest Items', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 99, 1, '', 0, 1),
(22, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 99, 1, '', 0, 1),
(23, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 99, 1, '', 1, 1),
(24, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 99, 1, '', 1, 1),
(25, 'Full Menu', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_fullmenu', 0, 99, 1, '', 1, 1),
(26, 'Pathway', '', 1, 'pathway', 0, '0000-00-00 00:00:00', 1, 'mod_pathway', 0, 99, 1, '', 1, 1),
(27, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 99, 1, '', 1, 1),
(28, 'System Message', '', 1, 'inset', 0, '0000-00-00 00:00:00', 1, 'mod_mosmsg', 0, 99, 1, '', 1, 1),
(29, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 99, 1, '', 1, 1),
(31, 'Other Menu', '', 3, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=othermenu\nmenu_style=vert_indent\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nclass_sfx=\nmoduleclass_sfx=\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=', 0, 0),
(32, 'Wrapper', '', 11, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_wrapper', 0, 0, 1, '', 0, 0),
(33, 'Logged', '', 0, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 99, 1, '', 0, 1),
(34, 'Latest Content', '', 12, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_latestcontent', 0, 0, 1, '', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `modules_menu`
--

CREATE TABLE `modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `modules_menu`
--

INSERT INTO `modules_menu` (`moduleid`, `menuid`) VALUES
(1, 1),
(2, 0),
(3, 0),
(4, 1),
(5, 1),
(6, 1),
(6, 27),
(8, 1),
(9, 1),
(9, 27),
(10, 1),
(13, 0),
(15, 0),
(17, 0),
(18, 0),
(31, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `newsfeeds`
--

CREATE TABLE `newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Zrzut danych tabeli `newsfeeds`
--

INSERT INTO `newsfeeds` (`catid`, `id`, `name`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`) VALUES
(10, 3, 'Linux Today', 'http://linuxtoday.com/backend/my-netscape.rdf', '', 1, 3, 3600, 0, '0000-00-00 00:00:00', 14),
(10, 10, 'DistroWatch', 'http://distrowatch.com/news/dw.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 13),
(4, 11, 'The Source', 'http://source.mambo-foundation.org/index2.php?option=com_rss&feed=ATOM0.3&no_html=1', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 12),
(13, 12, 'Newsforge', 'http://www.newsforge.com/index.rss', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 11),
(13, 13, 'OSDir', 'http://osdir.com/rss.php', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 10),
(13, 14, 'Lawrence Lessig''s Blog', 'http://www.lessig.org/blog/index.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 9),
(14, 15, 'The Daily Report', 'http://www.zeldman.com/feed/zeldman.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 8),
(14, 16, 'A List Apart', 'http://www.alistapart.com/rss.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 7),
(14, 17, 'Evolt.org', 'http://evolt.org/rss/articles.rss', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 6),
(15, 18, 'Slashdot', 'http://slashdot.org/index.rss', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 5),
(15, 19, 'The Register', 'http://www.theregister.com/excerpts.rss', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 4),
(15, 20, 'Wired', 'http://www.wired.com/news/feeds/rss2/0,2610,,00.xml', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 3),
(15, 21, 'BoingBoing', 'http://feeds.feedburner.com/boingboing/iBag', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 2),
(4, 22, 'MamboXchange', 'http://mamboxchange.com/export/rss_sfnews.php', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `parameters`
--

CREATE TABLE `parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param_name` varchar(50) NOT NULL DEFAULT '',
  `param_file` varchar(50) NOT NULL DEFAULT '',
  `param_version` varchar(50) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `names` (`param_name`,`param_version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Zrzut danych tabeli `parameters`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `players_to_teams`
--

CREATE TABLE `players_to_teams` (
  `team_id` int(11) unsigned NOT NULL,
  `player_id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`team_id`,`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `players_to_teams`
--

INSERT INTO `players_to_teams` (`team_id`, `player_id`, `name`) VALUES
(2, 3, ''),
(3, 2, ''),
(8, 2, 'new name'),
(13, 12, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `polls`
--

CREATE TABLE `polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Zrzut danych tabeli `polls`
--

INSERT INTO `polls` (`id`, `title`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(15, 'The most influential person in technology in the last 25 years is...', 1, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `poll_data`
--

CREATE TABLE `poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(4) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Zrzut danych tabeli `poll_data`
--

INSERT INTO `poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(13, 15, 'Steve Jobs', 0),
(14, 15, 'Bill Gates', 0),
(15, 15, 'Linus Torvalds', 0),
(16, 15, 'Tim Berners-Lee', 0),
(17, 15, 'Scott Adams', 1),
(18, 15, '', 0),
(19, 15, '', 0),
(20, 15, '', 0),
(21, 15, '', 0),
(22, 15, '', 0),
(23, 15, '', 0),
(24, 15, '', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `poll_date`
--

CREATE TABLE `poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Zrzut danych tabeli `poll_date`
--

INSERT INTO `poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2005-11-19 09:30:51', 17, 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `poll_menu`
--

CREATE TABLE `poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `poll_menu`
--

INSERT INTO `poll_menu` (`pollid`, `menuid`) VALUES
(15, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(10) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Zrzut danych tabeli `sections`
--

INSERT INTO `sections` (`id`, `title`, `name`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(2, 'Newsflashes', 'Newsflashes', '', 'content', 'left', ':: Explanatory Note -- <em>This Section and its Category are not linked\r\nto any menu and therefore are directly viewable on the front end of the\r\nwebsite. Rather the Content Items contained inside this Section &amp;\r\nits Category are only used to feed items into the NewFlash Module. <u>See also</u>, MODULES&gt;SITE MODULES&gt;NEWSFLASH&nbsp; </em>::<br />\r\n', 1, 0, '0000-00-00 00:00:00', 2, 0, 3, ''),
(3, 'FAQs', 'Frequently Asked Questions', 'pastarchives.jpg', 'content', 'left', '<span class="contentheading">Frequently Asked Questions (FAQs)</span>\r\n<p>::Explanatory Notes - <em>The Main Menu link &quot;FAQs&quot; is set to display\r\n&quot;Table - Content Section&quot;. The list below is a list of the Categories\r\ninside the Section named &quot;FAQs&quot;. Inside each Category are Content Items.</em> ::</p>', 1, 0, '0000-00-00 00:00:00', 3, 0, 52, ''),
(4, 'Getting Started', 'Getting Started', '', 'content', 'left', '<br />\r\n', 1, 0, '0000-00-00 00:00:00', 1, 0, 12, '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `session`
--

CREATE TABLE `session` (
  `username` varchar(50) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `session`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `stats_agents`
--

CREATE TABLE `stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `stats_agents`
--


-- --------------------------------------------------------

--
-- Struktura tabeli dla  `templates_menu`
--

CREATE TABLE `templates_menu` (
  `template` varchar(50) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `templates_menu`
--

INSERT INTO `templates_menu` (`template`, `menuid`, `client_id`) VALUES
('mambo_admin_blue', 0, 1),
('waterandstone', 0, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `template_positions`
--

CREATE TABLE `template_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Zrzut danych tabeli `template_positions`
--

INSERT INTO `template_positions` (`id`, `position`, `description`) VALUES
(1, 'left', ''),
(2, 'right', ''),
(3, 'top', ''),
(4, 'bottom', ''),
(5, 'inset', ''),
(6, 'banner', ''),
(7, 'header', ''),
(8, 'footer', ''),
(9, 'newsflash', ''),
(10, 'legals', ''),
(11, 'pathway', ''),
(12, 'toolbar', ''),
(13, 'cpanel', ''),
(14, 'user1', ''),
(15, 'user2', ''),
(16, 'user3', ''),
(17, 'user4', ''),
(18, 'user5', ''),
(19, 'user6', ''),
(20, 'user7', ''),
(21, 'user8', ''),
(22, 'user9', ''),
(23, 'advert1', ''),
(24, 'advert2', ''),
(25, 'advert3', ''),
(26, 'icon', ''),
(27, 'debug', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(25) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'admin@admin.com', 'c2f6acf77b14c345a847ba3fa7a1d2c5', 'Super Administrator', 0, 1, 25, '2009-10-17 01:28:19', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `usertypes`
--

CREATE TABLE `usertypes` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `mask` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `usertypes`
--

INSERT INTO `usertypes` (`id`, `name`, `mask`) VALUES
(0, 'superadministrator', ''),
(1, 'administrator', ''),
(2, 'editor', ''),
(3, 'user', ''),
(4, 'author', ''),
(5, 'publisher', ''),
(6, 'manager', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla  `weblinks`
--

CREATE TABLE `weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `weblinks`
--

INSERT INTO `weblinks` (`id`, `catid`, `sid`, `title`, `url`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `params`) VALUES
(1, 2, 0, 'The Source', 'http://source.mambo-foundation.org/', 'The official home of the Mambo Core and a resource site for members of the Mambo Foundation and users of the Mambo CMS.', '2006-02-27 14:08:45', 2, 1, 0, '0000-00-00 00:00:00', 3, 0, 1, 'target=1'),
(2, 2, 0, 'MamboXchange', 'http://mamboxchange.com', 'Get your Mambo add-ons here!', '2004-07-07 10:18:31', 0, 1, 0, '0000-00-00 00:00:00', 2, 0, 1, ''),
(3, 2, 0, 'Mambo Documentation', 'http://docs.mambo-foundation.org', 'The official Mambo documentation site', '2006-09-12 16:19:21', 0, 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(4, 2, 0, 'Mambo Foundation Forums', 'http://forum.mambo-foundation.org', 'The official Mambo Foundation Forums', '2006-09-12 16:17:22', 0, 1, 0, '0000-00-00 00:00:00', 4, 0, 1, ''),
(5, 2, 0, 'Mambo Foundation', 'http://www.mambo-foundation.org', 'Home of the Mambo Foundation.', '2005-11-19 06:33:35', 0, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 'target=1');
