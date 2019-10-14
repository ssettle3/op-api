class CreateOutputs < ActiveRecord::Migration[5.1]
  def change
    create_table :outputs do |t|
      t.integer :user_id
      t.integer :workout_id
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
