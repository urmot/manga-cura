class ComicsController < ApplicationController
  def top
    @comics = Comic.limit(5)
    @monthly_conmics = Comic.limit(5).order("score_month DESC")
    @dayly_conmics = Comic.limit(5).order("score_day DESC")
  end

  def show
    @comics = Comic.find(params[:id])
    @stories = Story.where("comic_id  = ?", @comics.id)
    @writing = Writing.where("comic_id = ?", @comics.id)
  end

  def search
    @comics = params[:type] == 'title' ?
      get_comics_by_title(params[:query]) : get_comics_by_author(params[:query])
  end

  def read
    user_id = session[:user_id] #ログインしたユーザのID
    story_id = params[:read][:story_id] #特定の本のID
    url = params[:read][:url]
    read = Read.find_or_create_by(story_id: story_id, user_id: user_id)
    if read.save
      redirect_to url
    end
  end

  private

  def get_comics_by_title(query)
    Comic.where("title like :title", title: "\%#{query}\%")
  end

  def get_comics_by_author(query)
    author = Author.find_by("name like :name", name: "\%#{query}\%")
    author.blank? ? nil : author.comics
  end
end
