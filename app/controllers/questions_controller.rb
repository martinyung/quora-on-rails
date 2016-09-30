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
		@question = current_user.questions.new(question_params)
		if @question.save
			redirect_to @question
		else
			format.html { redirect_to_root_path, notice: "Failed to post question" }
		end

	end

	private

	def set_question
		@question = Question.find(params[:id])
	end

	def question_params
		params.require(:question).permit(:user_id, :content)
	end
end
