###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 1.1
###

class loader
	constructor:(@option)->
	loader:(option)->
			"""
				<div id='ng-loader'>
					<div id='loader-centerbox'>
						<img src='#{option.imagen}'/>
						<div id='loader-label'>#{option.texto}</div>
					</div>
				</div>
			"""
	start:->
		scope= @
		if not scope.option.delay then scope.option.delay= 500
		$(document).ready ->
			option=
				imagen: $('html').attr 'data-preload'
				texto: scope.option.texto
			$('body').append scope.loader option
			if $('#ng-loader').length
				$('html, body').addClass 'ng-loader-in'
		$(window).load ->
			$('.load-content').fadeIn 'fast'
			setTimeout ->
				$('#ng-loader').fadeOut ->
					$('html, body').removeClass 'ng-loader-in'
					$(@).remove()
			, scope.option.delay
# -------------------------------
loader= new loader
	texto: ''
	delay: 2000
loader.start()