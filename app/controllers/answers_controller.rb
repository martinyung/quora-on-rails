class AnswersController < ApplicationController

	before_action :set_question, only: [:new, :create]

	def create
		@answer = current_user.answers.new(answer_params)
		@answer.question = @question
		if @answer.save
			redirect_to @question
		else
			@errors = @answer.errors.full_messages
			render :new
		end
	end

	def new
		@answer = Answer.new
	end

	def edit
		@answer = Answer.find(params[:id])

	end

	def update
		@answer = Answer.find(params[:id])
		@answer.update(answer_params)
		@question = @answer.question
		redirect_to @question
	end

	def show
	end

	def destroy
		@answer = Answer.find(params[:id])
		@question = @answer.question
		@answer.destroy
		redirect_to @question
	end

	private
	def set_question
		@question = Question.find(params[:question_id])
	end

	def answer_params
		params.require(:answer).permit(:answer, :question_id)
	end

end
