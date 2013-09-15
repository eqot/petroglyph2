class ProblemsController < ApplicationController

  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problems_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @problem.update(problem_params)
      redirect_to problems_path
    else
      render 'edit'
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path
  end

  private

  def problem_params
    params[:problem].permit(:title, :description)
  end

  def set_problem
    @problem = Problem.find(params[:id])
  end

end
