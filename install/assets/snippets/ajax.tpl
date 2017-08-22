/**
 * ajax
 * 
 * Обработка форм
 * 
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */
 
require MODX_BASE_PATH.'assets/snippets/ajaxForms/class.php';
return (new AjaxForms)->run($_POST, $modx, eval($modx->getChunk('forms')));
