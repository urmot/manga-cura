class UsersController < ApplicationController

  def show
    @user = User.find(1)
    @comics = @user.books
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

  def edit
  end

  def update

  end

  def login

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :gender, :birthday, :email)
  def

  def config

  end

end
