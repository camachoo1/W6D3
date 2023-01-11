class UsersController < ApplicationController
    def index
        # render plain: "I'm in the index action!"
      @users = User.all
      render json: @users
    end

    def create
      # debugger
      @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: @user.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: @user_url
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to user_url(@user)
      else
        render json: @user.errors.full_messages, status: 422
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
