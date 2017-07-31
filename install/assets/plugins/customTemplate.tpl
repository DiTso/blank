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
 * Modified by sunhaim - 31 Jul 2017
 *
 * Когда у нас древовидная структура сайта и нужно добавлять не только документы но и ветки документов (классический пример: каталог товаров)
 * то нужно делать лишние движения по выбору шаблона, при наполнении сайта. 
 * 
 * Под катом плагин который позволяет решить данную проблему, 
 * указав нужную наследственность шаблонов.
 * 
 * Выставляем событие для плагина: OnDocFormPrerender
 * В настройках пишем: &customTemplates=customTemplates;text;t100,101|p102,103|p34,76,77,78
 * 
 * и далее заменяем значение по логике: 
 * Номер шаблона Папки или идентификатор Папки, Номер шаблона Документа или идентификатор Папки|Номер шаблона Папки, Номер шаблона Документа или идентификатор Папки|Номер шаблона Папки, Номер шаблона Документа
 *
 */

	global $content;
	$e = &$modx->Event;

	$parts = explode( '|', $customTemplates );

	switch ( $e->name ) {
		case 'OnDocFormPrerender':
			if ( isset( $_REQUEST['pid'] ) ) {
				$parents = [];
				
				foreach ( $parts as $series ) {
					$serie     = explode( ',', $series );
					$template  = array_pop( $serie );
					$parent_id = $_REQUEST['pid'];
					$match     = true;
				
					do {
						$current = array_pop( $serie );
						$key     = $current[0] == 'p' ? 'id' : 'template';
						
						if ( isset( $parents[ $parent_id ] ) ) {
							$parent = $parents[ $parent_id ];
						} else {
							$parent = $modx->getPageInfo( $parent_id, 0, 'id,template,parent' );
							$parents[ $parent_id ] = $parent;
						}
						
						$parent_id = $parent['parent'];
						
						if ( $parent[$key] != ltrim( $current, 'pt' ) ) {
							$match = false;
							break;
						} 
					} while ( count( $serie ) );
					
					if ( $match ) {
						$content['template'] = $template;	
						break;
					}
				}   
			}
			break;
			
		default:
			break;
	}
