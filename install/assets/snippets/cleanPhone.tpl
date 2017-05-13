/**
 * cleanPhone
 * 
 * Удаление из телефона всего кроме цифр
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
return "+" . preg_replace( '/[^\d]+/', '', $in );
