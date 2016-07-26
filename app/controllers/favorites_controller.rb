class FavoritesController < ApplicationController

    #お気に入り登録用アクション
  def create
    user_id = session[:user_id] #ログインしたユーザのID
    comic_id = params[:favorite][:comic_id] #特定の本のID
    day = Time.now
    favorite = Favorite.new(comic_id: comic_id, user_id: user_id, date: day)
    if favorite.save
      #保存に成功した場合、本一覧画面に戻る
      redirect_to comic_path(comic_id)
    end
  end

  #お気に入り削除用アクション
  def destroy
    @favorite = Favorite.find_by(user_id: session[:user_id], comic_id: params[:id])

    if @favorite.destroy
      #削除に成功した場合、ログインしているユーザの詳細画面に戻る
      redirect_to user_path(session[:user_id])
    end
  end

end
