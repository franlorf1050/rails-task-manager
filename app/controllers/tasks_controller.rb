class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    if @tasks.save
      redirect_to tasks_path(@tasks)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tasks.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @tasks = Task.find(params[:id])
  end
end
