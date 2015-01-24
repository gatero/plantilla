###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 1.1
###

class infinite_load
# ------------------------------- constructor
	constructor:(@target)->
		@option= {}
		@html=
			loader:
				"""
					<div id='infinite-load-icon' style='padding: 20px 0px; font-size: 28px; text-align: center;'>
						<i class="fa fa-spinner fa-spin"></i> Cargando...
					</div>
				"""
		@error=
			no_data: 'No more posts to show.'
		@status= on
# ------------------------------- start

	start:->
		x= @
		gen::vars $(x.target).attr('data-infinite'), x.option
		x.option.loadnum= parseInt x.option.loadnum
		x.option.add= x.option.loadnum
		$(window).scroll ->
			if $(window).scrollTop() is $(document).height() - $(window).height()
				if x.status
					x.status= off
					if not $('#infinite-load-icon').length
						$(x.target).append x.html.loader
						setTimeout ->
							$.ajax
								url: x.option.src+'?var='+x.option.loadnum
								success:(data)->
									if data
										$(x.target).append data
										$('#infinite-load-icon').remove()
									else
										$('#infinite-load-icon').html x.error.no_data
							x.status= on
							x.option.loadnum= x.option.loadnum + x.option.add
						, 1500