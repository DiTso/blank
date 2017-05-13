//<?php
/**
 * custom Template
 * 
 * Newly created Resources use the template configured in plugin 
 *
 * @category    plugin
 * @version     0.1
 * @author              Dmi3yy (dmi3yy@gmail.com)
 * @internal    @properties &customTemplates=customTemplates;text;100,101|102,103
 * @internal    @events OnDocFormPrerender 
 * @internal    @modx_category Manager and Admin
 * @internal    @installset sample
 */
 
/*
 * custom Template
 *
 * Written By Dmi3yy - 13 Sep 2011
 * Modified by sunhaim - 20 Apr 2017
 *
 * Когда у нас древовидная структура сайта и нужно добавлять не только документы но и ветки документов (классический пример: каталог товаров)
 * то нужно делать лишние движения по выбору шаблона, при наполнении сайта. 
 * 
 * Под катом плагин который позволяет решить данную проблему, 
 * указав нужную наследственность шаблонов.
 * 
 * Выставляем событие для плагина: OnDocFormPrerender
 * В настройках пишем: &customTemplates=customTemplates;text;t100,101|p102,103
 * 
 * и далее заменяем значение по логике: 
 * Номер шаблона Папки или идентификатор Папки, Номер шаблона Документа или идентификатор Папки|Номер шаблона Папки, Номер шаблона Документа или идентификатор Папки|Номер шаблона Папки, Номер шаблона Документа
 *
 */

	global $content;
	$e = &$modx->Event;

	$parts = explode( '|', $customTemplates );

	switch($e->name) {
		case 'OnDocFormPrerender':
			if ( isset( $_REQUEST['pid'] ) && $parent = $modx->getPageInfo( $_REQUEST['pid'], 0, 'id,template' ) ) {
				foreach ( $parts as $pair ) {
					$pair = explode( ',', $pair );
					$key  = 'template';
					
					if ( $pair[0][0] == 'p' ) {
						$key = 'id';
					}
					
					if ( $parent[$key] == ltrim( $pair[0], 'pt' ) ) {
						$content['template'] = $pair[1];
					} 
				}   
			}
			break;
			
		default:
			break;
	}
	