class UsersController < ApplicationController
  def show

  end

  def create
    @user = User.new(user_params)

        if @user.save
          redirect_to @user
        else
          render 'new'
        end
  end

  def new
    @user = User.new
  end

  def login

  end

  def

  def config

  end

  private

  def user_params
    params.require(:user).permit(:pass, :name, :male, :birthday, :email)
  end

end
