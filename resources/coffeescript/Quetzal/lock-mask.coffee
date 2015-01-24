###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 2.4
###

class LockMask
	loader:
		anim:->
			obj= new CanvasLoader 'lock-mask'
			obj.setColor '#D8D8D8'
			obj.setShape 'square'
			obj.setDiameter 35
			obj.setDensity 12
			obj.setRange 1.2
			obj.setFPS 9
			obj.show()
		box: '<div id="lock-mask" class="lock-mask">'
	block:->
		scope= @
		blockHeight = $(scope.option.container).outerHeight()
		blockWidth  = $(scope.option.container).outerWidth()
		posLeft     = $(scope.option.container).position().left
		posTop      = $(scope.option.container).position().top
		# -------------------------------
		if scope.option.block is 'body'
			blockHeight = $(document).height()
			blockWidth  = $(document).width()
			posLeft     = '0px'
			posTop      = '0px'
		# -------------------------------
		scope.loader.anim()
		# -------------------------------
		$(scope.option.block+' #lock-mask')
		.css
			'position' : 'absolute'
			'height'   : blockHeight
			'width'    : blockWidth
			'left'     : posLeft
			'top'      : posTop
		.fadeIn('slow')
		.on 'contextmenu', (event)-> event.preventDefault()