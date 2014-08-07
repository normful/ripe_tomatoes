class Admin::UsersController < ApplicationController

  include UserParams

  before_filter :restrict_access_to_admins

  def index
    @users = User.page(params[:page])
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
