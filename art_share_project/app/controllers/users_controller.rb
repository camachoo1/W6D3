class UsersController < ApplicationController
  def index
    if params[:username]
      @user = User.find_by('username ~ ?', params[:username])
      return render json: @user
    else
      @users = User.all
      render json: @users
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to users_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def destroy
    @user = User.find_by(params[:id])
    if @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = User.find_by(params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
