class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.text :name
      t.boolean :in_progress
      t.datetime :last_completed
      t.integer :user_id

      t.timestamps
    end
  end
end
