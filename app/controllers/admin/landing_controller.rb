class Admin::LandingController < ApplicationController
  def index
    if user = User.first
      redirect_to root_url and return if !current_user
      redirect_to root_url unless current_user.is_admin?
    elsif Role.first
      @user = User.new(email: 'super@admin.com', password: password)
      @user.password = password
      @user.password_confirmation = password

      @user.role_ids = Role.all.map{|r| r.id }
      @user.save!
    else
      @no_roles = true
    end
  end

  private
    def password
      @password ||= "password"
    end
end
