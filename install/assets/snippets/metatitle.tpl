/**
 * metatitle
 * 
 * render title
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
switch (true) {
	case !empty($modx->documentObject['meta_title'][1]):
		return $modx->documentObject['meta_title'][1];
	
	case !empty($modx->documentObject['longtitle']):
		return $modx->documentObject['longtitle'] . ' - ' . $modx->getConfig('site_name');
	
	default:
		return $modx->documentObject['pagetitle'] . ' - ' . $modx->getConfig('site_name');
}
