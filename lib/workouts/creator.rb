module Workouts
  class Creator
    def self.call(user_id:, params:)
      new(user_id: user_id, params: params).call
    end

    def initialize(user_id:, params:)
      @user_id = user_id
      @params = params
    end

    def call
      if deleted_workout
        deleted_workout.update!(deleted: false) if deleted_workout
        deleted_workout
      else
        workout = Workout.create!(user_id: user_id, name: params[:name])
      end
    end

    private

    attr_reader :user_id, :params

    def deleted_workout
      @deleted_workout ||= Workout.where(user_id: user_id, name: name, deleted: true).first
    end

    def name
      params[:name]
    end
  end
end