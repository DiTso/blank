/**
 * splitRows
 *
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$out = '';
foreach ( explode( "\n", $in ) as $i => $row ) {
	if ( isset( $limit ) && $limit <= $i ) {
		break;
	}
	$out .= $modx->parseChunk( $tpl, [ 'row' => trim( $row ) ], '[+', '+]' );
}
return $out;
