/**
 * share
 *
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
$modx->regClientScript( '//yastatic.net/es5-shims/0.0.2/es5-shims.min.js' );
$modx->regClientScript( '//yastatic.net/share2/share.js' );

return '<div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,gplus,twitter"></div>';
