class Workout < ApplicationRecord
  has_many :exercises
  belongs_to :user

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :user_id

  def self.current
    where(deleted: false)
  end
end