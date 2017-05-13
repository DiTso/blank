/**
 * cleanPhone
 *
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
return "+" . preg_replace( '/[^\d]+/', '', $in );
