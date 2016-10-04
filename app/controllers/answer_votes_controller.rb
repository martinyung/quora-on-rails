class AnswerVotesController < ApplicationController
	before_action :require_login, only: [:create]

	def create
		@answer = Answer.find(params[:answer_id])
		@question = Question.find(@answer.question_id)
		vote_type =  params[:commit][0..3]
		@vote = AnswerVote.find_by(answer_id: @answer.id, user_id: current_user.id)
		if vote_type == "Upvo"
			if @vote # Check if question has been voted by user
				if @vote.vote == 1 # Check if vote is an upvote
					@message = "You can only upvote once per question"
					redirect_to @question
				else # If vote is a downvote, change vote to upvote
					@message = "Your vote has been changed to upvote"
					@vote.update(vote: 1)
					redirect_to @question
				end
			else # If question has not been voted, create new vote
				@message = "You have upvoted for this question"
				current_user.answer_votes.create(answer_id: @answer.id, vote: 1)
				redirect_to @question
			end
		elsif vote_type == "Down"
			if @vote # Check if question has been voted by user
				if @vote.vote == 0 # Check if vote is an downvote
					@message = "You can only downvote once per question"
					redirect_to @question
				else # If vote is a downvote, change vote to upvote
					@message = "Your vote has been changed to downvote"
					@vote.update(vote: 0)
					redirect_to @question
				end
			else # If question has not been voted, create new vote
				@message = "You have downvoted for this question"
				current_user.answer_votes.create(answer_id: @answer.id, vote: 0)
				redirect_to @question
			end
		end
	end

	private

	def require_login
		unless user_signed_in?
			flash[:alert] = "You must logged in to perform this action"
			redirect_to new_user_session_path
		end
	end
end
