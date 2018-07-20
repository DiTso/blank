<?php

if (!defined('IN_PARSER_MODE')) {
    return [];
}

return [
    'rules' => [
        '!name' => [
            'lengthBetween' => [
                'params'  => [2, 100],
                'message' => 'Имя должно быть от 2 до 100 символов',
            ]
        ],
        'phone' => [
            'required' => 'Введите номер телефона',
            'matches' => [
                'params'  => '/^\+?[78]\s?\(\d{3}\)\s?\d{3}-\d\d-\d\d$/',
                'message' => 'Формат телефона неверный',
            ]
        ]
    ],
    'successMessage' => 'Заявка отправлена!',
    'subject' => 'Заявка на обратный звонок!',
    'reportTpl' => '@CODE:
        <b>Заявка на обратный звонок!</b>
        <table>
            <tr><td>Имя:&nbsp;</td><td>[+name.value+]</td></tr>
            <tr><td>Телефон:&nbsp;</td><td>[+phone.value+]</td></tr>
            <tr><td>Страница:&nbsp;</td><td>[+page.value+]</td></tr>
        </table>
    ',
];
