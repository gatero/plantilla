###
	@Autor: Daniel Ortega
	@Project: image viewer
	@Autor_URI: gatero.mx
	@Version: 2.5
###

class iv
# ------------------------------- constructor
	constructor:(@opt)->
		x=@
		# informacion de la obra
		x.data= {}
		# informacion de las obras asosiadas
		x.thumb= {}
		# propiedades del display
		x.display= {}
		# propiedades de imagen
		x.imagen=
			proporcion: 1
			position: 1
			rSize:->
				$(window).on 'resize', ->
					# la imagen siempre al centro
					left= (($(window).width() / 2) - (x.imagen.ancho / 2)) + 'px'
					top= (($(window).height() / 2) - (x.imagen.alto / 2)) + 'px'
					# la imagen siempre al centro
					x.imagen.box.css
						'left': left
						'top': top
		# propiedades del zoom
		x.zoom=
			increment: 1.5
			center: 1
			time: 600
			active: off
			level: 1
			maxlevel: 4
			keyScroll:(target)->
				imagen= x.imagen.box.stop()
				$(document).on
					'keypress keydown':(event)->
						switch event.which
							when 189 then x.zoom 'out', event
							when 37 then imagen.animate 'left':'-='+x.imagen.Xmove+'px'
							when 38 then imagen.animate 'top':'-='+x.imagen.Ymove+'px'
							when 39 then imagen.animate 'left':'+='+x.imagen.Xmove+'px'
							when 40 then imagen.animate 'top':'+='+x.imagen.Ymove+'px'
							when 187 then x.zoom 'in', event
					mousewheel:(event,d)->
						dir= if d > 0 then 'Up' else 'Down'
						switch dir
							when 'Up' then x.zoom 'in', event
							when 'Down' then  x.zoom 'out', event
			config:->
				x.imagen.src= $('div#iv-img > img')
				# -------------------------------
				x.imagen.ancho= x.imagen.src.width()
				x.imagen.alto= x.imagen.src.height()
				# -------------------------------
				x.imagen.Xmove= x.imagen.src.width() / 10
				x.imagen.Ymove= x.imagen.src.height() / 10
				# -------------------------------
				x.display.Xcentro= (($(window).width() / 2) - (x.imagen.src.width() / 2))
				x.display.Ycentro= (($(window).height() / 2) - (x.imagen.src.height() / 2))
				# -------------------------------
				x.imagen.box.css
					'left': x.display.Xcentro + 'px'
					'top': x.display.Ycentro + 'px'
				# -------------------------------
				x.imagen.src.css 'display':'block'
			imagen:->
				$("<img src='#{x.data.obraSrc}'/>").appendTo $('div#iv-img')
				#
				setTimeout ->
					x.zoom.config()
					x.zoom.level= 1
					#
					x.imagen.box.css 
						'opacity': 1
					.draggable()
					#
					x.imagen.src.dblclick -> x.zoom.event 'in', event, yes
					#
					x.imagen.resize()
					#
					x.keyscroll()
				,200
			clic:->
				console.log x.zoom.increment
		# elementos html
		x.html=
			base: """
							<div class='iv-ui' id='iv-bg'></div>
							<div class='iv-ui' id='iv-img'></div>
							<div class='iv-ui' id='iv-data'></div>
							<div class='iv-ui' id='iv-head'></div>
						"""
			menu: """
							<div class='navbar navbar-default' role='navigation' id='iv-menu'>
							  <div class='container-fluid'>

							    <div class='navbar-header'>
							      <button type='button' class='navbar-toggle' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1'>
							        <span class='sr-only'>Toggle navigation</span>
							        <span class='icon-bar'></span>
							        <span class='icon-bar'></span>
							        <span class='icon-bar'></span>
							      </button>
							      <a class='navbar-brand' href='#'> <img src='./resources/imagen/iv-logo.png'/> </a>
							    </div>

							    <div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>

							      <ul class='nav navbar-nav navbar-right'>
							        <li><a href='#'><i class='fa fa-search-plus'></i>&nbsp;&nbsp;In</a></li>
							        <li><a href='#'><i class='fa fa-search-minus'></i>&nbsp;&nbsp;out</a></li>
							        <li><a href='#'><i class='fa fa-search'></i>&nbsp;&nbsp;Restart</a></li>
							        <li class='dropdown'>
							          <a href='#' class='dropdown-toggle' data-toggle='dropdown'><i class='fa fa-gears'></i>&nbsp;&nbsp;Opciones <b class='caret'></b></a>
							          <ul class='dropdown-menu'>
							            <li><a href='#'><i class='fa fa-plus-square'></i>&nbsp;&nbsp;Agregar a Colecci&oacute;n</a></li>
							            <li><a href='#'><i class='fa fa-chain'></i>&nbsp;&nbsp;Link de im&aacute;gen</a></li>
							            <li><a href='#'><i class='fa fa-edit'></i>&nbsp;&nbsp;Editar informaci&oacute;n</a></li>
							            <li class='divider'></li>
							            <li><a href='#'><i class='fa fa-trash-o'></i>&nbsp;&nbsp;Borrar im&aacute;gen</a></li>
							          </ul>
							        </li>
							        <li><a href='#' id='iv-btn-close'><i class='fa fa-sign-out'></i>&nbsp;&nbsp;Cerrar</a></li>
							      </ul>

							    </div>
							  </div>
							</div>
						"""
			data: """
							<ul class='nav nav-tabs' id='iv-tab-ctrl'>
							  <li class='active'>
							  	<a href='#obra' data-toggle='tab'>
							  		<i class='fa fa-picture-o'></i><span class='hidden-xs'>&nbsp;&nbsp;obra</span>
							  	</a>
							  </li>
							  <li>
							  	<a href='#autor' data-toggle='tab'>
							  		<i class='fa fa-user'></i><span class='hidden-xs'>&nbsp;&nbsp;autor</span>
							  	</a>
							  </li>
							  <li>
							  	<a href='#movimientos' data-toggle='tab'>
							  		<i class='fa fa-truck'></i><span class='hidden-xs'>&nbsp;&nbsp;movimientos</span>
							  	</a>
							  </li>
							  <li>
							  	<a href='#historia' data-toggle='tab'>
							  		<i class='fa fa-calendar'></i><span class='hidden-xs'>&nbsp;&nbsp;historia</span>
							  	</a>
							  </li>
							</ul>
							<div class='tab-content' id='iv-tab-content'>
							  <div class='tab-pane fade in active' id='obra'></div>
							  <div class='tab-pane fade' id='autor'></div>
							  <div class='tab-pane fade' id='movimientos'></div>
							  <div class='tab-pane fade' id='historia'></div>
							</div>
						"""
