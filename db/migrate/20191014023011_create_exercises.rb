class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.integer :user_id
      t.text :name
      t.integer :rest_time
      t.integer :order

      t.timestamps
    end
  end
end
