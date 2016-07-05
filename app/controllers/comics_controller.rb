class ComicsController < ApplicationController
  def top

  end

  def show
    @comic = Comic.find(params[:id])
  end

  def search

  end
end
