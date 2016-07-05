class UsersController < ApplicationController
  def show
    @user = User.find(1)
    @comics = @user.comics

  end

  def create

  end

  def new

  end

  def edit
  end

  def update
  end

  def login

  end

  def

  def config
  end
end
