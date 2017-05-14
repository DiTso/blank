/**
 * mm_rules
 * 
 * Default ManagerManager rules.
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php
// example of how PHP is allowed - check that a TV named documentTags exists before creating rule

mm_widget_showimagetvs(); // Показываем превью ТВ

mm_createTab( 'SEO', 'SEOTAB' );
mm_moveFieldsToTab( 'meta_title,meta_keywords,meta_description', 'SEOTAB' );
mm_widget_tags('meta_keywords',',');

//mm_moveFieldsToTab( 'pub_date', 'General', '', '32,39' );
mm_default( 'pub_date' );
//mm_requireFields( 'pub_date', '', 32 );

//mm_createTab('Изображения', 'photos', '', '', '', '850');
//mm_moveFieldsToTab('images,photos', 'photos', '', '');

//mm_hideFields('longtitle,description,link_attributes,menutitle,content', '', '6,7');

//mm_hideTemplates('0,5,8,9,11,12', '2,3');

//mm_hideTabs('settings, access', '2');

//mm_widget_evogallery(1, Галерея, '1,2,3', 3);   // подключаем галерею 
//mm_galleryLink($fields, $roles, $templates, $moduleid);
//mm_widget_evogallery($moduleid, $title, $roles, $templates);
