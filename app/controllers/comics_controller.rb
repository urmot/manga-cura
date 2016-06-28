class ComicsController < ApplicationController
  def top

  end

  def show
    @comic = Book.find(params[:id])
  end

  def favorite
    mura = User.first
    comic = Book.find(1)
    mura.books << comic
    mura.save

  end

  def search

  end
end
