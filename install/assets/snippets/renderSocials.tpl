/**
 * renderSocials
 * 
 * snippet for render social links
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$tpl = isset( $tpl ) ? $modx->getChunk( $tpl ) : '<a href="[+url+]" target="_blank" rel="nofollow" title="[+title+]" class="icon-social-[+code+]"></a>';
$outerTpl = isset( $outerTpl ) ? $modx->getChunk( $outerTpl ) : '<div class="socials">[+wrapper+]</div>';

$socials = [
	[ 'code' => 'facebook',      'title' => 'Facebook' ],
	[ 'code' => 'vkontakte',     'title' => 'ВКонтакте' ],
	[ 'code' => 'instagram',     'title' => 'Instagram' ],
	[ 'code' => 'youtube',       'title' => 'Youtube' ],
	[ 'code' => 'odnoklassniki', 'title' => 'Одноклассники' ],
	[ 'code' => 'twitter',       'title' => 'Twitter' ],
];

$out = '';

foreach ( $socials as $social ) {
	$url = $modx->getConfig( 'social_' . $social['code'] ); 
	
	if ( !empty( $url ) ) {
		$out .= $modx->parseText( $tpl, array_merge( $social, [ 'url' => $url ] ) );
	}
}

if ( !empty( $out ) ) {
	$out = $modx->parseText( $outerTpl, [ 'wrapper' => $out ] );
}

return $out;
