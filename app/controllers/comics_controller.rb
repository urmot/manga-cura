class ComicsController < ApplicationController
  def top

  end

  def show
    @comics = Comic.find(params[:id])
  end

  def search

  end
end
