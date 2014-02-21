# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this	
root.save_data = () -> 
	$.post '/' + $('#key').attr('value'),
		value: $('#pad_contents').val()
		dataType: 'json'
		(data) -> handle_result(data)
		
root.handle_result = (data) ->
	$('#flash').text(data['message'])


