class Api::UsersController < ApplicationController
  before_action :authorize_request
  before_action :find_user, except: :index

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:name, :username, :email, :password, :password_confirmation)
  end
end
