/**
 * modal_callback_wi
 * 
 * template of callback modal with icons
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @modx_category Формы
 * @internal    @installset sample
 */
<div class="modal fade" tabindex="-1" role="dialog" id="callback">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="#" data-id="1" data-goal="form:zakaz" class="ajax">
				<button type="button" class="close icon-cancel" data-dismiss="modal"></button>
				<div class="modal-title">Заказать<br>обратный звонок</div>
				<div class="modal-body">
					<div class="form-group wi">
						<input type="text" name="name" class="form-control" placeholder="Ваше имя">
						<i class="icon-user"></i>
					</div>
					
					<div class="form-group wi">
						<input type="text" name="phone" class="mask-phone form-control" placeholder="Контактый телефон *">
						<i class="icon-phone"></i>
					</div>

					<div class="text-xs-center">
						<input type="hidden" name="page" value="[*pagetitle*]">
						<button type="submit" class="btn btn-theme">Отправить</button>
					</div>

					{{policy_note}}
				</div>
			</form>
		</div>
	</div>
</div>
