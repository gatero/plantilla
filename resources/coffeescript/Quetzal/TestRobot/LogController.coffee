log =->
	try
		console.log.apply console, arguments
	catch error
		try
			opera.postError.apply opera, arguments
		catch e
			alert Array.prototype.join.call arguments, " "

class Test
	messagesContainer:(require)->
		"""
			<div class='LogMessagesContainer'>
				<h3>Output</h3>
				<ul></ul>
			</div>
		"""
	message:(require)-> """<li class='#{require.messageClass}'>#{require.message}</li>"""
	log:(outcome, message)->
		scope= @
		#
		try
			response=
				messageClass: if outcome then 'errorMenssageExito' else 'errorMenssageFallo'
				messageText: if message then message else 'Sin Descripci&oacute;n'
				messageType: if outcome then '&Eacute;xito: ' else 'Fall&oacute;: '
				message: if outcome then "<i class='fa fa-smile-o'></i> "+message else "<i class='fa fa-frown-o'></i> "+message
			#
			if not $('.LogMessagesContainer').length
				$('body').append scope.messagesContainer response
			$('.LogMessagesContainer ul').append scope.message response
		catch error then log error
test= new Test
add=(num1, num2)-> num1 + num2
# test.log on, 'eureca'
# test.log (add( 520 ) == 24), 'eureca otra vez'
# test.log (add( 520 ) == 24), 'eureca otra y otra vez'