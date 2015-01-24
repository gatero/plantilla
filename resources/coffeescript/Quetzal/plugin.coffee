###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
###

class plugin
	validar:(target)->
		if $.validity then alert = $.validity.messages
		target= if target? then target else 'form'
		# config
		$(target).validity ->
			$('[data-require]').require()
			$('[data-require="fecha"]').match 'date'
			$('[data-require="email"]').match 'email'
			$('[data-require="number"]').match 'number'
			$('[data-require="pass"]').equal alert.equal

	tables:(target)-> 
		$(target).dataTable()
		container= $('.dataTables_wrapper')
		container.each ->
			controls= $(@).find('.dataTableControl')
			if $(@).find('tr').length < 11
				controls.addClass 'hidden'
			else controls.removeClass 'hidden'
	###
	edit:(target)->
		$(target).each ->
			#
			option= {}
			vars= {}
			#
			if $(@).attr 'data-edit-option'
				gen::vars $(@).attr('data-edit-option'), option
			else console.log 'no data-edit-option'
			#
			$(@).editable(
				option.url,
				cssclass : if option.clase then option.clase else 'editable'
				name : if option.name then option.name else 'id'
				submitdata :
					'valorCatalogo.valorCatalogoPk.idCatalogoMaestro': if option.idCatalogoMaestro then option.idCatalogoMaestro else ''
					'valorCatalogo.valorCatalogoPk.idValorCatalogo': if option.idValorCatalogo then option.idValorCatalogo else ''
				indicator: if option.mensaje then option.mensaje else 'salvando...'
				tooltip: ' '
			)
	###