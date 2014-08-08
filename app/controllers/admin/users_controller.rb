class Admin::UsersController < ApplicationController

  include UserParams

  before_filter :restrict_access_to_admins

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.full_name} was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
