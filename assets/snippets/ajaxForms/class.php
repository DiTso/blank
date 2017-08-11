<?php

	if ( !class_exists( 'AjaxForms' ) ) {
		class AjaxForms {
		
			private $json   = []; 
			private $fields = []; 
			private $form   = 0;
			
			public function run( $data, $modx, $forms ) {
				$this->modx  = $modx;
				$this->data  = $data;
				$this->forms = $forms;
				
				if ( $_SERVER['REQUEST_METHOD'] == 'POST' && $this->validate() ) {
					if ( !$this->modx->mail ) {
						include_once MODX_MANAGER_PATH . 'includes/extenders/modxmailer.class.inc.php';
						$this->modx->mail= new MODxMailer;
					}
					
					$this->modx->mail->IsHTML( true );
					$this->modx->mail->Subject = $this->form['subject'];
					$this->modx->mail->Body    = $this->form['html'];
					
					foreach ( explode( ',', $this->modx->getConfig( 'email_recipients' ) ) as $email ) {
						$this->modx->mail->AddAddress( trim( $email ) );
					}
					
					$allow = true;
					
					if ( isset( $this->form['beforeSend'] ) ) {
						$allow = $this->form['beforeSend']( $this->modx, $this->form, $this->fields, $this->json );
						if ( $allow !== false ) {
							$allow = true;
						}
					}
					
					if ( $allow ) {
						if ( !$this->modx->mail->send() ) {
							$this->json['error'] = 'Не могу отправить! - ' . $this->modx->mail->ErrorInfo;
						}
						
						$sms = $this->modx->getConfig( 'sms_notify' );
						
						if ( !empty( $this->form['sms'] ) && !empty( $sms ) ) {
							$this->sms();
						}
					}
				}
				return json_encode( $this->json );		
			}
			
			private function validator_email( $field ) { 
				return empty( $field ) || !empty( $field ) && preg_match( '/^\s*([a-z0-9_\-]+\.)*[a-z0-9_\-]+@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}\s*$/i', $field ); 
			}
			
			private function validator_phone( $field ) { 
				return empty( $field ) || !empty( $field ) && preg_match( '/^\+?[78]\s?\(\d{3}\)\s?\d{3}-\d\d-\d\d$/', $field ); 
			}
			
			private function validator_required( $field ) { 
				return !empty( $field ); 
			}
			
			protected function validate() {
				if ( isset( $this->data['id'] ) && isset( $this->forms[ $this->data['id'] ] ) ) {
					
					$this->form = $this->forms[ $this->data['id'] ];
					$fields = array();
					
					foreach ( $this->form['fields'] as $field => $rules ) {
						if ( !empty( $rules ) && !is_array( $rules ) && is_numeric( $field ) ) {
							$field = $rules;
							$rules = NULL;
						}
						$add = true;
						if ( !empty( $rules['rules'] ) ) {
							foreach ( $rules['rules'] as $validator => $message ) {
								$error = false;
								$errormsg = '';
								if ( is_object( $message ) && $message instanceof Closure ) {
									if ( ( $errormsg = $message( @$this->data[$field], $field ) ) !== true ) {
										$error = true;
									}
								} else {
									if ( !$this->{'validator_' . $validator}( @$this->data[$field] ) ) {
										$error = true;
										$errormsg = $message;
									}
								}
								if ( $error ) {
									$this->json[$field] = $errormsg;
									$add = false;
									break;
								}
							}
						}
						if ( $add ) {
							if ( isset( $this->data[$field] ) ) {
								$val = $this->data[$field];
								
								if ( !empty( $rules['replacement'][$val] ) ) {
									$val = $rules['replacement'][$val];
								}
								$fields[$field] = $val;
							} else {
								$fields[$field] = '';
							}
						}
					}
					
					$this->fields = $fields;
					
					if ( empty( $this->json ) ) {
						if ( isset( $this->form['beforeTpl'] ) ) {
							$this->form['beforeTpl']( $this->modx, $this->form, $this->fields );
						}
						$this->form['html'] = $this->tpl( $this->form['tpl'], $this->fields );
						$this->json = [ 'response' => 'success', 'msg' => !empty( $this->form['success'] ) ? $this->form['success'] : 'Ваши данные отправлены!<br>Мы свяжемся с Вами в ближайшее время!' ];
						return true;
					}
					
				}
				
				$this->json = [ 'response' => 'fail', 'fields' => $this->json ];
				return false;
			}
			
			private function sms() {
				$fields = [];
				isset( $this->fields['name'] ) && $fields['name'] = substr( $this->fields['name'], 0, 15 );
				isset( $this->fields['phone'] ) && $fields['phone'] = '+' . preg_replace( '/[^\d]+/', '', $this->fields['phone'] );
				
				$sms = $this->tpl( $this->form['sms'], array_merge( $this->fields, $fields ) );
				
				$ch = curl_init( 'http://smsc.ru/sys/send.php' );
				curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 ); 
				curl_setopt( $ch, CURLOPT_TIMEOUT, 30 );
				curl_setopt( $ch, CURLOPT_POSTFIELDS, [
					'login'   => $this->modx->config['sms_login'],
					'psw'     => $this->modx->config['sms_password'],
					'phones'  => $this->modx->config['sms_phone'],
					'sender'  => 'SMSC',
					'charset' => 'utf-8',
					'mes'     => $sms,
				] );
				curl_exec( $ch );
				curl_close( $ch );
			}
			
			private function tpl( $tpl, $data ) {
				foreach ( $data as $field => $value ) {
					$tpl = str_replace( '{' . $field . '}', $value, $tpl );
				}
				return preg_replace( '/\{[^\}]+\}/', '', $tpl );
			}
			
		}
	}
