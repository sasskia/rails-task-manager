class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find(task_id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    task_id = params[:id]
    @task = Task.find(task_id)
  end

  def update
    task_id = params[:id]
    @task = Task.find(task_id)
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    task_id = params[:id]
    @task = Task.find(task_id)
    @task.destroy
    redirect_to task_path(@task)
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
