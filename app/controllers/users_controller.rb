class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :edit]
  def index
    if params[:search] && !params[:search].blank?
      @users = User.where("name LIKE ?", "%#{params[:search]}%").page(params[:page])
    else
      @users = User.all.page params[:page]
    end
  end

  def show
  end

  def set_user
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'User was successfully destroyed.' }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def user_params
    params.require(:user).permit(:name, :email )
  end
end
