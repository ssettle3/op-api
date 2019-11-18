class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :user

  def self.base_exercises
    JSON.parse(File.read("lib/base_exercises.json"))
  end
end