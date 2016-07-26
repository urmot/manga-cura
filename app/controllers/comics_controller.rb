class ComicsController < ApplicationController
  def top
    @comics = Comic.all
  end

  def show
    @comic = Comic.find(params[:id])
  end

  def search

  end
end
