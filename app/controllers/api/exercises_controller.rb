class Api::ExercisesController < ApplicationController
  before_action :authorize_request

  def index
    render json: { data: exercises }
  end

  def create
    exercise = exercises.create!(allowed_params)
    render json: { data: exercise }
  end

  def show
    render json: { data: exercise }
  end

  def update
    exercise.update!(allowed_params)
    render json: { data: exercise}
  end

  def destroy
    exercise.update!(deleted: true)
    head :no_content
  end

  private

   def exercises
    current_user.exercises.current
  end

  def exercise
    exercises.find(params[:id])
  end

  def allowed_params
    params.permit(:name, :rest_time)
  end
end