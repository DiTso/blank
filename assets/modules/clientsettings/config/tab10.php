<?php

return [
    'caption' => 'Информация о компании',
    'settings' => [
        'company_logo' => [
            'caption' => 'Логотип',
            'type' => 'image',
            'note' => 'Если не указан, будет использован логотип по умолчанию',
        ],
        'company_address' => [
            'caption' => 'Адрес компании',
            'type'  => 'text',
            'default_text' => 'г.Пермь, ул.Уличная, д.37, офис 142'
        ],
        'company_phone' => [
            'caption' => 'Контактный телефон компании',
            'type'  => 'text',
            'default_text' => '8 800 123 4567',
        ],
        'company_email' => [
            'caption' => 'Контактный email компании',
            'type'  => 'text',
            'default_text' => 'mail@' . $_SERVER['HTTP_HOST'],
        ],
        'policy' => [
            'caption' => 'Политика конфиденциальности',
            'type' => 'file',
        ],
    ],
];
