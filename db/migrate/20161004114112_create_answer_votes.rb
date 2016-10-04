class CreateAnswerVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_votes do |t|
    	t.belongs_to :answer, index: true
    	t.belongs_to :user, index: true
    	t.integer :vote
      t.timestamps
    end
  end
end
