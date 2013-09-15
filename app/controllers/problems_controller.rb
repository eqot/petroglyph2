class ProblemsController < ApplicationController

	def index
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
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

	private

	    def problem_params
	    	params[:problem].permit(:title, :description)
	    end

end
