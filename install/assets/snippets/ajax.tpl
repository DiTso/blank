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
return ( new AjaxForms )->run( $_POST, $modx, [
	1 => [
		'fields' => [
			'name',
			'phone' => [ 'rules' => [ 'required' => 'Не указан телефон!', 'phone' => 'Неверный формат номера телефона!' ] ],
		],
		'subject' => 'Заявка на обратный звонок!',
		'tpl' => '<b>Заявка на обратный звонок!</b>
			<table>
				<tr><td>Имя:&nbsp;</td><td>{name}</td></tr>
				<tr><td>Телефон:&nbsp;</td><td>{phone}</td></tr>
			</table>',
	],
	2 => [
		'fields' => [
			'msg'   => [ 'rules' => [ 'required' => 'Не заполнено сообщение!' ] ],
			'name',
			'phone' => [ 'rules' => [ 'required' => 'Не указан телефон!', 'phone' => 'Неверный формат номера телефона!' ] ],
		],
		'subject' => 'Вопрос с сайта!',
		'tpl' => '<b>Вопрос с сайта!</b>
			<table>
				<tr><td>Имя:&nbsp;</td><td>{name}</td></tr>
				<tr><td>Телефон:&nbsp;</td><td>{phone}</td></tr>
				<tr><td>Сообщение:&nbsp;</td><td>{msg}</td></tr>
			</table>',
	],
	3 => [
		'fields' => [
			'name'  => [ 'rules' => [ 'required' => 'Не указано имя!' ] ],
			'phone' => [ 'rules' => [ 'required' => 'Не указан телефон!', 'phone' => 'Неверный формат номера телефона!' ] ],
			'project',
		],
		'subject' => 'Заявка на расчет стоимости!',
		'tpl' => '<b>Заявка на расчет стоимости!</b>
			<table>
				<tr><td>Имя:&nbsp;</td><td>{name}</td></tr>
				<tr><td>Телефон:&nbsp;</td><td>{phone}</td></tr>
				<tr><td>Проект:&nbsp;</td><td>{project}</td></tr>
			</table>',
	],
] );
