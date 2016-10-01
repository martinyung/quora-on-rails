class QuestionsController < ApplicationController
	before_action :set_question, only: [:edit, :show, :update, :destroy]

	def index
		@questions = Question.all
	end

	def show
	end

	def new
		@question = Question.new
	end

	def edit
	end

	def create
		@question = current_user.questions.new(content: params[:content])
		if @question.save
			redirect_to @question 
		else
			redirect_to root_path
		end
	end

	def update
		@question.update(question_params)
		redirect_to @question
	end

	def destroy
		@question.destroy
		redirect_to root_path
	end

	private

	def set_question
		@question = Question.find(params[:id])
	end

	def question_params
		params.require(:question).permit(:content)
	end

end
