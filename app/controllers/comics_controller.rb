class ComicsController < ApplicationController
  def top

  end

  def show
    @comics = Book.find(params[:id])
  end

  def search

  end
end
