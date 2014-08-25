
$(document).ready(function() {
	//toggle `popup` / `inline` mode
	$.fn.editable.defaults.mode = 'inline';     

	//make status editable
	$('#memo').editable({
		type: 'text',
		//uncomment these lines to send data on server
		pk: 1,
		id: 'memo',
		data: function (params) {
			var data = {};
            data['srsSelected'] = "aaaaaa";
            return data;
		},
		url: '/TipTipCal/expense/test',
			success: function(response, newValue) {
		        alert(response.status);
		    }
	});
});