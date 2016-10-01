class AnswersController < ApplicationController

	before_action :set_answer, only: [:edit, :show, :update, :destroy]

def create
end

def edit
end

def update
end

def show
end

def destroy
end

private
def set_question
	@question = Question.find(params[:id])
end

end
