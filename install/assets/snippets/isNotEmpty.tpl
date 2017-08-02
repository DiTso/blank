/**
 * isNotEmpty
 * 
 * Test if argument is not empty
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
// Usage:
// [[if? &is=`[[isNotEmpty? &arg=`[+argument+]`]]` &then=`true`]]
return !empty( $arg );
