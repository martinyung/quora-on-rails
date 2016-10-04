class CreateQuestionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_votes do |t|
    	t.belongs_to :question, index: true
    	t.belongs_to :user, index: true
    	t.integer :vote
      t.timestamps
    end
  end
end
