class Question < ApplicationRecord
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :question_votes, dependent: :destroy

	def count_upvotes
		self.question_votes.where(vote: 1).count
	end

	def count_downvotes
		self.question_votes.where(vote: 0).count
	end
end
