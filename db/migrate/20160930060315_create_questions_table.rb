class CreateQuestionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_tables do |t|
    	t.belongs_to :user, index: true
    	t.text :content
    	t.timestamps null: false
    end
  end
end
