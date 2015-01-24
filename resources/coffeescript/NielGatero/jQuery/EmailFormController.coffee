class EmailFormController
	sendEmail:->
		$('body').on 'submit', '[role="ContactForm"]', (event)->
			event.preventDefault()
			$.ajax
				url: $(@).attr('action'),
				type: 'POST',
				data: $(@).serialize(),
				success: (response)-> $('.emailErrorsContainer').html response
mailSender= new EmailFormController
mailSender.sendEmail()