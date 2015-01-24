class ShowInfoCtrl
	constructor:(@require)->
	makeDataArray:(require)->
		scope= @
		require= if require then require else @require
		infoHtml= ''
		for key, value of require.info
			query= key.search require.section
			if query is 0
				key= key.replace require.section+'_',''
				switch key
					when 'Titulo' then infoHtml= infoHtml+'<h4>'+value+'</h4>'
					when 'Autor' then infoHtml= infoHtml+'<i>'+value+'</i>'
					else
						if key isnt 'Src' then infoHtml= infoHtml+'<p>'+key+': '+value+'<p>'
		infoHtml
	useImageArray:(require)->
		scope= @
		require= if require then require else @require
		$('body').on 'click', '.infoCtrl', (event)->
			event.preventDefault()
			target= @
			section= $(target).attr('href').replace '#',''
			require.section= section
			section= $('.tototlInfoContainer #'+section)
			if section.empty()
				section.append scope.makeDataArray require
	main:->
		@useImageArray()
		$('.tototl.infoCtrl:eq(0)').click()