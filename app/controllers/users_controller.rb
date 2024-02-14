class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    # user = User.find[params[:id]]

    render json: @users, status: 200
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    # user = User.find(params[:id]) 

    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: @user.errors, status: :unprocessable_entity
  end

  def posts_index
    user = User.find(params[:user_id])
    user_posts = user.posts

    render json: user_posts, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require[:user].permit(:user_name, :email, :first_name, :last_name)
  end
end
end 