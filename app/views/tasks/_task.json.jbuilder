json.title @task.title

json.due_date formatted_date(@task.due_date)

json.user do
	json.name @task.user.name
end