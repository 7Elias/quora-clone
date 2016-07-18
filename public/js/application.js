$(document).ready(function(){
	$(".editbutton").click(function(){
		$("#edit").toggle('fast');
	});

	$('.testing').modal();

	$('#q_up').submit(function(event){
	event.preventDefault();
		$.ajax({
			method: "POST",
			url: $('#q_up').attr('action'),
			dataType: 'json',
			success: function(data){
				$('.q_vote li p').html("<p>" + data + " Votes </p>" );	
			}
		});
	});

	$('#q_down').submit(function(event){
	event.preventDefault();
		$.ajax({
			method: "POST",
			url: $('#q_down').attr('action'),
			dataType: 'json',
			success: function(data){
				$('.q_vote p').html("<p>" + data + " Votes </p>" );	
			}
		});
	});	


	$(".a_up").submit(function(event){
		event.preventDefault();
		var url = $(this).attr('action'),
		a_id = url.substring(url.lastIndexOf('/')+1),
		tag = "#num_vote_" + a_id;

		$.ajax({
			method: "POST",
			url: $(this).attr('action'),
			dataType: 'json',
			success: function(data){
			$(tag).html(data + " Votes");	
			}
		});
	});	

	$(".a_down").submit(function(event){
	event.preventDefault();
	var url = $(this).attr('action'),
		a_id = url.substring(url.lastIndexOf('/')+1),
		tag = "#num_vote_" + a_id;

		$.ajax({
			method: "POST",
			url: $(this).attr('action'),
			dataType: 'json',
			success: function(data){
				$(tag).html(data + " Votes");	
			}
		});
	});

});

// if result undefined use status code