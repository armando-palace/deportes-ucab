class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
    @user = User.new
    @roles = Role.all
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

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

    def user_params
      params.require(:user).permit(
        :email, :password, :password_confirmation, role_ids: []
      )
    end
end