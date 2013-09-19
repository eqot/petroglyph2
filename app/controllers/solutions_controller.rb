class SolutionsController < ApplicationController

  def create
    @problem = Problem.find(params[:problem_id])
    @solution = @problem.solutions.create(solution_params)
    redirect_to problem_path(@problem.id)
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy
    redirect_to problem_path(params[:problem_id])
  end

  private

  def solution_params
    params[:solution].permit(:title, :description)
  end

end
