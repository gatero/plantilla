class SiteCanvasContainer
	constructor:->
		@num= 120
		@margenAncho= ($(window).width()*2)/100
		@margenAlto= ($(window).height()*30)/100
		@SiteCanvasContainer= $('.SiteCanvasContainer')
	starHtml:(id)-> "<div class='star' id='star-#{id}'></div>"
	randomValuesFor:(target)->
		scope= @
		randomLeft= Math.floor (Math.random() * ($(window).width() - scope.margenAncho)) + 1
		randomTop= Math.floor (Math.random() * ($(window).height() - scope.margenAlto)) + 1
		randomSize= Math.floor (Math.random() * 7) + 1
		
		$(target).css
			'left': randomLeft
			'top': randomTop
			'width': randomSize
			'height': randomSize
	createStars:->
		scope= @
		for starNum in[0..scope.num - 1]
			scope.SiteCanvasContainer.prepend scope.starHtml starNum
			scope.starsPosition starNum
	starsPosition:(starNum)->
		scope= @
		star= "#star-#{starNum}"
		scope.randomValuesFor star
	animateStars:->
		scope= @
		for starNum in[0..80 - 1]
			starAnimate= Math.floor (Math.random() * scope.num) + 1
			star= $(".star:eq(#{starAnimate})")
			if not star.hasClass 'starShining'
				star.addClass 'starShining'
	animateAstro:->
		scope= @
		# Animacion de cometa en el cielo
		setInterval ->
			cometa= '#star-cometa'
			scope.SiteCanvasContainer.append scope.starHtml 'cometa'
			scope.randomValuesFor cometa
			$(cometa).animate
				'left': '-=100'
				'top': '+=200'
				'opacity': '0'
			, 1000, ->
				$(@).remove()
		, 5000
siteCanvasContainer= new SiteCanvasContainer
siteCanvasContainer.createStars()
siteCanvasContainer.animateStars() 
siteCanvasContainer.animateAstro()