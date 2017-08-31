/**
 * footer
 * 
 * sample footer
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
		
	</div>

	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="copy">
						© [!year!] Все права защищены.
					</div>
					
					[[renderSocials]]
				</div>

				<div class="col-sm-9">
					<div class="row">
						<div class="bottom-menu">
							[[DLMenu? 
								&config=`menu`
							]]
						</div>

						<div class="wi-group phone">
							<i class="icon-phone"></i>
							[[splitRows? &in=`[(company_phone)]` &tpl=`phones`]]
							<a href="#" class="callback" data-toggle="modal" data-target="#callback">Заказать звонок</a>
						</div>

						<div class="wi-group">
							<i class="icon-location"></i>
							[(company_address)]
						</div>

						<div class="wi-group">
							<a href="mailto:[(company_email)]">
								<i class="icon-email"></i>
								[(company_email)]
							</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="policy text-xs-center">
				<a href="[[DocInfo? &field=`policy` &docid=`2`]]"></a>
			</div>
		</div>
	</div>

	<div class="popups">
		{{modal_callback}}
		{{modal_order}}
		<div class="modal fade" tabindex="-1" role="dialog" id="response">
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="modal-body">
						<div class="response"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.4/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js"></script>
	<script type="text/javascript" src="/assets/templates/default/js/jquery.maskedinput.min.js"></script>
	<script type="text/javascript" src="/assets/templates/default/js/common.js"></script>
</body>
</html>
