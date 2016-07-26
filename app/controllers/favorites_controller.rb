class FavoritesController < ApplicationController

    #お気に入り登録用アクション
  def create
    @user_id = session[:id] #ログインしたユーザのID
    @comic_id = Comic.find(params[:id]).id #特定の本のID
    @day = Time.now
    @favorite = Favorite.create(comic_id: @comic_id, user_id: @user_id, date: @day)
    if @favorite.save
      #保存に成功した場合、本一覧画面に戻る
      redirect_to @comic_id
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to user_path(session[:id])
  end

end
