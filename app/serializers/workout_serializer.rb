class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_completed, :in_progress

  has_many :exercises, serializer: ExerciseSerializer
end