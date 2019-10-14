class Api::WorkoutsController < ApplicationController
  before_action :authorize_request

  def index
    render json: { data: workouts }
  end

  def create
    workout = workouts.create!(allowed_params)
    render json: { data: workout }
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

  def workouts
    current_user.workouts.current
  end

  def workout
    workouts.find(params[:id])
  end

  def allowed_params
    params.permit(:name, :exercise_ids, :in_progress)
  end
end