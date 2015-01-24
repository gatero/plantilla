###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 1.1
###

gen= new vargen
class multiple_select
# ------------------------------- constructor
	constructor:(@target)->
		@option= {}
# ------------------------------- buscar
	buscar:(liga,level,phone)->
		x= @
		item= {}
		for i in[0..liga.length - 1]
			if phone is false
				$(@target).each ->
					gen.now $(@).attr('data-select'), item
					if item.id is liga[i] and item.level is level
						$(@).addClass 'ms-item-active'
			else
				$('.ms-item-phone').each ->
					gen.now $(@).attr('data-select'), item
					console.log item
					if item.id is liga[i] and item.level is level
						$(@).removeClass 'hidden'
# ------------------------------- select
	phone_type:->
		x= @
		$('#ms-phone-type').change ->
			if $(@).val() isnt ''
				$('[id^=ms-phone-type-]:visible').addClass 'hidden'
				$('[id^='+$(@).val()+']').removeClass 'hidden'
			else false
		$('[id^=ms-phone-type-]').change ->
			gen.now $(@).children('option:selected').attr('data-select'), x.option
			#console.log x.option
			$('.ms-item-phone').addClass 'hidden'
			# Buscar Relacion
			liga= x.option.ligas.split ','
			switch x.option.level
				when '1' then x.buscar liga, '2', true
				when '2' then x.buscar liga, '1', true

# ------------------------------- select
	select:->
		x= @
		$(@target).on
			click:->
				gen.now $(@).attr('data-select'), x.option
				# switch class
				$(x.target).removeClass 'ms-item-active ms-relation-active'
				$(@).addClass 'ms-relation-active'
				# Buscar Relacion
				liga= x.option.ligas.split ','
				switch x.option.level
					when '1' then x.buscar liga, '2', false
					when '2' then x.buscar liga, '1', false
# ------------------------------- start
	start:->
		#
		$('#st-restart').click -> 
			$('.ms-item').removeClass 'ms-item-active ms-relation-active'
		@select()
		@phone_type()
# -------------------------------
multiple_select= new multiple_select '.ms-item'
multiple_select.start()
# $('body').on 'contextmenu', (event)-> event.preventDefault();