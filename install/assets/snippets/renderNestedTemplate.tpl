<?php
/**
 * renderNestedTemplate
 * 
 * Вывод шаблона, заданного в любом из родителей, для любого поля текущего документа
 *
 * @category 	snippet
 * @version 	1.0
 * @internal    @installset sample
 * @internal	@modx_category Content
 */
 
/**
 * Чтобы это работало, нужно для интересующего поля создать шаблон с именем
 * <field>_template_<template_id>
 * и назначить его любому из родителей (или всем).
 * Затем вызвать сниппет так:
 * [[renderNestedTemplate? &field=`<field>`]]
 * Сниппет найдет нужный шаблон и заполнит его данными текущего документа.
 * Если же шаблон не найден, будет просто выведено значение поля.
 */

if (empty($field)) {
	$field = 'content';
}

$template = '[*' . $field . '*]';
$fieldTpl = $field . '_template_' . $modx->documentObject['template'];
$docid    = $modx->documentIdentifier;

do {
	$tv = $modx->getTemplateVar($fieldTpl, '*', $docid);
	
	if (empty($tv['value'])) {
		$found = false;
		$doc   = $modx->getDocument($docid, 'parent');
		$docid = $doc['parent'];
		
		if (empty($docid)) {
			break;
		}
	} else {
		$template = $tv['value'];
		$found = true;
	}
} while (!$found);

$template = $modx->mergeSettingsContent($template);
$template = $modx->mergeDocumentContent($template);

return $template;
