$(function(){

	$('close').click(function(){

	})

	$('form').on('ajax:complete', function(event, data, status, xhr){
		var task = $.parseJSON(data.responseText),
				title = task.title;
		$('#taskList').append('<li>' + title + '</li>');
		$('#modal-one').toggle('modal');
	});

	$('form').on('ajax:complete', function(event, data, status, xhr){
		var task = $.parseJSON(data.responseText),
				task_li = document.getElementById(data.id)
				title = task.title;
		$('#task_li').replace('<li>' + title + '</li>');
	});

	$('#deleteTask').click(function(){
		var task_li = $(this).parent();
		var id = $(this).attr("id");
		var string = 'id='+ id;
		var task_id = $(this).attr('data-task-id');

		$.ajax({
			url: "/tasks/" + task_id,
			type: "POST"
			dataType: "json"
			contentType: "application/json",
			beforeSend: function(xhr)
			{
				xhr.setRequestHeader("X-Http-Method-Override", "DELETE");
			}
			
		});
	});

});