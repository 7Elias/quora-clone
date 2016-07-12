$(document).ready(function() {
	$('form').submit(function(){

		event.preventDefault();
		$('form >')
	});
});

// $(document).ready(function(){
// 	$("form").submit(function(event){
		
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
// 			} 
// 		});
// })})