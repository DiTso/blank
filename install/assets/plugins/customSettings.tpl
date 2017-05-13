//<?php
/**
 * customSettings
 * 
 * Добавление пользовательских настроек в раздел конфигурации 
 *
 * @category    plugin
 * @version     1.0.2
 * @author      kassim
 * @internal    @events OnSiteSettingsRender 
 * @internal    @modx_category Manager and Admin
 * @internal    @installset sample
 */
 
// 
// Теперь в шаблонах сайта в любом месте для вывода этих данных можно вставить:
// [(company_phone)]
// [(company_address)]
// 
// А в коде ваших сниппетов или модулей можно выводить так:
// $modx->config['company_phone']
// $modx->config['company_address']
// 
// Цифры в названиях полей (то что после ~) использовать нельзя, 
// т.к. в функции mergeSettingsContent() класса DocumentParser 
// (document.parser.class.inc.php) регулярное выражение их не пропустит.

$e = &$modx->Event;
$output = "";

if ( $e->name == 'OnSiteSettingsRender' ) {
	
	$rows = array(
		array(
			'title' => 'Информация о компании',
		),
		'company_address' => array(
			'title' => 'Адрес компании',
			'type'  => 'text', 
			'note'  => 'Например: г.Пермь, ул.Уличная, дом 7, оф. 315',
			'style' => 'width: 350px;',
		),
		'company_phone' => array(
			'title' => 'Контактные телефоны компании',
			'type'  => 'textarea',
			'note'  => 'Можно указать несколько, каждый в новой строке',
			'style' => 'width: 300px; height: 70px;',
		),
		'company_email' => array(
			'title' => 'Контактный email компании',
			'type'  => 'text',
			'style' => 'width: 300px;',
		),
		'head_text' => array(
			'title' => 'Текст в шапке',
			'type'  => 'textarea',
			'style' => 'width: 350px;',
		),
		/*array(
			'title' => 'Социальные сети',
			'subtitle' => 'Если какая-либо ссылка не заполнена - она не будет показываться. Также отображение должно быть предусмотрено в шаблоне.',
		),
		'social_ig' => array(
			'title' => 'Instagram',
			'type'  => 'text',
			'note'  => 'Ссылка полностью на профиль Instagram',
			'style' => 'width: 350px;',
		),
		'social_vk' => array(
			'title' => 'ВКонтакте',
			'type'  => 'text',
			'note'  => 'Ссылка полностью на группу или профиль ВКонтакте',
			'style' => 'width: 350px;',
		),
		'social_fb' => array(
			'title' => 'Facebook',
			'type'  => 'text',
			'note'  => 'Ссылка полностью на профиль Facebook',
			'style' => 'width: 350px;',
		),*/
		array(
			'title' => 'Данные для получения заявок',
		),
		'email_recipients' => array(
			'title' => 'Email для заявок',
			'type'  => 'textarea',
			'note'  => 'На эти адреса будут отправляться заявки. Если несколько, то через запятую',
			'style' => 'width: 400px; height: 50px;',
		),
		'sms_notify' => array(
			'title' => 'Оповещать по sms?',
			'type' => 'checkbox',
			'value' => 'Оповещать',
		),
		'sms_phone' => array(
			'title' => 'Номер телефона для sms',
			'type'  => 'text',
			'note'  => 'СТРОГИЙ ФОРМАТ: 79XXXXXXXXX',
			'style' => 'width: 200px;',
		),
		'sms_login' => array(
			'title' => 'Логин для sms',
			'type'  => 'text',
			'note'  => 'Логин для доступа в интерфейс отправки sms',
			'style' => 'width: 200px;',
		),
		'sms_password' => array(
			'title' => 'Пароль для sms',
			'type'  => 'text',
			'note'  => 'Пароль для доступа в интерфейс отправки sms',
			'style' => 'width: 200px;',
		),
		/*'key' => array(
			'title' => '',
			'type'  => 'text', // text, textarea, select, checkbox, radio
			//'values' => array( 'key' => 'value' ), // for select, radio
			//'value' => 'label', // for checkbox
			'note'  => '',
			'style' => '',
		),*/
	);

	$output .= '
					</td>
				</tr>
			</table>
		</div>

		<div class="tab-page" id="tabPage100">
			<h2 class="tab">Индивидуальные настройки</h2>
			<script type="text/javascript">tpSettings.addTabPage( document.getElementById( "tabPage100" ) );</script>
			<table border="0" cellspacing="0" cellpadding="3">
				
	';
		
	foreach ( $rows as $key => $row ) {
		$value = isset( $modx->config[$key] ) ? htmlspecialchars( trim( $modx->config[$key] ), ENT_QUOTES, 'utf-8' ) : '';
		
		if ( is_numeric( $key ) ) {
			$output .= '<tr><td colspan="2"><h3>' . $row['title'] . '</h3>' . ( isset( $row['subtitle'] ) ? '<div class="comment">' . $row['subtitle'] . '</div>' : '' );
		} else {
			$output .= '<tr><td class="warning" nowrap="">' . $row['title'] . '<!--div class="comment" style="font-weight: normal;">[(' . $key . ')]</div--></td><td>';
		
			switch ( $row['type'] ) {
				case 'text': {
					$output .= '<input type="text" value="' . $value . '" name="' . $key . '" style="' . $row['style'] . '" onchange="documentDirty=true;" />';
					break;
				}
				case 'textarea': {
					$output .= '<textarea name="' . $key . '" style="' . $row['style'] . '" onchange="documentDirty=true;">' . $value . '</textarea>';
					break;
				}
				case 'checkbox': {
					$output .= '<input type="hidden" name="' . $key . '" value="0"><label><input type="checkbox" value="1" name="' . $key . '" onchange="documentDirty=true;" ' . ( $value == 1 ? ' checked="checked"' : '' ) . '/> ' . $row['value'] . '</label>';
					break;
				}
				case 'radio': {
					foreach ( $row['values'] as $val => $label ) {
						$output .= '<div><label><input type="radio" name="' . $key . '" value="' . $val . '"' . ( $val == $value ? ' checked="checked"' : '' ) . ' onchange="documentDirty=true;" /> ' . $label . '</label></div>';
					}
					break;
				}
				case 'select': {
					$output .= '<select name="' . $key . '" class="inputBox" onchange="documentDirty=true;">';
					foreach ( $row['values'] as $val => $label ) {
						$output .= '<option value="' . $val . '"' . ( $val == $value ? ' selected="selected"' : '' ) . '>' . $label . '</option>';
					}
					$output .= '</select>';
					break;
				}
			}
			
			if ( isset( $row['note'] ) ) {
				$output .= '<div class="comment">' . $row['note'] . '</div>';
			}
		}
		
		$output .= '</td></tr><tr><td colspan="2"><div class="split"></div></td></tr>';
	}

	$output .= '<script type="text/javascript">document.addEventListener( "DOMContentLoaded", function() { var p = document.getElementById( "tabPage100" ); p.parentNode.insertBefore( p, document.getElementById( "tabPage2" ) ); var t = p.parentNode.getElementsByClassName( "tab-row" )[0]; t.insertBefore( t.children[1], t.children[0] ); t.children[0].click(); } );</script>';
	$output .= '<tr><td>';
}
$e->output( $output );



