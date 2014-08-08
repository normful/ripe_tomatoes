class Admin::UsersController < ApplicationController

  include UserParams

  before_filter :restrict_access_to_admins

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.joins(:user).where(user: @user)
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    UserMailer.farewell_email(@user).deliver
    redirect_to admin_users_path
  end

end
