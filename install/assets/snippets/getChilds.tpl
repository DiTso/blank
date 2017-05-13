<?php
/**
 * getChilds
 * 
 * Выборка дочерних документов по ID родителя верхнего уровня. Вызывать только кэшированным.
 *
 * @category 	snippet
 * @version 	1.0
 * @internal    @installset sample
 * @internal	@modx_category Content
 */
 

if ( isset( $parent ) ) {
		$parent = explode( ',', $parent );
		if ( !is_array( $parent ) )
			$parent = array( $parent );
	} else
		$parent = array( $modx->documentIdentifier );
	!isset( $onlyFolders ) && $onlyFolders = false;
	!isset( $depth ) && $depth = 10;

	$output = '';

	if( !function_exists( 'getChildIds' ) ) {
		function getChildIds( $id, $children = array(), $parents ) {
			global $modx;
			foreach ( $modx->documentMap as $mapEntry ) {
				if ( isset( $mapEntry[$id] ) && in_array( $mapEntry[$id], $parents ) ) {
					$childId = $mapEntry[$id];
					$children[] = $childId;
					$children = $children + getChildIds( $childId, $children, $parents );
				}
			}
			return $children;
		}
	}     

	if ( !function_exists( 'getParentList' ) ) {
		function getParentList() {
			global $modx;
			$kids = array();
			foreach ( $modx->documentMap as $null => $document ) {
				foreach ( $document as $parent => $id ) 
					$kids[$parent][] = $id;
			}
			$parents = array_keys( $kids );
			return $parents;
		}
	}


	$childParents = array();
	if ( $onlyFolders ) {
		$allParents = getParentList();
		foreach ( $parent as $p ) {
			$c = getChildIds( $p, array(), $allParents );
			$childParents += $c;
		}
	} else {
		foreach ( $parent as $p ) {
			$c = $modx->getChildIds( $p, $depth );
			$childParents += $c;
		}
	}
	return implode( ',', $childParents );
