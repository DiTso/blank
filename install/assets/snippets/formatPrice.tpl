/**
 * formatPrice
 * 
 * format price
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$in = str_replace(',', '.', $in);

if (is_numeric($in)) {
    $isFloat = !($in == floor($in));
    return number_format($in, $isFloat ? 2 : 0, ',', ' ') . ' р.';
} else {
    return $in;
}
