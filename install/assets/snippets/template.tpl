/**
 * template
 *
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$rs = $modx->db->query( "SELECT templatename FROM " . $modx->getFullTableName( 'site_templates' ) . " WHERE id = '" . $modx->documentObject['template'] . "'" );
$template = $modx->fetchRow( $rs );
return $template['templatename'] . '-page';
