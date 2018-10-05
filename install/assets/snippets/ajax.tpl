﻿/**
 * ajax
 *
 * Обработка форм
 *
 * @category    snippet
 * @internal    @properties
 * @internal    @installset sample
 */

//<?php
if (!empty($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] == 'POST') {
    if (empty($_POST['formid'])) {
        return '';
    }

    $formid = $_POST['formid'];

    if (is_string($formid) && preg_match('/^[a-z]{2,32}$/', $formid)) {
        $config = MODX_BASE_PATH . 'assets/snippets/FormLister/config/custom/' . $formid . '.inc.php';

        if (!file_exists($config)) {
            return '';
        }

        $params = array_merge([
            'formid'            => $formid,
            'to'                => $modx->getConfig('client_email_recipients'),
            'api'               => 1,
            'apiFormat'         => 'raw',
            'saveObject'        => '_FormLister',
            'parseMailerParams' => 1,
            'prepareProcess'    => [
                function($modx, $data, $fl, $name) {
                    if (isset($data['pid']) && is_numeric($data['pid'])) {
                        $fl->setField('page', $modx->runSnippet('DLCrumbs', [
                            'id'           => $data['pid'],
                            'hideMain'     => 1,
                            'showCurrent'  => 1,
                            'addWhereList' => 'c.id != 1',
                            'tpl'          => '@CODE:[+title+] -&nbsp;',
                            'tplLast'      => '@CODE:[+title+]',
                            'ownerTPL'     => '@CODE:[+crumbs.wrap+]',
                        ]));
                    }
                },
            ],
        ], include $config);

        $data = $modx->runSnippet('FormLister', $params);

        if (empty($data['status'])) {
            $json = [
                'response' => 'fail',
                'fields'   => $data['errors'],
                'messages' => $data['messages'],
            ];
        } else {
            $fl = $modx->getPlaceholder('_FormLister');

            $json = [
                'response' => 'success',
                'messages' => [$fl->getCFGDef('successMessage', 'Заявка отправлена!')],
            ];
        }

        return json_encode($json, JSON_UNESCAPED_UNICODE);
    }
}
