class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create ]
  before_action :logged_in_user, except: [:new, :show, :create ]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.lastest.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
    render "edit"
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User deleted"
      console.log("aaaa")
      redirect_to users_url
    else
      flash[:error] = " delete fails"
      redirect_to users_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    redirect_to (root_url)  unless current_user? @user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warming] = "user not found"
    redirect_to root_path
  end
end
