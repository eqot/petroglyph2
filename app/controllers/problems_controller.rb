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

	def edit
		@problem = Problem.find(params[:id])
	end

	def update
		@problem = Problem.find(params[:id])
		if @problem.update(problem_params)
			redirect_to problems_path
		else
			render 'edit'
		end
	end

	def destroy
		@problem = Problem.find(params[:id])
		@problem.destroy
		redirect_to problems_path
	end

	private

	    def problem_params
	    	params[:problem].permit(:title, :description)
	    end

end
