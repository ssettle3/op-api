require "#{Rails.root}/lib/workouts/creator"

class Api::WorkoutsController < ApplicationController
  before_action :authorize_request

  def index
    render json: current_workouts, each_serializer: ::WorkoutSerializer, root: 'data'
  end

  def create
    workout = Workouts::Creator.call(user_id: current_user.id, params: allowed_params)
    render json: workout, serializer: ::WorkoutSerializer, root: 'data'
  end

  def show
    render json: { data: workout }
  end

  def update
    workout.update!(allowed_params)
    render json: { data: workout}
  end

  def destroy
    workout.update!(deleted: true)
    head :no_content
  end

  private

  def current_workouts
    current_user.workouts.current
  end

  def workout
    current_workouts.current.find(params[:id])
  end

  def allowed_params
    params.permit(:name, :exercise_ids, :in_progress)
  end

  def workouts
    current_user.workouts
  end
end