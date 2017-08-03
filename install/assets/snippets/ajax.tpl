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
			'name',
			'phone' => [ 'rules' => [ 'required' => 'Не указан телефон!', 'phone' => 'Неверный формат номера телефона!' ] ],
			'email' => [ 'rules' => [ 'required' => 'Не указан email!', 'email' => 'Неверный формат адреса!' ] ],
			'file'  => [ 'rules' => [ function( $value, $field ) {
				if ( empty( $_FILES[$field]['name'] ) ) {
					return true;
				}
				
				if ( !preg_match( '/\.(jpeg|jpg|png|pdf|xlsx?|docx?)$/i', $_FILES[$field]['name'] ) ) {
					return 'Неверный формат файла, допустимы jpg, png, pdf, xls, doc';
				}
				
				if ( $_FILES[$field]['size'] > 2097152 ) {
					return 'Размер файла превышает допустимый, должен быть не более 2 Мб';
				}
				
				return true;
			} ] ],
		],
		'subject' => 'Заказ!',
		'tpl' => '<b>Заказ!</b>
			<table>
				<tr><td>Имя:&nbsp;</td><td>{name}</td></tr>
				<tr><td>Телефон:&nbsp;</td><td>{phone}</td></tr>
				<tr><td>Email:&nbsp;</td><td>{email}</td></tr>
			</table>',
		,
		'beforeSend' => function( $modx, $form, $fields, $json ) {
			$uploaddir = MODX_BASE_PATH . '/assets/files/userfiles/';
			$basename = preg_replace( '/[^a-z\d]+/', '-', $_FILES['file']['name'] );
			$basename = sprintf( '%05d', rand( 1, 32767 ) ) . '-' . $basename;
			$basename = preg_replace( '/\-([^\-]+)$/', ".$1", $basename );
			$uploadfile = $uploaddir . $basename;

			if ( move_uploaded_file( $_FILES['file']['tmp_name'], $uploadfile ) ) {
				$modx->mail->AddAttachment( $uploadfile, $_FILES['file']['name'] );
			}
			
			return true;
		}
	],
] );
