class QuestionVotesController < ApplicationController
	before_action :require_login, only: [:create]

	def create
		@question = Question.find(params[:question_id])
		vote_type = params[:commit]
		@vote = QuestionVote.find_by(question_id: @question.id, user_id: current_user.id)
		if vote_type == "Upvote"
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
				current_user.question_votes.create(question_id: @question.id, vote: 1)
				redirect_to @question
			end
		elsif vote_type == "Downvote"
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
				current_user.question_votes.create(question_id: @question.id, vote: 0)
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
