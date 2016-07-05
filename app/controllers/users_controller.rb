class UsersController < ApplicationController
  def show
    #ユーザーID1でテスト
    @user = User.find(1)
    @favorites = Favorite.where("user_id  = ?", @user)

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

  end

  def edit
  end

  def update
  end

  def login

  end

  def setting

  end

end
