class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where("user_id  = ?", @user)
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

  #お気に入り登録用アクション
 def add_favorite
   #@user_id = session[:id] #ログインしたユーザのID
   @user_id = "1"
   @book_id = Book.find(params[:id]).id #特定の本のID
   @day = Time.now
   #book_idに@book_id、user_idに@user_idを入れて、Favoriteモデルに新しいオブジェクトを作る
   @favorite = Favorite.new(book_id: @book_id, user_id: @user_id, date: @day)
   if @favorite.save
     #保存に成功した場合、本詳細画面に戻る
     redirect_to comic_path
   end
 end

 #お気に入り削除用アクション
 def destroy_favorite
   @favorite = Favorite.find(params[:id])
   if @favorite.destroy
     #削除に成功した場合、ログインしている本棚画面に戻る
     #redirect_to users_path(session[:id])
     redirect_to users_path(1)
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

end
