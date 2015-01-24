###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 2.4

	- Parametros de configuracion
		
		type: puede ser html o append

		container: Contenedor de salida de datos por default esta myajax-container

		url: Recurso de consulta

		block: opcion de bloqueo por default bloquea el body

		* Es necesario incluir el archivo css de esta libreria
###

class AjaxData extends LockMask
	constructor:->
		@option=
			container : '#ajax-container'
			evento  : 'click'
			block		: 'body'
			type		: 'html'
	start:->
		scope= @

		$('body').on scope.option.evento, '[data-ajax]', (event)->
			event.preventDefault()
			btn= $(@)
			mk::array $(@).attr('data-ajax'), scope.option
			try
				if $(scope.option.container).html() is ''
					btn.button 'loading'
					$.ajax
						url: scope.option.url
						cache: off
						beforeSend:->
							if not $(scope.option.block+' #lock-mask').length
								$(scope.loader.box).appendTo scope.option.block
								scope.block()
						success:(data)->
							setTimeout ->
								$(scope.option.block+' #lock-mask').fadeOut 'fast', ->
									switch scope.option.type
										when 'html' 
											$(scope.option.container).empty().html data
											plugin::tables 'table'
										when 'append' then $(scope.option.container).append data
										when 'off' then off
									$(@).remove()
							, 0
					.always -> btn.button 'reset'
			catch error then console.log '#Error en AjaxData, '+error
# -------------------------------
AjaxData= new AjaxData
AjaxData.start() 