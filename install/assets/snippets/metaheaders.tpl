/**
 * metaheaders
 * 
 * render seo and opengraph headers
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$tags = [
    'meta_description' => 'description',
    'meta_keywords'    => 'keywords',
    'og_title'         => 'og:title',
    'og_description'   => 'og:description',
    'og_image'         => 'og:image',
];

$output = '';

foreach ($tags as $tv => $tag) {
    if (!empty($modx->documentObject[$tv][1])) {
        $output .= '<meta name="' . $tag . '" content="' . $modx->documentObject[$tv][1] . '">' . "\n\t";
        continue;
    }
    
    if ($tv == 'og_title') {
        $output .= '<meta name="' . $tag . '" content="' . $modx->runSnippet('metatitle') . '">' . "\n\t";
    }
}

return $output;
