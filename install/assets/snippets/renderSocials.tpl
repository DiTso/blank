/**
 * renderSocials
 * 
 * snippet for render social links
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
//<?php
require_once MODX_BASE_PATH . 'assets/snippets/DocLister/lib/DLTemplate.class.php';
$DLTemplate = DLTemplate::getInstance($modx);

$params = array_merge([
    'tpl'      => '@CODE:<a href="[+url+]" target="_blank" rel="nofollow" title="[+title+]" class="icon-social-[+code+]"></a>',
    'ownerTPL' => '@CODE:<div class="socials">[+wrap+]</div>',
], $params);

$socials = [
    ['code' => 'facebook',      'title' => 'Facebook'],
    ['code' => 'vkontakte',     'title' => 'ВКонтакте'],
    ['code' => 'instagram',     'title' => 'Instagram'],
    ['code' => 'youtube',       'title' => 'Youtube'],
    ['code' => 'odnoklassniki', 'title' => 'Одноклассники'],
    ['code' => 'twitter',       'title' => 'Twitter'],
];

$out = '';

foreach ($socials as $social) {
    $url = $modx->getConfig('client_social_' . $social['code']);

    if (!empty($url)) {
        $out .= $DLTemplate->parseChunk($params['tpl'], array_merge($social, ['url' => $url]));
    }
}

if (!empty($out)) {
    $out = $DLTemplate->parseChunk($params['ownerTPL'], ['wrap' => $out]);
}

return $out;
