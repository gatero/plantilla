###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 2.1

	- Parametros de configuracion

		type: ajax, success, primary, warning, danger, info, muted
		
		color: si es ajax puede ser, success, primary, warning, danger, info, muted

		title: String

		content: String(solo si type no es ajax)
		
		size: String(opcional sus valores pueden ser modal-lg o modal-sm)

		icon: este icono se mostrara en el titulo y en el boton aceptar

		URL: Si es ajax, se mostrara en  el body de la modal el resultado,
		si es otro tipo, esta url se asigna al boton aceptar.
		
		controls: off( para evitar que se agregue el footer)
###
class AjaxModal
	modal:(option)->
			"""
				<div class='modal fade' id='AjaxModal'>
					<div class='modal-dialog #{option.size}'>
						<div class='modal-content'>
							<div class='modal-header bg-#{option.color}'>
								<button type='button' class='close' data-dismiss='modal'>
									<i class='fa fa-times'></i>
								</button>
								<h4 class='modal-title text-#{option.color}'><i class="fa fa-#{option.icon}"></i> #{option.title}</h4>
							</div>
							<div class='modal-body'>#{option.content}</div>							
							<div class='modal-footer'>#{option.footer}</div>
						</div>
					</div>
				</div>
			"""
	options:(option)->
		if option.type is 'ajax'
			"<a href='#' class='btn btn-#{option.color}' data-dismiss='modal'><i class='fa fa-sign-out fa-fw'></i> Cerrar</a>"
		else
			"""
			<div class='btn-group'>
				<a href='#{option.url}' class='btn btn-#{option.color} btn-sm'> <i class="fa fa-#{option.icon} fa-fw"></i> Continuar</a>
				<a href='#' class='btn btn-default btn-sm' data-dismiss='modal'> <i class="fa fa-sign-out fa-fw"></i> Cancelar</a>
			</div>
			"""
	start:->
		option= new Array
		scope= @
		$('body').on 'click', '[data-modal]', (event)->
			event.preventDefault()
			try
				$('#AjaxModal').remove()
				mk::array $(@).attr('data-modal'), option
				if option.type is 'ajax'
					$.ajax
						type: 'POST'
						cache: false
						url: option.url
						success:(data)->
							# opciones default
							option.content= data
							option.size= if not option.size then '' else 'modal-'+option.size
							option.footer= if option.controls isnt 'off' then scope.options(option) else ''
							option.color= if option.color then option.color else option.type
							#
							$(scope.modal(option)).appendTo 'body'
							option.title= if not option.title then '' else option.title
							$('#AjaxModal').modal 'show'
				else
					# opciones default
					option.size= if not option.size then 'modal-sm' else 'modal-'+option.size
					option.footer= if option.controls isnt 'off' then scope.options(option) else ''
					option.color= if option.color then option.color else option.type
					#
					$(scope.modal(option)).appendTo 'body'
				$('#AjaxModal').modal 'show'
			catch error then console.log "- Error en AjaxModal, #{error}"
AjaxModal= new AjaxModal
AjaxModal.start()