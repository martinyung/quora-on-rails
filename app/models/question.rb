class Question < ApplicationRecord
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :question_votes, dependent: :destroy
end
