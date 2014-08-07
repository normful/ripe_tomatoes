class Admin::UsersController < ApplicationController
  include UserParams

  def index
    @users = User.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
