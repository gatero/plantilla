###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Versión: 3.2

	- Parametros de configuración
		
		data-config{
			total: numero total de registros
			numRegistros: numero de registros para mostrar por pagina
			action: url de consulta
		}

		data-params: incluye todos los parametros requeridos por la parte back-end, los evalua y encadena

		Ejemplo HTML:
			<ul
				class='PaginationControls pagination pagination-sm'
				data-config=
					'
						total: 25 |
						numRegistros: 5 |
						action: FOO.URL
					'
				data-params=
					'
						numTotalAcuerdos: 25 |
						tipoProyectoArea: A |
						copia: TRUE |
						idClasificacion: 35 |
						idArea: 2
					'
			>
			</ul>
###

class pagination
# -------------------------------
	constructor:(@target)->
		@html=
			BtnList:(scope)->
				"""
					<li>
						<a 
							href='#'
							data-PageListBtn='#{scope.page}'
							data-ajax='type:html|container:#page-num-#{scope.page}|url:#{scope.action}' 
						>
							#{scope.page}
						</a>
					</li>
				"""
			pageContainer:(index)-> "<div class='col-lg-12 page-item hidden' id='page-num-#{index}'></div>"
# -------------------------------
	doBtnList:(@pagesContainer)->
		scope= @
		scope.var= new Array
		param= $(scope.target).attr 'data-params'
		param= if param then mk::array(param) else ''
		#
		mk::array $(scope.target).attr('data-config'), scope.var
		page= 0
		pages= Math.round (scope.var.total / scope.var.numRegistros) + .4
		totalPages= pages
		#
		if pages
			while pages
				page++
				vars= 
					page: page
					action: "#{scope.var.action}?#{param}&page=#{page - 1}&var=#{page}"
				BtnItem= scope.html.BtnList vars
				$(BtnItem).appendTo scope.target
				pages--
				$(pagesContainer).append scope.html.pageContainer page
		else console.log '¿no hay paginas?'
	itemStyle:->
		$('body').on 'click', '[data-PageListBtn]', (event)->
			# btn page
			$('[data-PageListBtn]').parent().removeClass 'active'
			$(@).parent().addClass 'active'
			# page
			pageActive= $(@).attr('data-PageListBtn') - 1
			$('.page-item').addClass 'hidden'
			$(".page-item:eq(#{pageActive})").removeClass 'hidden'
# -------------------------------
if $('.PaginationControls').length
	pager= new pagination '.PaginationControls'
	pager.doBtnList '#pagesContainer'
	pager.itemStyle()
	if $('[data-PageListBtn]').length <= 2 then $('.PaginationControls').addClass 'hidden'