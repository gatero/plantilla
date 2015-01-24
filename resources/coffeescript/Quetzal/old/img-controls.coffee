###
	@Autor: Daniel Ortega
	@Project: Museum Soft
	@Module: Gallery
###
class img_ctrl
	constructor:(@target)->
		@option = {}
	mask:(option)->
			"""
				<div class='ic-mask'>
					<div class='options'>
						<a
							href='#'
							data-mymodal='
								type->danger&&
								url->#{option.dlt}&&
								text-> Los cambios serán permanentes, deseas continuar?'
							>
							<i class='fa fa-trash-o fa-fw'></i>
						</a>
						<a
							href='#'
							data-mymodal='
								type->ajax&&
								url->#{option.edit}&&
								title->Editar información'
							>
							<i class='fa fa-pencil-square-o fa-fw'></i>
						</a>
						<a href='#' class='iv-trigger'>
							<i class='fa fa-search fa-fw'></i>
						</a>
						<a href='#{option.files}' class='ic-files'>
							<i class='fa fa-folder-open-o fa-fw'></i>
						</a>
					</div>
				</div>
			"""
	agregar:(target)->
		$(target).append $(@mask @option)
	borrar:(target)->
		$(target).children('.ic-mask').remove()
	resize:(target)->
		item= $(target)
		mask= item.children('.ic-mask')
		mask.css
			left: item.position().left
			top: item.position().top
			width: item.width()
			height: item.height()
		$(window).resize ->
			mask.css
				left: item.position().left
				top: item.position().top
				width: item.width()
				height: item.height()
	start:->
		x = @
		$('body').on 'mouseenter', x.target, ->
			mk::array $(@).attr('data-controls'), x.option
			x.agregar @
			if x.option.zoom is 'yes'
				$('.iv-trigger').css 'display': 'inline-block'
				$(@).find('.iv-trigger').attr 'data-gallery' : $(@).attr('data-gallery')
				iv.start()
			else
				$('.ic-files').css 'display': 'inline-block'
			x.resize @
		$('body').on 'mouseleave', x.target, ->
			x.borrar @
#--------------------------------------
img_ctrl = new img_ctrl '.img-ctrl'
img_ctrl.start()