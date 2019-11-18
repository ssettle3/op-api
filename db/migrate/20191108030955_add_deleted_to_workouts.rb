class AddDeletedToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :deleted, :boolean, default: false
  end
end
