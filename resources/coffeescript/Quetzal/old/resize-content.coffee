###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 1.0
###

gen= new vargen
class myResize
# ------------------------------- constructor
	constructor:(@option)->
		@data= {}
# ------------------------------- switch
	content:(content, size)->
		x= @
		$(x.option.target).click (event)->
			event.preventDefault()
			gen.now $(@).attr('data'), x.data
			#
			newClass         = $(content+'>div').attr 'class'
			newClass         = newClass.replace new RegExp(x.option.default, 'g'), x.data.size
			x.option.default = x.data.size
			#
			$(content+'>div').attr 'class', newClass
		if size
			newClass = $(content+'>div').attr 'class'
			newClass = newClass.replace new RegExp(size, 'g'), x.option.default
			#
			$(content+'>div').attr 'class', newClass
# ------------------------------- start
	start:->
		@content @option.content
# -------------------------------
myResize = new myResize
	target: '.myResize-btn'
	content: '#myAjax-box'
	default: '6'
# -------------------------------
myResize.start()