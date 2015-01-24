class GalleryController
	galleryInit:->
		html= """
						<div id='blueimp-gallery' class='blueimp-gallery blueimp-gallery-controls'>
							<div class='slides'></div>
							<h3 class='title'></h3>
							<a class='prev'>‹</a>
							<a class='next'>›</a>
							<a class='close'>×</a>
							<a class='play-pause'></a>
							<ol class='indicator'></ol>
						</div>
					"""
		if not $('#blueimp-gallery').length then $('body').append html
	galleryConfig:->
		$('#blueimp-gallery').on 
			'slideend': (event, index, slide) ->
				titulo= $('#blueimp-gallery h3.title').text()
				$('#blueimp-gallery h3.title').html titulo
galleryController= new GalleryController
galleryController.galleryInit()
galleryController.galleryConfig()