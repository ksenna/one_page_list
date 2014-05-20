class TasksController < ApplicationController

	def index
		@tasks = Task.all
		respond_to do |format|
			format.js
			format.html
		end
	end

	def create
		@tasks = Task.all
		@task = Task.new(task_params)
		if @task.save
			# respond_to do |format|
			# 	format.js {render json: @task}
			# 	format.html {redirect_to tasks_path}
			# end
			render :index
		else
			# respond_to do |format|
			# 	format.js {render plain "0"}
			# 	format.html {render :index}
			# end
			render nothing: true
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(task_params)
			respond_to do |format|
				format.js {render json: @task}
				format.html {redirect_to tasks_path}
			end
		else
			# format.js { render plain: "Failed to update"}
			respond_to do |format|
				format.js { render plain: "0" }
				format.html { redirect_to tasks_path, notice: "Failed to update."}
			end
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :completed, :due_date, :user_id)
	end
end