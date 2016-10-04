class Answer < ApplicationRecord
	belongs_to :question
	belongs_to :user
	has_many :answer_votes, dependent: :destroy
	
	def count_upvotes
		self.answer_votes.where(vote: 1).count
	end

	def count_downvotes
		self.answer_votes.where(vote: 0).count
	end
end
