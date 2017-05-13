/**
 * formatPrice
 * 
 * format price
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
if ( is_numeric( $in ) ) {
	return number_format( $in, 0, '', ' ' ) . ' р.';
} else {
	return $in;
}
