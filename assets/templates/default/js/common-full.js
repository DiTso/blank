

		$(document).on( 'submit', 'form.ajax', function( e ) {
			e.preventDefault();
			var $form = $(this),
				pid = $form.attr( 'data-id' ),
				params = {
					id:       pid,
					squery:   escape( window.location.search ),
					sreferer: escape( document.referrer )
				},
				data;

			if ( window.FormData ) {
				data = new FormData( $form.get(0) );
				for ( var key in params ) {
					data.append( key, params[key] );
				}
			} else {
				data = $form.serialize();
				for ( var key in params ) {
					data += '&' + key + '=' + params[key];
				}
			}
			
			( function( $form ) {	
				$.ajax( {
					url: '/ajax.html', 
					type: 'POST',
					data: data,
					dataType: 'json',
					processData: false,
					contentType: window.FormData ? false : 'application/x-www-form-urlencoded; charset=UTF-8',
					beforeSend: function( xhr, settings ) {
						if ( $form.hasClass( 'processing' ) ) {
							return false;
						}
						$form.addClass( 'processing' );
					},
					complete: function( xhr, status ) { 
						var $response = $('.modal#response');

						$form.find('.notice').remove();
						$form.removeClass( 'processing' );
						
						if ( status == 'success' ) {
							var response = xhr.responseJSON;
						
							if ( response.response == 'fail' ) {
								if ( response.msg ) {
									$response.find('.modal-body > .response').html( response.msg );
									$response.modal();
								} else {
									var tn = 0, msg = '';
									for ( var i in response.fields ) {
										if ( $form[0][i].type != 'hidden' ) {
											var $notice = $('<div/>').html( response.fields[i] ).wrap('<div/>').parent().addClass( 'notice' ).hide();
											( function( form, $notice ) {
													$(form[i])
														.addClass( 'error' )
														.on( 'focus click change input', function() {
															$(this).closest('.form-group').find('[name="' + this.name + '"]').removeClass( 'error' );
															$notice.stop().fadeOut( 100, function() { 
																$(this).remove(); 
															} );
														} )
														.closest('.form-group')
														.append( $notice );
														
													if ( $notice.parent().hasClass( 'horz' ) ) {
														$notice.addClass( 'from-top' );
														$notice.css( 'margin-top', -( $notice.outerHeight() + 8 ) );
													} else {
														$notice.find('>div').css( 'position', 'relative' ).css( 'top', -( $notice.outerHeight() * 0.5 ) )
													}
													$notice.css( 'transition-delay', ( tn * 0.001 ) + 's' ).show().addClass( 'animated' );
											} )( $form[0], $notice );
											tn += 100;
										} else {
											msg += '<div>' + response.fields[i] + ' (' + i + ')</div>'
										}
									}
									if ( msg != '' ) {
										$response.find('.modal-body > .response').html( msg );
										$response.modal();
									}
								}
							} else if ( response.response == 'success' ) {
								$form.reachGoal();
								$form.get(0).reset();
								$form.closest('.modal').modal( 'hide' );
								$response.find('.modal-body > .response').html( response.msg );
								$response.modal();
							}
					
						}
					}
				} );
			} )( $form );
		} );

		$('.modal').on( 'hidden.bs.modal', function( e ) {
			if ( this.id != 'response' && $('.modal#response').is(':visible') ) {
				var div = $('<div class="modal-scrollbar-measure"/>').appendTo( document.body ).get(0),
					scrollBar = div.offsetWidth - div.clientWidth;
		
				$(div).remove();
				$(document.body).addClass( 'modal-open' ).css( 'padding-right', scrollBar );
			} else {
				$(document.body).removeClass( 'modal-open' ).css( 'padding-right', 0 );
			}
		} );
		
		$('.modal').on( 'show.bs.modal', function( e ) {
			var $trigger = $(e.relatedTarget),
				$modal = $(this);

			if ( $trigger.length ) {
				var data = $trigger.data();
				for ( var p in data ) {
					if ( data.hasOwnProperty( p ) && /^set[A-Z]+/.test( p ) ) {
						var val = data[p],
							name = p.match( /^set(.*)/ )[1].replace( /^[A-Z]/, function( s ) { return ( s || '' ).toLowerCase(); } );
							
						$modal.find('[name="' + name + '"]').val( val );
						$modal.find('[data-get="' + name + '"]').each( function() {
							if ( this.tagName == 'IMG' ) {
								$(this).prop( 'src', val );
							} else if ( this.tagName == 'INPUT' || this.tagName == 'TEXTAREA' ) {
								$(this).val( val );
							} else {
								this.innerHTML = val;
							}
						} );
					}
				}
			}
		} );