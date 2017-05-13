/**
 * formatDate
 *
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$names = [ 1 => 'января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря' ];
$date = ( new DateTime() )->setTimestamp( $in );
$m = $date->format( 'n' );
	
return $date->format( 'd' ) . ' ' . $names[$m] . ' ' . $date->format( 'Y' );
