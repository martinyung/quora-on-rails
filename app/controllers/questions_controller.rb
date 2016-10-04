class QuestionsController < ApplicationController
	before_action :set_question, only: [:edit, :show, :update, :destroy]
	before_action :require_login, only: [:create, :update, :destroy]

	def index
		@questions = Question.all
	end

	def show
		@answers = @question.answers
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

	def require_login
		unless user_signed_in?
			flash[:alert] = "You must logged in to perform this action"
			redirect_to new_user_session_path
		end
	end

end
