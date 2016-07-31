class UsersController < ApplicationController
  before_action :set_user, only: [:show, :add_favorite,:history]

  def show
    @favorites = Favorite.where("user_id = ?", @user)
    @favorites_count = @favorites.count
    @reads = Read.where("user_id = ?", @user)
    @writing = Writing.all
    @comics = Kaminari.paginate_array(@user.comics).page(params[:page]).per(6)

  #  @comics = Favorite.page(params[:page])
  end

  def history
    @reads = Read.where("user_id = ?", @user)
    @favorites = Favorite.where("user_id = ?", @user)
    @favorites_count = @favorites.count
    @stories = Kaminari.paginate_array(@user.stories).page(params[:page]).per(10)
  end

  #新規ユーザー作成用アクション
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

  #ユーザー退会用アクション
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

  def set_user
    @user = session[:user_id].nil? ? User.find(params[:id]) : User.find(session[:user_id])
  end

end
