class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.string :answer
      t.integer :level
      t.integer :user_id

      t.timestamps
    end
  end
end
