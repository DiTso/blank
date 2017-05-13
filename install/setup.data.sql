REPLACE INTO `{PREFIX}site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Контент', '', '', 'content', '', 1, 0, 0, 0, 1, '', '', 1, 0, 0, 1, 1, 1, 1130304721, 1, 1493893986, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 0, 1, 0),
(2, 'document', 'text/html', 'Главная', 'О компании', '', 'index', '', 1, 0, 0, 1, 0, '', '', 1, 1, 0, 1, 1, 1, 1493894004, 1, 1494512939, 0, 0, 0, 1493894004, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(3, 'document', 'text/html', 'ajax.json', '', '', 'ajax.json', '', 1, 0, 0, 0, 0, '', '[!ajax!]', 0, 0, 1001, 1, 1, 1, 1493894151, 1, 1493894151, 0, 0, 0, 1493894151, 1, '', 0, 0, 0, 0, 0, 0, 1, 1),
(4, 'document', 'text/html', '404', '', '', '404', '', 1, 0, 0, 0, 0, '', '<p>Страница не найдена!</p>', 1, 2, 1002, 1, 1, 1, 1493894251, 1, 1493894251, 0, 0, 0, 1493894251, 1, '', 0, 0, 0, 0, 0, 0, 1, 1);

TRUNCATE TABLE `{PREFIX}site_templates`;

REPLACE INTO `{PREFIX}site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`, `selectable`) VALUES
(1, 'main', '', 0, 0, '', 0, '{{header}}\n<div class=\"container\">\n	<div class=\"user-content\">\r\n		[*content*]\r\n	</div>\r\n	[[share]]\r\n</div>\r\n{{footer}}', 0, 1),
(2, 'info', '', 0, 0, '', 0, '{{header}}\r\n<div class=\"container\">\r\n	<div class=\"user-content\">\r\n		[*content*]\r\n	</div>\r\n	[[share]]\r\n</div>\r\n{{footer}}', 0, 1);


REPLACE INTO `{PREFIX}site_tmplvar_templates` VALUES (1, 1, 0);

REPLACE INTO `{PREFIX}site_tmplvar_templates` VALUES (2, 1, 0);

REPLACE INTO `{PREFIX}site_tmplvar_templates` VALUES (3, 1, 0);

REPLACE INTO `{PREFIX}site_tmplvar_templates` VALUES (1, 2, 0);

REPLACE INTO `{PREFIX}site_tmplvar_templates` VALUES (2, 2, 0);

REPLACE INTO `{PREFIX}site_tmplvar_templates` VALUES (3, 2, 0);


UPDATE `{PREFIX}system_settings` SET setting_value = '2' WHERE setting_name = 'site_start';

UPDATE `{PREFIX}system_settings` SET setting_value = '4' WHERE setting_name = 'error_page';

UPDATE `{PREFIX}system_settings` SET setting_value = '2' WHERE setting_name = 'default_template';

UPDATE `{PREFIX}system_settings` SET setting_value = 'sibling' WHERE setting_name = 'auto_template_logic';

UPDATE `{PREFIX}system_settings` SET setting_value = 'MODxRE2_DropdownMenu' WHERE setting_name = 'manager_theme';
