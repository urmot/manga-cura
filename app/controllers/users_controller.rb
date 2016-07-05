class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comics = @user.comics
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

  def destroy
    @user = User.find(params[:id]).destroy
    #flash[:success]="User deleted"
    redirect_to top_path
  end

  def update

  end

  def login

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :gender, :birthday, :email)
  end

  def setting

  end

end