# ------------------------------- destroy
	cerrar:->
		$('#iv-btn-close').on 'click', ->
			$('.iv-ui').fadeOut 'fast',-> # Desaparece la ui
				$(@).remove() # eliminamos
				$('body').removeClass 'iv-block-body'
# ------------------------------- datos
	datos:->
		x=@
		$(@html.data).appendTo '.iv-ui#iv-data' # iniciamos el contenedor
		$('#iv-tab-ctrl a').click ->
			id= $(@).attr('href').replace '#',''
			data= ''
			if $('#iv-tab-content > div[id='+id+']').empty()
				for key, value of x.data
					Q= key.search id
					if Q is 0
						key= key.replace id+'_',''
						switch key
							when 'Titulo' then data= data+'<h4>'+value+'</h4>'
							when 'Autor' then data= data+'<i>'+value+'</i>'
							else
								if key isnt 'Src' then data= data+'<p>'+key+': '+value+'<p>'
				$('#iv-tab-content > div[id='+id+']').append data
		$('#iv-tab-ctrl a:eq(0)').click()
# ------------------------------- start
	start:->
		x=@
		$(x.opt.clase).on 'click',(event)->
			event.preventDefault()
		# escribimos la informacion
			mk::array $(@).attr(x.opt.data), x.data # pasamos la info a un arreglo
		# Inicio del visor
			$('body').addClass 'iv-block-body' # bloqueo el tamaño de pantalla
			$(x.html.base).appendTo 'body' # Agregamos la interface
		# Menu
			$(x.html.menu).appendTo '.iv-ui#iv-head'
		# Contenedor de datos
			x.datos()
		# prevenimos comportamiento por defecto de los botones
			$('.iv-ui a').click (event)-> event.preventDefault()
		# Cuando todo esta listo aparece el visor
			$('.iv-ui').fadeIn 'fast'
			x.cerrar()
		#
			x.zoom.clic()
# -------------------------------
iv = new iv
	data: 'data-gallery'
	clase: '.iv-trigger'
iv.start()