###
	@Autor: Daniel Ortega
	@Project: upFile
	@Autor_URI: niel-gatero.com
	@Version: 1.0
###
class upFile
#-------------------------------------- constructor
	constructor:(@target)->
		@vhtml = 
			box: '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" id="upFile-box"></div>'
			item: 
				"""
					<div class='upFile-item'>
						<img class='img-responsive img-thumbnail'/>
						<input class='upFile-file' type="file" name="file"/>
						<div>
							<span class='glyphicon glyphicon-trash'></span>
						</div>
					</div>
				"""
#-------------------------------------- mouseEvents
	mouseEvents:(target)->
		interval = false
		$(target).on
			mouseenter:->
				count = 1
				item = $(@)
				interval = setInterval ->
					count--
					if count is 0
						mask = item.children 'div'
						img = item.children 'img'
						ico = item.find 'span'
						mask.css
							'width': img.outerWidth()
							'height': img.outerHeight()
							'top': img.position().top
							'left': img.position().left
						mask.fadeIn 'fast'
						clearInterval interval
				,250
			mouseleave:->
				clearInterval interval
				mask = $(@).children 'div'
				mask.fadeOut 'slow'
			click:->
				$(@).remove()
#-------------------------------------- fileURL
	fileURL:(input,imagen)->
		if input.files and input.files[0]
			reader = new FileReader()
			reader.onload = (e)->
				$(imagen).attr('src', e.target.result)
				true
			reader.readAsDataURL(input.files[0])
		true
#-------------------------------------- files
	files:->
		x = @
		status = on
		$(@target).click (event)->
			event.preventDefault()
			if status is on
				if $(@).attr 'id' is 'one'
					status = off
				if $('#upFile-box').length is 0 
					$(@).parent().parent().after x.vhtml.box
				if $('.upFile-file:last').val() isnt '' 
					$(x.vhtml.item).appendTo '#upFile-box'
				$('.upFile-item:last > input[type="file"]').click()
				$('.upFile-item:last > input[type="file"]').change ->
					item = $(@).parent '.upFile-item'
					img = item.children 'img'
					x.fileURL @, img
					img.fadeIn 'fast'
					x.mouseEvents item
#-------------------------------------- out
	out:->
		@files()
#--------------------------------------
upFile = new upFile '.upFile-target'
