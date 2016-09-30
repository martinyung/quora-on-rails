class StaticController < ApplicationController
	def index
		@questions = Question.all
	end
end
