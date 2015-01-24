###
	@Autor: Daniel Ortega
	@Autor_URI: gatero.mx
###

class mk
	array:(data, out, div1, div2)->
		###
			-------------------------------------------------------
			Generrar arreglos desde un atributo html
			-------------------------------------------------------

			- Para utilizar esta función se necesita un array
				para generar las propiedades de cada instancia.

				HTML: 
					<div id="foo" data-config='var1->2&&var2->5'></div>

				Coffee:
					option= new Array
					mk::array($('#try').attr('data-config'), option)

				Usage example:
					something: option.var1

			-------------------------------------------------------
			Generar cadenas de parametros desde un atributo html
			-------------------------------------------------------

			- Tambien podemos generar parametros URL, para esto
				solo necesitamos incluir el parametro data

				HTML: 
					<div id="foo" data-params='var1->2&&var2->5'></div>
				Coffee:
					params= mk::array $('#try').attr('data-params')

					la salida es: &var1=2&var2=5
		###
		try
			div1= if div1 then div1 else '|'
			div2= if div2 then div2 else '->'
			data= data.split div1
			if not out then params= ''
			for i in[0..data.length - 1]
				put= data[i].split div2
				if out then out[put[0].trim()]= put[1].trim()
				else
					if put[1].trim() isnt '' and put[1].trim() isnt 'null' and put[1].trim() isnt 'undefined' and put[1].trim() isnt 'false'
						params+="&#{put[0].trim()}=#{put[1].trim()}"
			if params isnt '' then params
		catch error then console.log "- Error en mk::array, #{error}"
	key:(keySize, special)->
		###
			- Para generar un cadenas de caracteres aleatoria
				Solo indicamos la longitud en valor numerico, 
				e indicamos si tendra caracteres especiales.

				Coffee:
					console.log mk::key 7, yes
		###
		iteration= 0
		password= ""
		number= on
		if special then special = no
		while iteration < keySize
			number= (Math.floor((Math.random() * 100)) % 94) + 33
			if not special
				if number >=33 and number <=47 then continue
				if number >=58 and number <=64 then continue
				if number >=91 and number <=96 then continue
				if number >=123 and number <=126 then continue
				iteration++
				password+= String.fromCharCode number
		password
	name:(name)->
		###
			- Para generar nombres con una cadena de caracteres
				aleatoria solo se requiere untroducir un nombre o dejar el nombre por defecto

				Coffee:
					console.log mk::name('foo')
		###
		name= if name then name else 'default name'
		name= name.replace(/\s/g,"_")
		name= "#{name}_#{@key(5)}"
		name
	lock:(target)-> $('body').on 'contextmenu', target, (event)-> event.preventDefault()
$('[href="#"][type="button"]').click (event)-> event.preventDefault()