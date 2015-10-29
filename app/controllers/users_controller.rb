class UsersController < ApplicationController
  def index
  end

  def show
    @users = User.all
  end

  def create
  end

  def new
  end
  
  def edit
  end
end
