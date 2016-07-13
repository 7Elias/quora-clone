$(document).ready(function(){
	$(".editbutton").click(function(){
		$("#edit").toggle('fast');
	})

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

// 		event.preventDefault();
// 		$('form > input[type="submit"]').val('Submitting...');
// 		$('form > input[type="submit"]').attr('disabled',true);
// 		$.ajax({
// 			method: "POST",
// 			url: '/urls',
// 			data: $(this).serialize(), 
// 			dataType: 'json',
// 			success: function(data){
// 			  $('form > input[type="submit"]').val('Shorten');
// 			  $('form > input[type="submit"]').attr('disabled',false);
// 			  // var t = $.parseJSON(data);
// 			  var link = "<a href ='/"+ data.short_url + "' target='_blank'>" + data.short_url+ "</a>";
// 			  $('.output_table').append("<tr><td>" + data.long_url + "</td><td>" + link +
// 				"</td><td>" + data.click_count + "</td></tr>");