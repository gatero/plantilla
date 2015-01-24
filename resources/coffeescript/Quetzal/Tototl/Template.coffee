class Template
	imageBox:(require)->
		"""
			<div class='tototl dragger'>
				<img src="#{require.info.src}">
			</div>
		"""
	imageInfo:(require)->
		"""
			<div class='tototl ui imageInfo col-lg-3'>
				<div class='tab-content tototlInfoContainer'>
					<div class='tab-pane fade in active' id='obra'></div>
					<div class='tab-pane fade' id='autor'></div>
					<div class='tab-pane fade' id='movimientos'></div>
					<div class='tab-pane fade' id='historia'></div>
				</div>
			</div>
		"""
	background:(require)->
		"""
			<div class='tototl ui background'></div>
		"""
	galleryOptions:(require)->
		"""
			<ul class='nav nav-tabs tototl ui galleryOptions'>
				
				<li>
					<a href='#' id='tototl-showInfoCtrl'>
						<i class='fa fa-eye-slash''></i><!--span class='hidden-xs'>&nbsp;&nbsp;historia</span-->
					</a>
				</li>

				<li>
					<a href='#' id='tototl-zoomInBtn'>
						<i class='fa fa-search-plus'></i><!--span class='hidden-xs'>&nbsp;&nbsp;historia</span-->
					</a>
				</li>
				<li>
					<a href='#' id='tototl-zoomOutBtn'>
						<i class='fa fa-search-minus'></i><!--span class='hidden-xs'>&nbsp;&nbsp;historia</span-->
					</a>
				</li>
				<li>
					<a href='#' id='tototl-starterSize'>
						<i class='fa fa-search'></i><!--span class='hidden-xs'>&nbsp;&nbsp;historia</span-->
					</a>
				</li>

				<li class='active'>
					<a class='tototl infoCtrl' href='#obra' data-toggle='tab'>
						<i class='fa fa-picture-o fa-fw'></i><!--span class='hidden-xs'>&nbsp;&nbsp;obra</span-->
					</a>
				</li>
				<li>
					<a class='tototl infoCtrl' href='#autor' data-toggle='tab'>
						<i class='fa fa-user'></i><!--span class='hidden-xs'>&nbsp;&nbsp;autor</span-->
					</a>
				</li>
				<li>
					<a class='tototl infoCtrl' href='#movimientos' data-toggle='tab'>
						<i class='fa fa-truck'></i><!--span class='hidden-xs'>&nbsp;&nbsp;movimientos</span-->
					</a>
				</li>
				<li>
					<a class='tototl infoCtrl' href='#historia' data-toggle='tab'>
						<i class='fa fa-calendar'></i><!--span class='hidden-xs'>&nbsp;&nbsp;historia</span-->
					</a>
				</li>
				<li>
					<a href='#' id='tototl-closeBtn'>
						<i class='fa fa-sign-out''></i><!--span class='hidden-xs'>&nbsp;&nbsp;historia</span-->
					</a>
				</li>
			</ul>
		"""