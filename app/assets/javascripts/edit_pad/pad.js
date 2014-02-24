
save_data = function () {
	var url = '/' + $('#key').attr('value')
	var json = { value: $('#pad_contents').val() }
	$.post( url , json	, handle_result, 'json');		
}
		
handle_result = function(data) {
	$('#flash').text(data['message']);
}


$(document).ready(function () {
	$('#save').click( function(event) {
		event.preventDefault();
		save_data();
	});
});
