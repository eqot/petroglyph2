class SolutionsController < ApplicationController

  before_action :set_solution, only: [:show, :edit, :update, :destroy]

  def index
    @solutions = Solution.all
  end

  def show
  end

  def new
    @solution = Solution.new
  end

  def create
    @solution = Solution.new(solution_params)
    if @solution.save
      redirect_to solutions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @solution.update(solution_params)
      redirect_to solutions_path
    else
      render 'edit'
    end
  end

  def destroy
    @solution.destroy
    redirect_to solutions_path
  end

  private

  def solution_params
    params[:solution].permit(:title, :description)
  end

  def set_solution
    @solution = Problem.find(params[:id])
  end

end
