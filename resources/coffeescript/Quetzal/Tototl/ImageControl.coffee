class ImageControl
	constructor:->
		@zoomPercent= 20
		@movePercent= 20
		@maxZoomLevel= 2.3
		@dragger= '.dragger'
		@image= '.dragger img'
	dragImage:(option)->
		scope= @
		$(scope.dragger).draggable option
	centerImage:->
		scope= @
		centerY= ($(window).height()/2)-($(scope.image).outerHeight()/2)
		centerX= ($(window).width()/2)-($(scope.image).outerWidth()/2)
		$(scope.dragger).animate {'top': centerY, 'left': centerX}, 'fast'
		$(window).on 'resize', ->
			centerY= ($(window).height()/2)-($(scope.image).outerHeight()/2)
			centerX= ($(window).width()/2)-($(scope.image).outerWidth()/2)
			$(scope.dragger).animate {'top': centerY, 'left': centerX}, 'fast'
	zoomControl:(type, image)->
		scope= @
		zoomProperties= new Array
		switch type
			when 'in'
				zoomProperties=
					'width': '+='+(scope.zoomPercent*image.width()/100)
					'height': '+='+(scope.zoomPercent*image.height()/100)
			when 'out'
				zoomProperties=
					'width': '-='+(scope.zoomPercent*image.width()/100)
					'height': '-='+(scope.zoomPercent*image.height()/100)
		$(scope.image+':not(:animated)')
			.stop()
			.animate zoomProperties, 100, -> scope.centerImage()
	starterSize:->
		scope= @
		scope.starterWidth= $(scope.image).outerWidth()
		scope.starterHeight= $(scope.image).outerHeight()
		$('body').on 'click', '#tototl-starterSize', (event)->
			if $(scope.image).width() > scope.starterWidth
				$(scope.image).animate
					width: scope.starterWidth
					height: scope.starterHeight
				, 200, -> scope.centerImage()
	zoomTrigger:->
		scope= @
		image= off
		scope.starterSize()
		$(scope.image).css
			'width': scope.starterWidth
			'min-width': scope.starterWidth
			'max-width': (scope.starterWidth*scope.maxZoomLevel)
			'height': scope.starterHeight
			'min-height': scope.starterHeight
			'max-height': (scope.starterHeight*scope.maxZoomLevel)
		$('body').on 'mousewheel', scope.dragger, (event)->
			if $('.tototl').length
				switch event.deltaY
					when 1 then scope.zoomControl 'in', $(scope.image)
					when -1 then scope.zoomControl 'out', $(scope.image)
		$('body').on 'keyup', (event)->
			if $('.tototl').length
				switch event.which
					when 187 then scope.zoomControl 'in', $(scope.image)
					when 189 then scope.zoomControl 'out', $(scope.image)
		$('body').on 'dblclick', scope.image, (event)->
			scope.zoomControl 'in', $(scope.image)
		$('body').on 'click', '#tototl-zoomInBtn', (event)->
			scope.zoomControl 'in', $(scope.image)
		$('body').on 'click', '#tototl-zoomOutBtn', (event)->
			scope.zoomControl 'out', $(scope.image)
	main:->
		scope= @
		setTimeout ->
			scope.centerImage()
			scope.dragImage()
			scope.zoomTrigger()
		, 500