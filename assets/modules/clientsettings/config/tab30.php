<?php

return [
    'caption'    => 'Оповещения о заявках',
    'settings' => [
        'email_recipients' => [
            'caption' => 'Email для заявок',
            'type'  => 'text',
            'note'  => 'На эти адреса будут отправляться заявки. Если несколько, то через запятую',
            'default_text' => 'mnoskov@trylike.ru',
        ],
        'sms_notify' => [
            'caption' => 'Оповещать по sms?',
            'type' => 'checkbox',
            'elements' => 'Оповещать==1',
        ],
        'sms_phone' => [
            'caption' => 'Номер телефона для sms',
            'type'  => 'text',
            'note'  => 'СТРОГИЙ ФОРМАТ: 79XXXXXXXXX',
        ],
        'sms_login' => [
            'caption' => 'Логин для sms',
            'type'  => 'text',
            'note'  => 'Логин для доступа в интерфейс отправки sms',
        ],
        'sms_password' => [
            'caption' => 'Пароль для sms',
            'type'  => 'text',
            'note'  => 'Пароль для доступа в интерфейс отправки sms',
        ],
    ],
];
