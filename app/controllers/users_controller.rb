class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    debugger

    redirect_to new_user_path
  end

  def show
  end

  private

    def user_params
      params.require(:user).permit(
        :id_card, :first_name, :middle_name, :last_name,
        :dorsal_number, :school, :period
      )
    end
end