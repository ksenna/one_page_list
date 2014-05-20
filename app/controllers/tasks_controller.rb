class TasksController < ApplicationController

	respond_to :json

	def index
		@tasks = Task.all
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			respond_to do |format|
				format.js {render json: @task}
				format.html {redirect_to tasks_path}
			end
		else
			respond_to do |format|
				format.js {render plain "0"}
				format.html {render :index}
			end
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
			format.js { render plain: "Failed to update"}
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :completed)
	end
end