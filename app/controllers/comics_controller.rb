class ComicsController < ApplicationController
  def top
    @comics = Comic.all
  end

  def show
    @comics = Comic.find(params[:id])
    @stories = Story.where("comic_id  = ?", @comics.id)
  end

  def search

  end
end
