class GalleryOptions
	closeBtn:->
		# botón cerrar
		$('body').on 'click', '#tototl-closeBtn', ->
			if $('.tototl').length
				$('.tototl').fadeOut 'fast', ->
					$('.tototl').remove()
					$('body, html').removeClass 'no-scroll'
		# Tecla esc
		$('body').on 'keyup', (event)->
			if event.which is 27 and $('.tototl').length
				$('.tototl').fadeOut 'fast', ->
					$('.tototl').remove()
					$('body, html').removeClass 'no-scroll'
	showHideBtn:->
		$('body').on 'click', '#tototl-showInfoCtrl', (event)->
			event.preventDefault()
			$('.tototl.imageInfo').addClass 'imageInfoAnimation'
			$('.tototl.galleryOptions').addClass 'galleryOptionsAnimation'
			$(@)
				.attr 'id': 'tototl-hideInfoCtrl'
				.children('i.fa').attr 'class': 'fa fa-eye'
				.parent().addClass 'tototlActiveBtn'
		$('body').on 'click', '#tototl-hideInfoCtrl', (event)->
			event.preventDefault()
			$('.tototl.imageInfo').removeClass 'imageInfoAnimation'
			$('.tototl.galleryOptions').removeClass 'galleryOptionsAnimation'
			$(@)
				.attr 'id': 'tototl-showInfoCtrl'
				.children('i.fa').attr 'class': 'fa fa-eye-slash'
				.parent().removeClass 'tototlActiveBtn'
	main:->
		@showHideBtn()
		@closeBtn()