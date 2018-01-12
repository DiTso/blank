/**
 * modal_order
 * 
 * template of simple order modal
 * 
 * @category	chunk
 * @internal    @overwrite true
 * @internal    @installset sample
 */
<div class="modal fade" tabindex="-1" role="dialog" id="order">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method="post" action="#" data-id="2" data-goal="zakaz" class="ajax">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="modal-title">Сделать заказ</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="text" name="name" class="form-control" placeholder="Ваше имя *">
					</div>

					<div class="form-group">
						<input type="text" name="phone" class="mask-phone form-control" placeholder="Контактый телефон *">
					</div>
					
					<div class="form-group">
						<input type="text" name="email" class="form-control" placeholder="Email *">
					</div>
					
					<div class="form-group file-upload">
						<label>
							<input type="file" name="file" onchange="this.nextElementSibling.innerHTML = this.value">
							<span class="filename">Прикрепить файл</span>
						</label>
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
