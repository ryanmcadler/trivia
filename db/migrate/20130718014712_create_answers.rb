class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.string :answer
      t.boolean :correct

      t.timestamps
    end
  end
end
