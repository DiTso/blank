/**
 * modal_callback
 * 
 * template of simple callback modal
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
<div class="modal fade" tabindex="-1" role="dialog" id="callback">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="#" data-id="1" class="ajax">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-title">Заказать<br>обратный звонок</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="Ваше имя">
					</div>
					
					<div class="form-group">
						<input type="text" name="phone" class="mask-phone form-control" placeholder="Контактый телефон *">
					</div>
					
					<div class="text-xs-right">
						<button type="submit" class="btn btn-theme">Отправить</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
