###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
	@Version: 1.1
###
browser=
	get:
		name: navigator.appName
		version: parseFloat navigator.appVersion
		code_name: navigator.appCodeName
		platform: navigator.platform
		javaEnabled: navigator.javaEnabled()
		display_w: screen.width
		display_h: screen.height
	review:->
		console.log 'name:'+ navigator.appName
		console.log 'version:'+ parseFloat navigator.appVersion
		console.log 'code_name:'+ navigator.appCodeName
		console.log 'platform:'+ navigator.platform
		console.log 'javaEnabled:'+ navigator.javaEnabled()
		console.log 'display_w:'+ screen.width
		console.log 'display_h:'+ screen.height
