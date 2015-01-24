class MainCtrl
	main:->
		template= new Template
		$('body').on 'click', '[data-tototl]', (event)->
			event.preventDefault()
			target= @
			response= 
				info: new Array
				target: target
			# init
			mk::array $(target).attr('data-tototl'), response.info
			if not $('.tototl').length
				$('body')
					.append template.background()
					.append template.galleryOptions()
					.append template.imageInfo()
					.append template.imageBox response
				$('.tototl.ui').fadeIn 'fast'
				$('body, html').addClass 'no-scroll'
			try
				# Manejo de imagen
				imageControl= new ImageControl response
				imageControl.main()
				# menu opciones
				galleryOptions= new GalleryOptions
				galleryOptions.main()
				# informacion de la imagen
				showInfoCtrl= new ShowInfoCtrl response
				showInfoCtrl.main()
			catch error
				console.log error
mainCtrl= new MainCtrl
mainCtrl.main()