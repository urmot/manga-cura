class ComicsController < ApplicationController
  def top
    @comics = Comic.all
  end

  def show
    @comics = Comic.find(params[:id])
  end

  def search

  end
end
