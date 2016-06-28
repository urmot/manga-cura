class ComicsController < ApplicationController
  def top

  end

  def show
    @comic = Book.find(params[:id])
  end
  
  def search

  end
end
