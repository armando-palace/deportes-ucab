class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:edit, :update, :show]
  before_action :get_roles, only: [:new, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, @user]
    else
      @roles = Role.all
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  def show
  end

  def index
    @users = User.all
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def get_roles
      @roles = Role.all
    end

    def user_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, role_ids: []
      )
    end
end
